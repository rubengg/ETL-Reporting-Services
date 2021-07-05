<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="contenedor">
            <div id="header">
                <div id="headerleft">
                    <asp:Image ID="imgetl" runat="server" ImageUrl="~/Images/logo.png" />
                </div>
                <div id="headerright">
                </div>
            </div>
            <div id="thebody">
                <div class="slide" id="left">
                    <div class="centerdiv">
                        <!--Check for SM9-->
                        <div>
                            <div class="divlblcheck">
                                <br />
                                SM9
                            </div>
                            <div class="divlblcheck">
                                <div class="checketl">
                                    <input type="checkbox" value="yes" id="checkasm9" checked="checked" onchange="checkEtl(this)"/>
	                                <label for="checkasm9"></label>
                                    <asp:Label for="lblsm9" ID="lblsm9" runat="server" Text="check" Visible="false"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--Check for VWM-->
                        <div>
                            <div class="divlblcheck">
                                <br />
                                VWM
                            </div>
                            <div class="divlblcheck">
                                <div class="checketl">
                                    <input type="checkbox" value="yes" id="checkvwm" checked="checked" onchange="checkEtl(this)"/>
	                                <label for="checkvwm"></label>
                                </div>
                            </div>
                        </div>
                        <!--Check for GNP-->
                        <div>
                            <div class="divlblcheck">
                                <br />
                                GNP
                            </div>
                            <div class="divlblcheck">
                                <div class="checketl">
                                    <input type="checkbox" value="yes" id="checkgnp" checked="checked" onchange="checkEtl(this)"/>
	                                <label for="checkgnp"></label>
                                </div>
                            </div>
                        </div>
                        <!--Check for GM-->
                        <div>
                            <div class="divlblcheck">
                                <br />
                                GM
                            </div>
                            <div class="divlblcheck">
                                <div class="checketl">
                                    <input type="checkbox" value="yes" id="checkgm" checked="checked" onchange="checkEtl(this)"/>
	                                <label for="checkgm"></label>
                                </div>
                            </div>
                        </div>
                            <!--Check for ALL-->
                        <div>
                            <div class="divlblcheck">
                                <br />
                                SELECT ALL
                            </div>
                            <div class="divlblcheck">
                                <div class="checketl">
                                    <input type="checkbox" value="SM9" id="checkall" checked="checked" onchange="checkAll(this)"/>
	                                <label for="checkall"></label>
                                </div>
                            </div>
                        </div>
                        <asp:Button ID="btnmanualrun" class="btn" runat="server" Text="Manual Run" 
                            onclick="btnmanualrun_Click" />
                        <asp:Label ID="labelresultrun" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="slide" id="middle">
                    <div class="centerdiv">
                        <asp:Button ID="gtngroups" class="btn" runat="server" 
                            Text="Groups configuration" onclick="gtngroups_Click" />
                        <br />
                        <asp:Button ID="btncustomer" class="btn" runat="server" 
                            Text="Customers Configuration" onclick="btncustomer_Click" />
                        <br />
                        <asp:Button ID="btnitem" class="btn" runat="server" Text="Configuration Item" 
                            onclick="btnitem_Click" />
                        <br />
                        <asp:Button ID="btnemail" class="btn" runat="server" Text="Email Configuration" 
                            onclick="btnemail_Click" />
                    </div>
                </div>
                <div class="slide" id="right">
                    <div class="centerdiv">
                        <div class="div3slide">
                            <asp:Label ID="Label1" runat="server" Text="Mapping"></asp:Label>
                            <asp:Button ID="btnmapping" class="btn" runat="server" Text="Start Mapping" 
                                onclick="btnmapping_Click" />
                            <asp:Label ID="labelresultmapping" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="div3slide">
                            <asp:Label ID="Label2" runat="server" Text="Reports"></asp:Label> <!-- Link en forma de botón -->
                            <p><b><a href="http://equipoc02/ReportServer/Pages/ReportViewer.aspx?%2fETL+Reporting+Services%2fMainMenu&rs:Command=Render" target="_blank" class="link">Main Menu</a></b></p>
                        </div>
                    </div>
                </div>
            </div>
            <div id="foot">
                <div id="footleft">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/infrastructure.png"/>
                </div>
                <div id="footright">
                    <div id="footsign">
                        <p style="color:rgb(33,33,33); line-height:12px; font-family:Helvetica,Arial,sans-serif; font-size:12px;">
		                    <span class="txt signature_name-target sig-hide" style="color:rgb(128,113,113); font-weight:bold; display:inline">
			                    Contacto: Jorge Rosete
		                    </span>
		                    <span class="title-sep sep" style="display:inline">
			                    /
		                    </span>
		                    <span class="txt signature_jobtitle-target sig-hide" style="color:rgb(128,113,113); display:inline">
			                    DB PoP
		                    </span>
		                    <span class="email-sep break" style="display:inline">
			                    <br>
		                    </span>
	                    </p>
		                    <p style="line-height:12px; font-family:Helvetica,Arial,sans-serif; font-size:10px; margin-bottom:10px">
		                    <span class="txt signature_companyname-target sig-hide" style="color:rgb(128,113,113); font-weight:bold; display:inline">
			                    T-Systems Mexico
		                    </span>
	                    </p>
                    </div>
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Innovate Magenta.png"/>
                </div>
            </div>
        </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>  
            <div id="Background"></div>
            <div id="Progress">
                <h6><p id="pmsgloading" style="text-align:center"><b>Loading...please wait<br /></b></p></h6>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
