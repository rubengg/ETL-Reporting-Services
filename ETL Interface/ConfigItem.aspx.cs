using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Configuration_Item : System.Web.UI.Page
{
    ConnectionSQL conection = new ConnectionSQL();
    protected void Page_Load(object sender, EventArgs e)
    {
        int nullCI = conection.countGroupNull("SELECT COUNT([configuration_item]) AS 'counter' FROM [ETL Reporting Services].[dbo].[ci] WHERE ci_type is null");

        if (nullCI > 0)
        {
            LabelCounterCI.BackColor = System.Drawing.ColorTranslator.FromHtml("#E20074");
            LabelCounterCI.ForeColor = System.Drawing.Color.White;
            LabelCounterCI.Text = "There are " + nullCI + " CI without mapping";
        }
        else
        {
            LabelCounterCI.BackColor = System.Drawing.ColorTranslator.FromHtml("#64B9E4");
            LabelCounterCI.ForeColor = System.Drawing.Color.Black;
            LabelCounterCI.Text = "Mappings Complete";
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}