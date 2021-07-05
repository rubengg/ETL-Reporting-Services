using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    String[] routes = new String[4];
    String generalroute = @"C:\ETL\project_integration_services\ETL Integration Services\";
    protected void Page_Load(object sender, EventArgs e)
    {
        labelresultrun.Text = "";
    }
    protected void btnmanualrun_Click(object sender, EventArgs e)
    {
        routes[0] = generalroute + "SM9.dtsx";
        routes[1] = generalroute + "VWM.dtsx";
        routes[2] = generalroute + "GNP.dtsx";
        routes[3] = generalroute + "Remedy.dtsx";
        if (countChecked() > 0)
        {
            for (int i = 0; i < routes.Length; i++)
                if (checkboxchoose.Items[i].Selected)
                    runPackage(routes[i]);
        }
        else labelresultrun.Text = "Select at least one option";
    }
    protected void checkboxall_CheckedChanged(object sender, EventArgs e)
    {
        if (checkboxall.Checked)
            for (int i = 0; i<checkboxchoose.Items.Count; i++) checkboxchoose.Items[i].Selected = true;
        else
            for (int i = 0; i<checkboxchoose.Items.Count; i++) checkboxchoose.Items[i].Selected = false;
    }
    protected void checkboxchoose_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (countChecked() == 4) checkboxall.Checked = true;
        else checkboxall.Checked = false;
    }
    private void runPackage(String urlPkg)
    {
        Microsoft.SqlServer.Dts.Runtime.Application app = new Microsoft.SqlServer.Dts.Runtime.Application();
        Microsoft.SqlServer.Dts.Runtime.Package pkg = null;
        if (System.IO.File.Exists(urlPkg))
        {
            pkg = app.LoadPackage(urlPkg, null);
            Microsoft.SqlServer.Dts.Runtime.DTSExecResult results = pkg.Execute();
            if (results == Microsoft.SqlServer.Dts.Runtime.DTSExecResult.Failure)
            {
                foreach (Microsoft.SqlServer.Dts.Runtime.DtsError local_DtsError in pkg.Errors)
                    labelresultrun.Text = String.Format("Results: {0} <br>", local_DtsError.Description.ToString());
            }
            labelresultrun.Text = results.ToString();
        }
        else labelresultrun.Text = "ETL not found";
    }
    private int countChecked()
    {
        int counter = 0;
        for (int i = 0; i < checkboxchoose.Items.Count; i++)
            if (checkboxchoose.Items[i].Selected) counter++;
        return counter;
    }
}
