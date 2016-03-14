<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NormalSign.aspx.cs" Inherits="WebApplication1.NormalSign" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 146px;
        }
        .auto-style3 {
            width: 239px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <table class="auto-style1">
            <tr>
                <td>First Name</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="FName" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="LName" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Birth" runat="server" Text="BirthDate : MM/DD/YY"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox Type="datetime" ID="BirhtDate" runat="server" TextMode="Date">1/1/2015</asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="NSign" runat="server" Text="Sign Up" OnClick="Update_Click" />
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="Games" runat="server" Text="Games" />
                </td>
                <td class="auto-style3">
                    <asp:Button ID="comunity" runat="server" Text="comunity" />
                </td>
                <td>
                    <asp:Button ID="conferences" runat="server" Text="conferences" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
