<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfigGroups.aspx.cs" Inherits="ConfigGroups" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Groups Configuration</title>
    <link href="Styles/configuration.css" rel="stylesheet" type="text/css" />
    <link href="Styles/header_config.css" rel="stylesheet" type="text/css" />
    <link href="Styles/gridview.css" rel="stylesheet" type="text/css" />
    <link href="Styles/textfield.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formGroups" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="headerconfigdiv">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="31px" ImageUrl="~/Images/Home-Button.png" OnClick="ImageButton1_Click" Width="44px" />
                    Groups Configuration
                    <br />
                    <br />
                    <br />
                </div>
                <div id="contenedor">
                    <div id="thebody">
                        <div id="divoption">
                            <div id="divnewx">
                                Group:&nbsp; 
                                <asp:TextBox ID="TextBoxLocation" runat="server" Width="417px" class="uppercase"></asp:TextBox>
                                <br />
                                <br />
                                Short Name
                                Group:&nbsp;&nbsp;&nbsp;&nbsp; 
                                <asp:DropDownList ID="DropDownListGroups" runat="server" 
                                    DataSourceID="SqlDataSourceGroupBound" DataTextField="shortName" DataValueField="shortName" 
                                    Height="30px" Width="252px" AutoPostBack="True" CausesValidation="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceGroupBound" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>"
                                                    ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" SelectCommand="SELECT DISTINCT [shortName]
                                                                                                                            FROM [ETL Reporting Services].[dbo].[groups]
                                                                                                                            WHERE shortName &lt;&gt; ''
                                                                                                                            ORDER BY shortName">
                                </asp:SqlDataSource>
                                &nbsp;
                                <asp:TextBox ID="TextBoxNewGroup" runat="server" AutoPostBack="True" CausesValidation="True" Visible="False" class="uppercase"></asp:TextBox>
                                <asp:Button ID="ButtonGroup" runat="server" onclick="ButtonGroup_Click" Text="New Short Name" />
                                <br />
                                <br />Tower:&nbsp; &nbsp;&nbsp; 
                                <asp:DropDownList ID="DropDownListTower" runat="server" 
                                    DataSourceID="SqlDataSourceTowerBound" DataTextField="tower" 
                                    DataValueField="tower">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceTowerBound" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" 
                                                ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" SelectCommand="SELECT DISTINCT [tower]
                                                                                                                        FROM [ETL Reporting Services].[dbo].[groups]
                                                                                                                        WHERE tower &lt;&gt; ''
                                                                                                                        ORDER BY tower">
                                </asp:SqlDataSource>
                                &nbsp;
                                <asp:TextBox ID="TextBoxNewTower" runat="server" AutoPostBack="True" CausesValidation="True" Visible="False" class="uppercase"></asp:TextBox>
                                <asp:Button ID="ButtonTower" runat="server" onclick="ButtonTower_Click" Text="New Tower" />
                                <br />
                                <br />
                                <asp:Button ID="ButtonAceptar" runat="server" onclick="ButtonAceptar_Click" Text="Add" OnClientClick="if ( !confirm('Do you want to insert a new group?')) return false;"/>
                            </div>
                            <div id="divlogo">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/logo.png"/>
                            </div>
                        </div>
                        <div id="divtable">
                            <asp:GridView ID="GridViewGroups" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="Location" DataSourceID="SqlDataSourceETL" 
                                        AllowSorting="True" AllowPaging="True" PageSize="18" CellPadding="4" 
                                        ForeColor="#000000" GridLines="None" CssClass="gridview">
                                <AlternatingRowStyle     CssClass="gridViewAltRow" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Short name" SortExpression="Group" HeaderStyle-ForeColor="White">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                                DataSourceID="SqlDataSource1" DataTextField="shortName" 
                                                DataValueField="shortName" SelectedValue='<%# Bind("Group") %>'>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" 
                                                ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" 
                                                SelectCommand="SELECT DISTINCT [shortName] FROM [groups]">
                                            </asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Group") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Location" HeaderText="Group" ReadOnly="True" SortExpression="Location"  HeaderStyle-ForeColor ="White"/>
                                    <asp:TemplateField HeaderText="Tower" SortExpression="Tower" HeaderStyle-ForeColor="White">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="tower" 
                                                DataTextField="tower" DataValueField="tower" 
                                                SelectedValue='<%# Bind("Tower") %>'>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="tower" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" 
                                                ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" 
                                                SelectCommand="SELECT DISTINCT [tower] FROM [groups]">
                                            </asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Tower") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                            &nbsp;<asp:Button ID="Button2" runat="server" title="This option only will hide the 'Group', and its tickets will continue without changes" CausesValidation="False" CommandName="Delete" Text="Hide" OnClientClick="return confirm ('Are you sure you want to hide this record?')"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle CssClass="gridViewEditRow" />
                                <FooterStyle CssClass="gridViewFooter" />
                                <HeaderStyle CssClass="gridViewHeader" />
                                <PagerStyle CssClass="gridViewPager" />
                                <RowStyle CssClass="gridViewRow" />
                                <SelectedRowStyle CssClass="gridViewSelectedRow" />
                                <SortedAscendingCellStyle CssClass="gridViewSortedgAscendingCell" />
                                <SortedAscendingHeaderStyle CssClass="gridViewSortedAscendingHeader" />
                                <SortedDescendingCellStyle CssClass="gridViewSortingDescendingCell" />
                                <SortedDescendingHeaderStyle CssClass="gridViewSortingDescendingHeader" />
                            </asp:GridView>
                            <br />
                            <asp:Label ID="labelcountnull" runat="server" Text=""></asp:Label>
                            <asp:SqlDataSource ID="SqlDataSourceETL" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" DeleteCommand="UPDATE groups SET visible = 0
                                                                                                                        WHERE name = ?" 
                                            ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" SelectCommand="SELECT [shortName] as 'Group' ,[name] as 'Location',[tower] as 'Tower'
                                                                                                                                FROM [ETL Reporting Services].[dbo].[groups]
                                                                                                                                WHERE [visible] = 1
                                                                                                                                ORDER BY 'Group'  ASC" 
                                                                                                                                        UpdateCommand="UPDATE groups SET shortName = ?, tower = ?
                                                                                                                                WHERE name = ?">
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div id="foot">
                        <div id="footleft">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/infrastructure.png" />
                        </div>
                        <div id="footmiddle">
                        </div>
                        <div id="footright">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Innovate Magenta.png" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
