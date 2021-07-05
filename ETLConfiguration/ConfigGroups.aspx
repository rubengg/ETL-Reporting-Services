<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfigGroups.aspx.cs" Inherits="ConfigGroups" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Configuration Groups</title>
</head>
<body>
    <form id="formGroups" runat="server">
    <div style="font-family: Arial; font-size: 30px; text-decoration: underline overline; color: #FFFFFF; background-color: #FF00FF; height: 40px; right: 500px; text-align: center;">
        <asp:ImageButton ID="ImageButton1" runat="server" Height="31px" ImageUrl="~/img/PinkHomeButton.png" OnClick="ImageButton1_Click" Width="44px" />
        Configuration Groups<br /><br /><br />
    </div>
    <br />
    Group:&nbsp; 
    <asp:TextBox ID="TextBoxLocation" runat="server" Width="417px"></asp:TextBox>
    <br />
    <br />
    Short Name
    Group:&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:DropDownList ID="DropDownListGroups" runat="server" 
        DataSourceID="SqlDataSourceGroupBound" DataTextField="shortName" DataValueField="shortName" 
        Height="30px" Width="252px" AutoPostBack="True" CausesValidation="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceGroupBound" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" SelectCommand="SELECT DISTINCT [shortName]
  FROM [ETL Reporting Services].[dbo].[groups]
  WHERE shortName &lt;&gt; ''
  ORDER BY shortName"></asp:SqlDataSource>
    &nbsp;<asp:TextBox ID="TextBoxNewGroup" runat="server" AutoPostBack="True" 
        CausesValidation="True" Visible="False"></asp:TextBox>
    <asp:Button ID="ButtonGroup" runat="server" onclick="ButtonGroup_Click" 
        Text="New Short Name" />
    <br />
    <br />Tower:&nbsp; &nbsp;&nbsp; 
    <asp:DropDownList ID="DropDownListTower" runat="server" 
        DataSourceID="SqlDataSourceTowerBound" DataTextField="tower" 
        DataValueField="tower">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceTowerBound" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" SelectCommand="SELECT DISTINCT [tower]
  FROM [ETL Reporting Services].[dbo].[groups]
  WHERE tower &lt;&gt; ''
  ORDER BY tower"></asp:SqlDataSource>
    &nbsp;<asp:TextBox ID="TextBoxNewTower" runat="server" AutoPostBack="True" 
        CausesValidation="True" Visible="False"></asp:TextBox>
    <asp:Button ID="ButtonTower" runat="server" onclick="ButtonTower_Click" 
        Text="New Tower" />
    <br />
    <br />
    <asp:Button ID="ButtonAceptar" runat="server"
        onclick="ButtonAceptar_Click" Text="Add" OnClientClick="if ( !confirm('Do you want to insert a new group?')) return false;"/>
    <br />
    <br />

    <asp:GridView ID="GridViewGroups" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Location" DataSourceID="SqlDataSourceETL" 
        AllowSorting="True" AllowPaging="True" PageSize="18" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Short name" SortExpression="Group">
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
            <asp:BoundField DataField="Location" HeaderText="Group" ReadOnly="True" 
                SortExpression="Location" />
            <asp:TemplateField HeaderText="Tower" SortExpression="Tower">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="tower" 
                        DataTextField="tower" DataValueField="tower" 
                        SelectedValue='<%# Bind("Tower") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="tower" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" 
                        SelectCommand="SELECT DISTINCT [tower] FROM [groups]"></asp:SqlDataSource>
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
    <br>
    </form>
</body>
</html>
