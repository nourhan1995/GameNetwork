<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logsine.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WELCOME!!!</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <link href="Style/StyleSheet1.css" rel="stylesheet" />
    <form id="form1" runat="server">
    <div id="Log">

        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="info" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
            </tr>
        </table>

    </div>
        <table class="auto-style1">
            <tr>
                <td>
        <asp:Label ID="lo" runat="server" Text="Please enter Your Email"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
        <asp:TextBox ID="Email" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
        <asp:Label ID="pa" runat="server" Text="Please enter your password"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
        <asp:TextBox ID="Password" runat="server" TextMode="Password" ></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
        <asp:Button ID="LogIn" runat="server" Text="Log In " OnClick="LogIn_Click" />

                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div id="Sign">
        <asp:Label ID="Label1" runat="server" Text="Not A Member Please Sign Up !!"></asp:Label>
        <asp:Button ID="SIGN" runat="server" Text="Sign Up" OnClick="SIGN_Click" />
            </div>
    </form>
</body>
</html>
