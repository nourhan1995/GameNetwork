<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NormalUser.aspx.cs" Inherits="WebApplication1.NormalUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 187px;
        }
        .auto-style3 {
            width: 187px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 285px;
            height: 23px;
        }
        .auto-style6 {
            width: 285px;
        }
        .auto-style7 {
            width: 468px;
        }
    </style>
</head>
<body style="height: 156px">
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style7">
                    <asp:ListBox ID="Se" runat="server" Height="32px" Width="450px" OnSelectedIndexChanged="Se_SelectedIndexChanged"></asp:ListBox>
                </td>
                <td>
                    <asp:Button ID="Search" runat="server" Text="Search" />
                </td>
            </tr>
        </table>
    
    </div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="Friends" runat="server" Text="Friends" />
                    </td>
                <td class="auto-style6">
                    First Name</td>
                <td>
                    <asp:Button ID="Update" runat="server" Text="Update" OnClick="Update_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="Messages" runat="server" Text="Messages" />
                </td>
                <td class="auto-style6">
                    <asp:Label ID="FName" runat="server" Text=""></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="FriendR" runat="server" Text="Friend Requests" OnClick="FriendR_Click" />
                </td>
                <td class="auto-style6">
                    Last Name</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="LName" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style5">
                    Birthday</td>
                <td class="auto-style4">
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="Birthday" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style6">
                    Age</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style5">
                    <asp:Label ID="Age" runat="server" Text=""></asp:Label>
                </td>
                <td class="auto-style4">
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="Games" runat="server" Text="Games" OnClick="games_button_click"/>
                </td>
                <td class="auto-style6">
                    <asp:Button ID="comunity" runat="server" Text="comunity" OnClick="community_button_click"/>
                </td>
                <td>
                    <asp:Button ID="conferences" runat="server" Text="conferences" OnClick="conferences_button_click"/>
                </td>
            </tr>
        </table>
    
    </form>
</body>
</html>
