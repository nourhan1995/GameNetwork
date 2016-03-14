<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GameProfile.aspx.cs" Inherits="WebApplication1.GameProfile" %>
 
<!DOCTYPE html> 
<style>
body  {
    
    background-color: #00FFFF;
}
</style>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 379px;
        }
        .auto-style2 {
            width: 190px;
        }
        .auto-style6 {
            color: #FF0066;
            font-weight: bold;
            font-size: medium;
            background-color: #00FFCC;
        }
        .auto-style11 {
            width: 190px;
            color: #CC3399;
            font-size: large;
            height: 55px;
        }
        .auto-style12 {
            height: 55px;
        }
        .auto-style13 {
            width: 190px;
            color: #CC3399;
            font-size: large;
            height: 56px;
        }
        .auto-style14 {
            height: 56px;
        }
        .auto-style15 {
            width: 190px;
            height: 53px;
        }
        .auto-style16 {
            height: 53px;
        }
        .auto-style17 {
            margin-left: 1px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style13"><strong>Game Name :</strong></td>
                <td class="auto-style14">
                    <asp:Label ID="Name" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style14">
                    <strong>
                    <asp:Button ID="rate" runat="server" CssClass="auto-style6" OnClick="rate_Click" Text="Rate this game" Width="155px" Height="49px" />
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Release Date :</strong></td>
                <td class="auto-style12">
                    <asp:Label ID="Date" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style12">
                    <strong>
                    <asp:Button ID="recommend" runat="server" CssClass="auto-style6" OnClick="recommend_Click" Text="Recommend this game" Width="197px" Height="46px" />
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Age Limit :</strong></td>
                <td class="auto-style12">
                    <asp:Label ID="Age" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Game Type :</strong></td>
                <td class="auto-style12">
                    <asp:Label ID="Type" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Overall Game Rating :</strong></td>
                <td class="auto-style12">
                    <asp:Label ID="Rating" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style12">
                    </td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Developer:</strong></td>
                <td class="auto-style12">
                    <asp:Label ID="Develop" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style12">
                    </td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Screenshots:</strong></td>
                <td class="auto-style12">
                    <asp:Label ID="Screenshot" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style12">
                    </td>
            </tr>
            <tr>
                <td class="auto-style13"><strong>Videos:</strong></td>
                <td class="auto-style14">
                    <asp:Label ID="Video" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style14">
                    </td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Reviews:</strong></td>
                <td id="70" class="auto-style12">
                    <asp:Label ID="ll" runat="server"></asp:Label>
                </td>
                <td id="0" class="auto-style12">
                    <asp:TextBox ID="revt" runat="server" CssClass="auto-style17" Height="34px" OnTextChanged="TextBox1_TextChanged" Visible="False" Width="219px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="auto-style15"></td>
                <td class="auto-style16"></td>
                <td class="auto-style16"><strong>
                    <asp:Button ID="addrev" runat="server" CssClass="auto-style6" Height="43px" OnClick="addrev_Click" Text="Add Review" Visible="False" Width="196px" />
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    
    </form>
</body>
</html>
