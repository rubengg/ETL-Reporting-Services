<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfigCustomers.aspx.cs" Inherits="ConfigCustomers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Customers Configuration</title>
        <link href="Styles/configuration.css" rel="stylesheet" type="text/css" />
        <link href="Styles/header_config.css" rel="stylesheet" type="text/css" />
        <link href="Styles/gridview.css" rel="stylesheet" type="text/css" />
        <link href="Styles/textfield.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <form id="formCustomers" runat="server">
            <asp:ScriptManager ID="ScriptManager3" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="headerconfigdiv">
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="25px" ImageUrl="~/Images/Home-Button.png" OnClick="ImageButton2_Click" Width="44px" />
                        Customers Configuration
                    </div>
                    <div id="contenedor">
                        <div id="thebody">
                            <div id="divoption">
                                <div id="divnewx">

                                New Customer:
                                    <asp:TextBox ID="TextBoxNewCustomer" runat="server" class="uppercase" Width="162px"></asp:TextBox>
                                    &nbsp;<br />
                                    Priority 1:
                                    <asp:TextBox ID="TextBoxPriority1" runat="server" Width="43px"></asp:TextBox>
                                    &nbsp;Priority 2:
                                    <asp:TextBox ID="TextBoxPriority2" runat="server" Width="43px"></asp:TextBox>
                                    &nbsp;Priority 3:
                                    <asp:TextBox ID="TextBoxPriority3" runat="server" Width="43px"></asp:TextBox>
                                    &nbsp;Priority 4:
                                    <asp:TextBox ID="TextBoxPriority4" runat="server" Width="43px"></asp:TextBox>
                                    &nbsp;
                                    <asp:Button ID="Button1" runat="server" onclick="ButtonAddCustomer_Click" Text="Add Customer" />
                                </div>
                                <div id="divlogo">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/logo.png"/>
                                </div>
                            </div>
                            <div id="divtable">
                                <asp:GridView ID="GridViewCustomers" runat="server" AllowPaging="True" PageSize="15" AutoGenerateColumns="False" DataKeyNames="Customer" 
                                    DataSourceID="SqlDataSourceCustomers" CellPadding="4" Width="100%" GridLines="None" CssClass="gridview" AllowSorting="True">
                                    <AlternatingRowStyle CssClass="gridViewAltRow"/>
                                    <Columns>
                                        <asp:BoundField DataField="Customer" HeaderText="Customer" ReadOnly="True" SortExpression="Customer" HeaderStyle-ForeColor="White" />
                                        <asp:BoundField DataField="Priority 1" HeaderText="Priority 1" SortExpression="Priority 1" HeaderStyle-ForeColor="White" />
                                        <asp:BoundField DataField="Priority 2" HeaderText="Priority 2" SortExpression="Priority 2" HeaderStyle-ForeColor="White"/>
                                        <asp:BoundField DataField="Priority 3" HeaderText="Priority 3" SortExpression="Priority 3" HeaderStyle-ForeColor="White"/>
                                        <asp:BoundField DataField="Priority 4" HeaderText="Priority 4" SortExpression="Priority 4" HeaderStyle-ForeColor="White"/>
                                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                                    </Columns>
                                    <EditRowStyle CssClass="gridViewEditRow" />
                                    <FooterStyle CssClass="gridViewFooter" />
                                    <HeaderStyle CssClass="gridViewHeader"/>
                                    <PagerStyle CssClass="gridViewPager" />
                                    <RowStyle CssClass="gridViewRow" />
                                    <SelectedRowStyle CssClass="gridViewSelectedRow" />
                                    <SortedAscendingCellStyle CssClass="gridViewSortedAscendingCell" />
                                    <SortedAscendingHeaderStyle CssClass="gridViewSortedAscendingHeader" />
                                    <SortedDescendingCellStyle CssClass="gridViewSortingDescendingCell" />
                                    <SortedDescendingHeaderStyle CssClass="gridViewSortingDescendingHeader" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" InsertCommand="INSERT INTO [dbo].[locations]
                                                                                                                ([location]
                                                                                                                ,[shortName])
                                                                                                                VALUES
                                                                                                                (?,?)" 
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" SelectCommand="SELECT [name] as 'Customer'
                                                                                                                        ,[priority1]  as 'Priority 1'
                                                                                                                        ,[priority2]  as 'Priority 2'
                                                                                                                        ,[priority3]  as 'Priority 3'
                                                                                                                        ,[priority4]  as 'Priority 4'
                                                                                                                        FROM [ETL Reporting Services].[dbo].[customers]
                                                                                                                        WHERE visible = 1
                                                                                                                        ORDER BY name"
                                    UpdateCommand="UPDATE [dbo].[customers]
                                                SET 
                                                [priority1] = ?
                                                ,[priority2] = ?
                                                ,[priority3] = ?
                                                ,[priority4] = ?
                                                WHERE name = ?">
                                </asp:SqlDataSource>
                                Locations by Customer&nbsp;
                                <asp:DropDownList ID="DropDownListCustomers" runat="server" AutoPostBack="True" 
                                    CausesValidation="True" DataSourceID="SqlDataSourceDownListCustomers" 
                                    DataTextField="name" DataValueField="name">
                                </asp:DropDownList>
                                <asp:Button ID="ButtonDeleteCustomer" runat="server" 
                                    onclick="ButtonDeleteCustomer_Click" Text="Delete This Customer"
                                    OnClientClick="if ( !confirm('Are you sure want to delete this customer?')) return false;"/>
                                <asp:CheckBox ID="checkboxlocationnull" runat="server" AutoPostBack="True" 
                                    oncheckedchanged="checkboxlocationnull_CheckedChanged" 
                                    Text="Locations without customer" />
                                <br />
                                New Location:
                                <asp:TextBox ID="TextBoxNewLocation" runat="server" class="uppercase" Width="455px"></asp:TextBox>
                                <asp:Button ID="ButtonAddLocation" runat="server" 
                                    onclick="ButtonAddLocation_Click" Text="Add Location" 
                                    style="height: 26px" />
                                <br />
                                <asp:GridView ID="GridViewLocations" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="location" DataSourceID="SqlDataSourceLocations" ForeColor="#000000" GridLines="None" AllowSorting="True" CssClass="gridview">
                                    <AlternatingRowStyle CssClass="gridViewAltRow" />
                                    <Columns>
                                        <asp:BoundField DataField="location" HeaderText="Location" ReadOnly="True" 
                                            SortExpression="location" HeaderStyle-ForeColor="White" />
                                        <asp:BoundField DataField="shortName" HeaderText="Customer" 
                                            SortExpression="shortName" HeaderStyle-ForeColor="White" />
                                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                                    </Columns>
                                    <EditRowStyle CssClass="gridViewEditRow" />
                                    <FooterStyle CssClass="gridViewFooter" />
                                    <HeaderStyle CssClass="gridViewHeader" />
                                    <PagerStyle CssClass="gridViewPager" />
                                    <RowStyle CssClass="gridViewRow" />
                                    <SelectedRowStyle CssClass="gridViewSelectedRow" />
                                    <SortedAscendingCellStyle CssClass="gridViewSortedAscendingCell" />
                                    <SortedAscendingHeaderStyle CssClass="gridViewAscendingHeader" />
                                    <SortedDescendingCellStyle CssClass="gridViewSortingDescendingCell" />
                                    <SortedDescendingHeaderStyle CssClass="gridViewSortingDescendingHeader" />
                                </asp:GridView>
                                <asp:GridView ID="GridViewlocationnull" runat="server" 
                                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="location" 
                                    DataSourceID="locationwithoutcustomer" ForeColor="#000000" GridLines="None" 
                                    Visible="False" AllowSorting="True" CssClass="gridview">
                                    <AlternatingRowStyle CssClass="gridViewAltRow" />
                                    <Columns>
                                        <asp:BoundField DataField="location" HeaderText="Location" ReadOnly="True" 
                                            SortExpression="location" HeaderStyle-ForeColor="White" />
                                        <asp:TemplateField HeaderText="Customer" SortExpression="shortName" HeaderStyle-ForeColor="White">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="customer" 
                                                    DataTextField="shortName" DataValueField="shortName" 
                                                    SelectedValue='<%# Bind("shortName") %>'>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="customer" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" 
                                                    ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" 
                                                    SelectCommand="SELECT name AS shortName FROM customers UNION SELECT TOP 1 [shortName] FROM [locations] WHERE shortName IS NULL">
                                                </asp:SqlDataSource>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("shortName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                                            ShowEditButton="True" />
                                    </Columns>
                                    <EditRowStyle CssClass="gridViewEditRow" />
                                    <FooterStyle CssClass="gridViewFooter" />
                                    <HeaderStyle CssClass="gridViewHeader" />
                                    <PagerStyle CssClass="gridViewPager" />
                                    <RowStyle CssClass="gridViewRow" />
                                    <SelectedRowStyle CssClass="gridViewSelectedRow" />
                                    <SortedAscendingCellStyle CssClass="gridViewSortedAscendingCell" />
                                    <SortedAscendingHeaderStyle CssClass="gridViewSortedAscendingHeader" />
                                    <SortedDescendingCellStyle CssClass="gridViewSortingDescendingCell" />
                                    <SortedDescendingHeaderStyle CssClass="gridViewSortingDescendingHeader" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="locationwithoutcustomer" runat="server" 
                                    ConflictDetection="CompareAllValues" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" 
                                    DeleteCommand="DELETE FROM [locations] WHERE [location] = ? AND (([shortName] = ?) OR ([shortName] IS NULL AND ? IS NULL))" 
                                    InsertCommand="INSERT INTO [locations] ([location], [shortName]) VALUES (?, ?)" 
                                    OldValuesParameterFormatString="original_{0}" 
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" 
                                    SelectCommand="SELECT * FROM [locations] WHERE ([shortName] IS NULL)" 
                                    UpdateCommand="UPDATE [locations] SET [shortName] = ? WHERE [location] = ? AND (([shortName] = ?) OR ([shortName] IS NULL AND ? IS NULL))">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_location" Type="String" />
                                        <asp:Parameter Name="original_shortName" Type="String" />
                                        <asp:Parameter Name="original_shortName" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="location" Type="String" />
                                        <asp:Parameter Name="shortName" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="shortName" Type="String" />
                                        <asp:Parameter Name="original_location" Type="String" />
                                        <asp:Parameter Name="original_shortName" Type="String" />
                                        <asp:Parameter Name="original_shortName" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceLocations" runat="server" 
                                    ConflictDetection="CompareAllValues" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" 
                                    DeleteCommand="DELETE FROM [locations] WHERE [location] = ? AND (([shortName] = ?) OR ([shortName] IS NULL AND ? IS NULL))" 
                                    InsertCommand="INSERT INTO [locations] ([location], [shortName]) VALUES (?, ?)" 
                                    OldValuesParameterFormatString="original_{0}" 
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>"
                                    SelectCommand="SELECT [location], [shortName] FROM [locations] WHERE ([shortName] = ?) ORDER BY [location]" 
                                    UpdateCommand="UPDATE [locations] SET [shortName] = ? WHERE [location] = ? AND (([shortName] = ?) OR ([shortName] IS NULL AND ? IS NULL))">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_location" Type="String" />
                                        <asp:Parameter Name="original_shortName" Type="String" />
                                        <asp:Parameter Name="original_shortName" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="location" Type="String" />
                                        <asp:Parameter Name="shortName" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownListCustomers" Name="shortName" 
                                            PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="shortName" Type="String" />
                                        <asp:Parameter Name="original_location" Type="String" />
                                        <asp:Parameter Name="original_shortName" Type="String" />
                                        <asp:Parameter Name="original_shortName" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceDownListCustomers" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" 
                                    ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" 
                                    SelectCommand="SELECT DISTINCT [name] FROM [customers] ORDER BY [name]">
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div id="foot">
                            <div id="footleft">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/infrastructure.png" />
                            </div>
                            <div id="footmiddle"></div>
                            <div id="footright">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/Innovate Magenta.png" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </form>
    </body>
</html>
