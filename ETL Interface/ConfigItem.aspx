<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfigItem.aspx.cs" Inherits="Configuration_Item" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Configuration Item</title>
        <link href="Styles/configuration.css" rel="stylesheet" type="text/css" />
        <link href="Styles/header_config.css" rel="stylesheet" type="text/css" />
        <link href="Styles/gridview.css" rel="stylesheet" type="text/css" />
        <link href="Styles/textfield.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <form id="formConfigurationItem" runat="server">
            <asp:ScriptManager ID="ScriptManager3" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="headerconfigdiv">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="31px" ImageUrl="~/Images/Home-Button.png" OnClick="ImageButton1_Click" Width="44px"/>
                        Configuration Items
                    </div>
                    <div id="contenedor">
                        <div id="thebody">
                            <div id="divoption">
                                <div id="divnewx">
                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/logo.png"/>
                                </div>
                                <div id="divlogo">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/infrastructure.png"/>
                                </div>
                            </div>
                            <div id="divtable">
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="configuration_item"
                                    DataSourceID="SqlDataSourceCI" ForeColor="#333333" GridLines="None"
                                    PageSize="20" CssClass="gridview">
                                    <AlternatingRowStyle CssClass="gridViewAltRow" />
                                    <Columns>
                                        <asp:BoundField DataField="configuration_item" HeaderText="Configuration Item" ReadOnly="True" SortExpression="configuration_item" HeaderStyle-ForeColor="White">
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="CON/SIN CI" SortExpression="ci_type" HeaderStyle-ForeColor="White">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("ci_type") %>'>
                                                    <asp:ListItem></asp:ListItem>
                                                    <asp:ListItem>CON CI</asp:ListItem>
                                                    <asp:ListItem>SIN CI</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ci_type") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:Button ID="Button3" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                                                &nbsp;<asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle CssClass="gridViewAltRow" />
                                    <FooterStyle CssClass="gridViewFooter" />
                                    <HeaderStyle CssClass="gridViewHeader" />
                                    <PagerStyle CssClass="gridViewPager" />
                                    <RowStyle CssClass="gridViewRow" />
                                    <SelectedRowStyle CssClass="gridViewSelectedRow" />
                                    <sortedascendingcellstyle CssClass="gridViewSortedAscendingCell" />
                                    <sortedascendingheaderstyle CssClass="gridViewSortedAscendingHeader" />
                                    <sorteddescendingcellstyle CssClass="gridViewSortingDescendingCell" />
                                    <sorteddescendingheaderstyle CssClass="gridViewSortingDescendingHeader" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceCI" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>"
                                    InsertCommand="INSERT INTO [dbo].[ci] ([configuration_item] ,[ci_type]) VALUES (?,?)"
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>"
                                    SelectCommand="SELECT [configuration_item] ,[ci_type] FROM [ETL Reporting Services].[dbo].[ci] ORDER BY [configuration_item]"
                                    UpdateCommand="UPDATE [dbo].[ci] SET [ci_type] = ? WHERE [configuration_item] = ?">
                                </asp:SqlDataSource>
                                <asp:Label ID="LabelCounterCI" runat="server" 
                                    Text="There are 0 CI without mapping">
                                </asp:Label>
                            </div>
                        </div>
                        <div id="foot">
                            <div id="footleft">
                            </div>
                            <div id="footmiddle">
                                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/Innovate Magenta.png"/>
                            </div>
                            <div id="footright">
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </form>
    </body>
</html>
