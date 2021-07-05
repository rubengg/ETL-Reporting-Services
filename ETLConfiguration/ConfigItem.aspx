<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfigItem.aspx.cs" Inherits="Configuration_Item" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: 32px;
            text-align: center;
            color: #FFFFFF;
            text-decoration: underline;
            background-color: #FF66FF;
        }
    </style>
</head>
<body>
    <form id="formConfigurationItem" runat="server">
    <div class="auto-style1">
        <asp:ImageButton ID="ImageButton1" runat="server" Height="31px" ImageUrl="~/img/PinkHomeButton.png" OnClick="ImageButton1_Click" Width="44px" />
        Configuration Items</div>

    <div>
        
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="configuration_item" DataSourceID="SqlDataSourceCI" ForeColor="#333333" GridLines="None" PageSize="20">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="configuration_item" HeaderText="Configuration Item" ReadOnly="True" SortExpression="configuration_item"></asp:BoundField>
                <asp:TemplateField HeaderText="CON/SIN CI" SortExpression="ci_type">
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
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <sortedascendingcellstyle backcolor="#F8FAFA" />
            <sortedascendingheaderstyle backcolor="#246B61" />
            <sorteddescendingcellstyle backcolor="#D4DFE1" />
            <sorteddescendingheaderstyle backcolor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCI" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringETL %>" InsertCommand="INSERT INTO [dbo].[ci] ([configuration_item] ,[ci_type]) VALUES (?,?)" ProviderName="<%$ ConnectionStrings:ConnectionStringETL.ProviderName %>" SelectCommand="SELECT [configuration_item] ,[ci_type] FROM [ETL Reporting Services].[dbo].[ci] ORDER BY [configuration_item]" UpdateCommand="UPDATE [dbo].[ci] SET [ci_type] = ? WHERE [configuration_item] = ?"></asp:SqlDataSource>
        
    </div>

    </form>
</body>
</html>
