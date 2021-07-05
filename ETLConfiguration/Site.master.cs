using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.SqlServer.Dts.Runtime;
using System.IO;

public partial class SiteMaster : System.Web.UI.MasterPage
{

//
    class MyEventListener : DefaultEvents
    {
        public override bool OnError(DtsObject source, int errorCode, string subComponent,
          string description, string helpFile, int helpContext, string idofInterfaceWithError)
        {
            // Add application-specific diagnostics here.
            Console.WriteLine("Error in {0}/{1} : {2}", source, subComponent, description);
            return false;
        }
    }
 
 //

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
}
