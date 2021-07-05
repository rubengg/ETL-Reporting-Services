using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    String[] routes = new String[4];
    Boolean[] checks = new Boolean[4];
    String generalroute = @"\\EQUIPOC02\Users\gcastillos\Desktop\ETL\project_integration_services\";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gtngroups_Click(object sender, EventArgs e)
    {
        Response.Redirect("ConfigGroups.aspx");
    }
    protected void btncustomer_Click(object sender, EventArgs e)
    {
        Response.Redirect("ConfigCustomers.aspx");
    }
    protected void btnitem_Click(object sender, EventArgs e)
    {
        Response.Redirect("ConfigItem.aspx");
    }
    /*
     * Call the method 'runPackage'
     */
    protected void btnmanualrun_Click(object sender, EventArgs e)
    {
        routes[0] = generalroute + @"ETL Integration Services\ETLSM9\ETLSM9\SM9.dtsx";
        routes[1] = generalroute + @"ETL Integration Services\ETLVWM\ETLVWM\VWM.dtsx";
        routes[2] = generalroute + @"ETL Integration Services\ETLGNP\ETLGNP\GNP.dtsx";
        routes[3] = generalroute + @"ETL Integration Services\ETLRemedy\ETLRemedy\Remedy.dtsx";
        for (int i = 0; i < routes.Length; i++) runPackage(routes[i], labelresultrun);
        /*if (countChecked() > 0)
        {
            for (int i = 0; i < routes.Length; i++)
                if (checkboxchoose.Items[i].Selected)
                    runPackage(routes[i], labelresultrun);
        }
        else labelresultrun.Text = "Select at least one option";*/
    }
    private void countChecked()
    {

    }
    /*
     * Execute the package whose String 'urlPkg'
     * is the same with the SSIS' name
     */
    private void runPackage(String urlPkg, Label result)
    {
        Microsoft.SqlServer.Dts.Runtime.Application app = new Microsoft.SqlServer.Dts.Runtime.Application();
        Microsoft.SqlServer.Dts.Runtime.Package pkg = null;
        //Check if the file exist
        if (System.IO.File.Exists(urlPkg))
        {
            //Execute the package
            pkg = app.LoadPackage(urlPkg, null);
            Microsoft.SqlServer.Dts.Runtime.DTSExecResult results = pkg.Execute();
            if (results == Microsoft.SqlServer.Dts.Runtime.DTSExecResult.Failure)
            {
                foreach (Microsoft.SqlServer.Dts.Runtime.DtsError local_DtsError in pkg.Errors)
                    result.Text = String.Format("Results: {0} <br>", local_DtsError.Description.ToString());
            }
            result.Text = results.ToString();
        }
        else result.Text = "ETL not found";
    }
    protected void btnmapping_Click(object sender, EventArgs e)
    {
        runPackage(generalroute + @"ETL Mapping\ETL1.0\Package.dtsx", labelresultmapping);
    }
    protected void btnemail_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "showPopUp", "showPopUp();", true);
    }
}
