<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DevelopmentUpdate.aspx.cs" Inherits="WebApplication1.DevelopmentUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="Team" runat="server" Text="Team Name"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TeamName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="c" runat="server" Text="Company Name"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="CompanyName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Foundation" runat="server" Text="Foundation Date : MM/DD/YY"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="FoudationDate" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Update" runat="server" Text="Update" OnClick="Update_Click" />
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
