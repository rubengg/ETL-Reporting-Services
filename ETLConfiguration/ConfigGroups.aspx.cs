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

    protected void Page_Load(object sender, EventArgs e){}
    protected void ButtonAceptar_Click(object sender, EventArgs e)
    {
        group = TextBoxLocation.Text.Trim();
        if (group.Trim().Equals(""))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "alert('You have to write the group name')", true);
        }
        else
        {
            if (DropDownListGroups.Visible) shortname = DropDownListGroups.SelectedValue;
            else shortname = TextBoxNewGroup.Text;
            if (DropDownListTower.Visible) tower = DropDownListTower.SelectedValue;
            else tower = TextBoxNewTower.Text;
            String connection = "Data Source=SERVER08DB02;Integrated Security=SSPI;Initial Catalog=\"ETL Reporting Services\"";
            String query;
            SqlConnection SQLConect = new SqlConnection(connection);
            SqlCommand cmd;
            /*Insert new group*/
            try
            {
                SQLConect.Open();
                query = "INSERT INTO [dbo].[groups]([name],[shortName],[tower]) VALUES('" + group + "','" + shortname + "','" + tower + "')";
                cmd = new SqlCommand(query, SQLConect);
                //Ejecucion del comando en el servidor de BD
                cmd.ExecuteNonQuery();
                Response.Write("Se insertó correcamente: " + group + " " + shortname + " " + tower);
                GridViewGroups.DataBind();
                SQLConect.Close();
            }
            /*The group exist or is hide*/
            catch (SqlException) {
                SqlDataReader reader;
                query = "SELECT * FROM [dbo].[groups] WHERE [name] = '" + group + "'";
                cmd = new SqlCommand(query, SQLConect);
                reader = cmd.ExecuteReader();
                reader.Read();
                shortname = reader["shortName"].ToString();
                tower = reader["tower"].ToString();
                int visible = Convert.ToInt32(reader["visible"]);
                if (visible == 0)
                {
                    
                }
                else
                {
                    String jsScript = "var answer=confirm('The group " + group + " has the following data:\\nShort name: " + shortname + "\\nTower: " + tower + "\\nDo you want update this information?');\n";
                    jsScript += "if(answer){\n";
                    jsScript += " alert(\"you responded OK\");\n";
                    jsScript += "}\n";
                    jsScript += "else{//the answer is CANCEL\n";
                    jsScript += " alert(\"you responded CANCEL\");\n";
                    jsScript += "}\n";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", jsScript, true);
                }
            }
            catch (Exception) { Response.Write("Error: No se puede conectar a la base de datos"); }
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