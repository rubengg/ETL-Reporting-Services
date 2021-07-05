using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

public partial class ConfigGroups : System.Web.UI.Page
{

    String group;
    String shortname;
    String tower;
    ConnectionSQL mysql = new ConnectionSQL();

    protected void Page_Load(object sender, EventArgs e)
    {
        int nullshortname = mysql.countGroupNull("SELECT COUNT(name) AS 'counter' FROM [ETL Reporting Services].[dbo].[groups] WHERE shortName IS NULL AND visible = 1");
        int nulltower = mysql.countGroupNull("SELECT COUNT(name) AS 'counter' FROM [ETL Reporting Services].[dbo].[groups] WHERE tower IS NULL AND visible = 1");
        labelcountnull.Text = "There are " + nullshortname + " groups without shortname<br>and " + nulltower + " without tower";
    }
    protected void ButtonAceptar_Click(object sender, EventArgs e)
    {
        group = TextBoxLocation.Text.Trim();
        if (group.Trim().Equals(""))    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "alert('You have to write the group name')", true);
        else
        {
            if (DropDownListGroups.Visible) shortname = DropDownListGroups.SelectedValue;
            else shortname = TextBoxNewGroup.Text;
            if (DropDownListTower.Visible) tower = DropDownListTower.SelectedValue;
            else tower = TextBoxNewTower.Text;
            String query = "INSERT INTO [dbo].[groups]([name],[shortName],[tower]) VALUES('" + group + "','" + shortname + "','" + tower + "')";
            mysql.openConnection();
            String response = mysql.addGroup(query, group);
            Response.Write(response);
            GridViewGroups.DataBind();
        }
    }

    protected void ButtonGroup_Click(object sender, EventArgs e)
    {
        if (DropDownListGroups.Visible)
        {
            DropDownListGroups.Visible = false;
            ButtonGroup.Text = "Cancel";
            TextBoxNewGroup.Visible = true;
        }
        else {
            DropDownListGroups.Visible = true;
            ButtonGroup.Text = "New Group";
            TextBoxNewGroup.Visible = false;
        }
    }
    protected void ButtonTower_Click(object sender, EventArgs e)
    {
        if (DropDownListTower.Visible)
        {
            DropDownListTower.Visible = false;
            ButtonTower.Text = "Cancel";
            TextBoxNewTower.Visible = true;
        }
        else
        {
            DropDownListTower.Visible = true;
            ButtonTower.Text = "New Tower";
            TextBoxNewTower.Visible = false;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}