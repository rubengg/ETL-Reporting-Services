<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmailConfiguration.aspx.cs" Inherits="EmailConfiguration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/header_config.css" rel="stylesheet" type="text/css" />
    <link href="Styles/button.css" rel="stylesheet" type="text/css" />
    <!--Ask if the user wants to delete the record-->
    <script src="Scripts/popup.js" type="text/javascript"></script>
    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to delete this record?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            //Return the value
            document.forms[0].appendChild(confirm_value);
        }
    </script>
</head>
    <body>
        <form id="form1" runat="server">
            <div class="headerconfigdiv">
                Email Configuration
            </div>
            <asp:Label ID="Label1" runat="server" Text="Add new address"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtemail" runat="server" placeholder="Email" Width="433px"></asp:TextBox>
            <asp:Button ID="Button1" class="btn" runat="server" Text="Add" onclick="Button1_Click" />
            <br />
            <br />
            <div>
                <asp:Table ID="tableemail" runat="server" BorderStyle="Double" 
                    BorderWidth="10px">
                </asp:Table>
            </div>
        </form>
    </body>
</html>
