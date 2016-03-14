<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recommend.aspx.cs" Inherits="WebApplication1.Recommend" %>

<!DOCTYPE html> 
<style>
body  {
    
    background-color:	#DB7093 ;
}
</style>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 250px;
        }
        .auto-style2 {
            width: 336px;
        }
        .auto-style4 {
            font-weight: bold;
            color: #660066;
            font-size: large;
        }
        .auto-style5 {
            width: 336px;
            height: 54px;
        }
        .auto-style6 {
            height: 54px;
        }
        .auto-style7 {
            color: #FFFF00;
            font-size: large;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2"><strong>
                    <asp:Label ID="Label2" runat="server" CssClass="auto-style7" Text="Enter the targted user's email here:"></asp:Label>
                    </strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:TextBox ID="u2" runat="server" Width="224px" Height="32px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong><em>
                    <asp:Button ID="Button1" runat="server" CssClass="auto-style4" OnClick="Button1_Click" Text="Send recommendation!" Width="248px" />
                    </em></strong></td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
