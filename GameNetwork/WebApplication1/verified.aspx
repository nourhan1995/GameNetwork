<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verified.aspx.cs" Inherits="WebApplication1.verifided" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 446px;
        }
        .auto-style3 {
            width: 448px;
        }
        .auto-style4 {
            width: 398px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="Search" runat="server" Width="399px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="SearchB" runat="server" Text="Search" />
                </td>
            </tr>
        </table>
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="FN" runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Update" runat="server" Text="Update" OnClick="Update_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="FirstName" runat="server" Text=""></asp:Label>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="LN" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="LastName" runat="server" Text=""></asp:Label>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Years" runat="server" Text="Years Of  Experience"></asp:Label>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="YearsOf" runat="server" Text=""></asp:Label>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="Games" runat="server" Text="Games" />
                </td>
                <td class="auto-style3">
                    <asp:Button ID="comunity" runat="server" Text="comunity" />
                </td>
                <td class="auto-style3">
                    <asp:Button ID="conferences" runat="server" Text="conferences" />
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
