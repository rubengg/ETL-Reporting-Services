using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

public partial class ConfigCustomers : System.Web.UI.Page
{

    String connection = "Data Source=SERVER08DB02;Integrated Security=SSPI;Initial Catalog=\"ETL Reporting Services\"";
    
    SqlConnection SQLConect;

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
            SQLConect = new SqlConnection(connection);
            try
            {
                String query;
                SQLConect.Open();
                query = String.Format("INSERT INTO [dbo].[customers] ([name],[priority1],[priority2],[priority3],[priority4]) VALUES('{0}','{1}','{2}','{3}','{4}')", customer, p1, p2, p3, p4);
                SqlCommand cmd = new SqlCommand(query, SQLConect);
                try
                {
                    cmd.ExecuteNonQuery();
                    Response.Write("Se insertó correcamente: " + customer);
                    GridViewCustomers.DataBind();
                    DropDownListCustomers.DataBind();
                    SQLConect.Close();
                }
                catch (SqlException sqlex)
                {
                    Response.Write("Error al insetar: " + customer);
                    SQLConect.Close();
                    throw(sqlex);
                }

            }
            catch (Exception ex) { Response.Write("Error: No se puede conectar a la base de datos"); }
        }
    }
    protected void ButtonDeleteCustomer_Click(object sender, EventArgs e)
    {
        
        SQLConect = new SqlConnection(connection);
        String customer = DropDownListCustomers.SelectedValue;

        String q1,q2;

        try
        {
            SQLConect.Open();
            q1 = String.Format("DELETE FROM [dbo].locations WHERE shortName = '{0}'",customer);
            SqlCommand cmd1 = new SqlCommand(q1, SQLConect);

            q2 = String.Format("DELETE FROM [dbo].[customers] WHERE name = '{0}'", customer);
            SqlCommand cmd2 = new SqlCommand(q2, SQLConect);

            try
            {
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                Response.Write("Se eliminó correcamente: " + customer+" y todas sus localizaciones");
                GridViewCustomers.DataBind();
                DropDownListCustomers.DataBind();
                SQLConect.Close();
            }
            catch (SqlException sqlex)
            {
                Response.Write("Error al eliminar: " + customer);
                SQLConect.Close();
            }

        }
        catch (Exception ex) { Response.Write("Error: No se puede conectar a la base de datos"); }

        /*
DELETE FROM [dbo].locations WHERE shortName = 'Polices Tec'
DELETE FROM [dbo].[customers] WHERE name = 'Polices Tec'
         */
    }
    protected void ButtonAddLocation_Click(object sender, EventArgs e)
    {
        String query;
        String location = TextBoxNewLocation.Text.ToUpper();
        String customer = DropDownListCustomers.SelectedValue;

        SQLConect = new SqlConnection(connection);
        if (location.Trim().Equals(""))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "alert('You have to write the location')", true);
        }
        else
        {
            try
            {
                SQLConect.Open();
                query = String.Format("INSERT INTO [dbo].[locations]([location],[shortName])VALUES('{0}','{1}')", location, customer);

                SqlCommand cmd = new SqlCommand(query, SQLConect);
                try
                {
                    cmd.ExecuteNonQuery();
                    Response.Write("Se insertó correcamente: " + location);
                    GridViewLocations.DataBind();
                    SQLConect.Close();
                }
                catch (SqlException sqlex)
                {
                    Response.Write("Error al insetar: " + location);
                    SQLConect.Close();
                }

            }
            catch (Exception ex) { Response.Write("Error: No se puede conectar a la base de datos"); }
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