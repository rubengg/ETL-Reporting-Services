<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        #Background
        {
            position: fixed;
            top:0px;
            bottom:0px;
            left:0px;
            right:0px;
            overflow:hidden;
            padding:0;
            margin:0;
            background-color:#F0F0F0;
            filter:alpha(opacity=80);
            opacity:0.8;
            z-index:100000;
        }
        #Progress
        {
            position:fixed;
            top:40%;
            left:40%;
            height:20%;
            width:20%;
            z-index:100001;
            background-color:#FFFFFF;
            border:1px Solid Gray;
            background-image:url('img/horizontal_ajax_loading.gif');
            background-repeat:no-repeat;
            background-position:center;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <center>
            ETL Reporting - Configuration Mode
            <br />
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:CheckBoxList ID="checkboxchoose" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="checkboxchoose_SelectedIndexChanged" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">SM9</asp:ListItem>
                        <asp:ListItem Selected="True">VWM</asp:ListItem>
                        <asp:ListItem Selected="True">GNP</asp:ListItem>
                        <asp:ListItem Selected="True">Remedy</asp:ListItem>
                    </asp:CheckBoxList>
                    <br />
                    <asp:CheckBox ID="checkboxall" runat="server" AutoPostBack="True" 
                        Checked="True" oncheckedchanged="checkboxall_CheckedChanged" 
                        Text="SELECT ALL" />
                    <br />
                    <br />
                    <asp:Button ID="btnmanualrun" runat="server" onclick="btnmanualrun_Click" 
                        Text="Manual run" />
                    <br />
                    <asp:Label ID="labelresultrun" runat="server" Text=""></asp:Label>
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
        </center>
    </h2>
    <br />
    <div>
        <div style="width:50%;background-color:White;position:relative;float:left;">
            <h2>Reports</h2>
        </div>
        <div style="width:50%;background-color:White;position:relative;float:left; top: 0px; left: 0px; height: 21px;">
            Section 2
        </div>
    </div>
    </asp:Content>
