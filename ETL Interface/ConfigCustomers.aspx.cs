using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ConfigCustomers : System.Web.UI.Page
{

    ConnectionSQL mysql = new ConnectionSQL();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonAddCustomer_Click(object sender, EventArgs e)
    { 
        String customer = TextBoxNewCustomer.Text.ToUpper();
        String p1 = TextBoxPriority1.Text;
        String p2 = TextBoxPriority2.Text;
        String p3 = TextBoxPriority3.Text;
        String p4 = TextBoxPriority4.Text;
        if (customer.Trim().Equals(""))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "alert('You must write at least the customer name')", true);
        }
        else
        {
            mysql.openConnection();
            String response = mysql.addCustomer(String.Format("INSERT INTO [dbo].[customers] ([name],[priority1],[priority2],[priority3],[priority4]) VALUES('{0}','{1}','{2}','{3}','{4}')", customer, p1, p2, p3, p4), customer);
            Response.Write(response);
            GridViewCustomers.DataBind();
            DropDownListCustomers.DataBind();
            mysql.closeConnection();
        }
    }
    protected void ButtonDeleteCustomer_Click(object sender, EventArgs e)
    {
        String customer = DropDownListCustomers.SelectedValue,
            q1 = String.Format("DELETE FROM [dbo].locations WHERE shortName = '{0}'", customer),
            q2 = String.Format("DELETE FROM [dbo].[customers] WHERE name = '{0}'", customer);
        mysql.openConnection();
        String response = mysql.deleteCustomer(q1, q2, customer);
        Response.Write(response);
        GridViewCustomers.DataBind();
        DropDownListCustomers.DataBind();
        mysql.closeConnection();
    }
    protected void ButtonAddLocation_Click(object sender, EventArgs e)
    {
        String query;
        String location = TextBoxNewLocation.Text.ToUpper();
        String customer = DropDownListCustomers.SelectedValue;
        if (location.Trim().Equals(""))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "alert('You have to write the location')", true);
        }
        else
        {
            mysql.openConnection();
            query = String.Format("INSERT INTO [dbo].[locations]([location],[shortName])VALUES('{0}','{1}')", location, customer);
            String response = mysql.addLocation(query, location);
            Response.Write(response);
            GridViewLocations.DataBind();
            mysql.closeConnection();
        }
    }
    protected void checkboxlocationnull_CheckedChanged(object sender, EventArgs e)
    {
        if (checkboxlocationnull.Checked)
        {
            DropDownListCustomers.Enabled = false;
            ButtonDeleteCustomer.Enabled = false;
            TextBoxNewLocation.Enabled = false;
            ButtonAddLocation.Enabled = false;
            GridViewLocations.Visible = false;
            GridViewlocationnull.Visible = true;
        }
        else
        {
            DropDownListCustomers.Enabled = true;
            ButtonDeleteCustomer.Enabled = true;
            TextBoxNewLocation.Enabled = true;
            ButtonAddLocation.Enabled = true;
            GridViewLocations.Visible = true;
            GridViewlocationnull.Visible = false;
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

}