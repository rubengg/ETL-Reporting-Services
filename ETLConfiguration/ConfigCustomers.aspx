<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfigCustomers.aspx.cs" Inherits="ConfigCustomers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customers Configuration</title>
</head>
<body>
    <form id="formCustomers" runat="server">
    <div style="text-decoration: underline overline; font-size: 30px; font-family: Arial; color: #FFFFFF; text-align: center; background-color: #FF00FF;">
        <asp:ImageButton ID="ImageButton2" runat="server" Height="25px" ImageUrl="~/img/PinkHomeButton.png" OnClick="ImageButton2_Click" Width="44px" />
        Configuration Customers
        <br />
        </div>
    <div style="height: 50px; width: 900px;">
        <br />
        New Customer:
        <asp:TextBox ID="TextBoxNewCustomer" runat="server" Width="162px"></asp:TextBox>
&nbsp;Priority 1:
        <asp:TextBox ID="TextBoxPriority1" runat="server" Width="43px"></asp:TextBox>
&nbsp;Priority 2:
        <asp:TextBox ID="TextBoxPriority2" runat="server" Width="43px"></asp:TextBox>
&nbsp;Priority 3:
        <asp:TextBox ID="TextBoxPriority3" runat="server" Width="43px"></asp:TextBox>
&nbsp;Priority 4:
        <asp:TextBox ID="TextBoxPriority4" runat="server" Width="43px"></asp:TextBox>
&nbsp;
        <asp:Button ID="ButtonAddCustomer" runat="server" 
            onclick="ButtonAddCustomer_Click" Text="Add Customer" />
    </div>

    <div style="height: 640px; width: 898px;">
    
        <asp:GridView ID="GridViewCustomers" runat="server" AllowPaging="True" PageSize="15"
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Customer" 
            DataSourceID="SqlDataSourceCustomers" Width="100%" CellPadding="4" 
            ForeColor="#333333" GridLines="None" Height="576px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Customer" HeaderText="Customer" ReadOnly="True" 
                    SortExpression="Customer" />
                <asp:BoundField DataField="Priotiry 1" HeaderText="Priotiry 1" 
                    SortExpression="Priotiry 1" />
                <asp:BoundField DataField="Priotiry 2" HeaderText="Priotiry 2" 
                    SortExpression="Priotiry 2" />
                <asp:BoundField DataField="Priotiry 3" HeaderText="Priotiry 3" 
                    SortExpression="Priotiry 3" />
                <asp:BoundField DataField="Priotiry 4" HeaderText="Priotiry 4" 
                    SortExpression="Priotiry 4" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" InsertCommand="INSERT INTO [dbo].[locations]
           ([location]
           ,[shortName])
     VALUES
           (?,?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" SelectCommand="SELECT [name] as 'Customer'
      ,[priority1]  as 'Priotiry 1'
      ,[priority2]  as 'Priotiry 2'
      ,[priority3]  as 'Priotiry 3'
      ,[priority4]  as 'Priotiry 4'
  FROM [ETL Reporting Services].[dbo].[customers]
  WHERE visible = 1
  ORDER BY name" UpdateCommand="UPDATE [dbo].[customers]
   SET 
      [priority1] = ?
      ,[priority2] = ?
      ,[priority3] = ?
      ,[priority4] = ?
 WHERE name = ?"></asp:SqlDataSource>
    
    </div>

    <div>
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
        <asp:TextBox ID="TextBoxNewLocation" runat="server" Width="455px"></asp:TextBox>
        <asp:Button ID="ButtonAddLocation" runat="server" 
            onclick="ButtonAddLocation_Click" Text="Add Location" 
            style="height: 26px" />
        <br />
        <asp:GridView ID="GridViewLocations" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="location" DataSourceID="SqlDataSourceLocations" 
            ForeColor="#333333" GridLines="None" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="location" HeaderText="Location" ReadOnly="True" 
                    SortExpression="location" />
                <asp:BoundField DataField="shortName" HeaderText="Customer" 
                    SortExpression="shortName" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:GridView ID="GridViewlocationnull" runat="server" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="location" 
            DataSourceID="locationwithoutcustomer" ForeColor="#333333" GridLines="None" 
            Visible="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="location" HeaderText="location" ReadOnly="True" 
                    SortExpression="location" />
                <asp:TemplateField HeaderText="Customer" SortExpression="shortName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="customer" 
                            DataTextField="shortName" DataValueField="shortName" 
                            SelectedValue='<%# Bind("shortName") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="customer" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" 
                            SelectCommand="SELECT DISTINCT [shortName] FROM [locations] ">
                        </asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("shortName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                    ShowEditButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
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
            SelectCommand="SELECT DISTINCT [name] FROM [customers] ORDER BY [name]"></asp:SqlDataSource>
    </div>

    </form>
    
</body>
</html>
