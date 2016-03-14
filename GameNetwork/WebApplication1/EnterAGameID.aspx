<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterAGameID.aspx.cs" Inherits="WebApplication1.EnterAGameID" %>

<!DOCTYPE html> 

<style>
body  {
    
    background-color: #000000;
}
</style>

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server">
    <title></title> 
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <style type="text/css">
        .auto-style8 {
            width: 100%;
            height: 374px;
        }
        .auto-style9 {
            width: 350px;
            font-size: x-large;
        }
        .auto-style10 {
            color: #00FF00;
            font-size: larger;
        }
        .auto-style11 {
            width: 350px;
            height: 158px;
            font-size: x-large;
        }
        .auto-style12 {
            height: 158px;
        }
        .auto-style13 {
            color: #FF00FF;
            font-weight: bold;
            background-color: #9900CC;
            font-size: x-large;
        }
        .auto-style16 {
            width: 350px;
            height: 158px;
            font-size: xx-large;
            color: #00FF00;
        }
    </style> 

</head> 
<body style="width: 673px; height: 503px"> 
    <form id="form1" runat="server">
        <asp:Label ID="email_label" runat="server" Visible="false"></asp:Label>
        <table class="auto-style8">
            <tr>
                <td class="auto-style16"><strong>Enter your email: </strong></td>
                <td class="auto-style12">
                 
                    <asp:TextBox ID="eee" runat="server" Height="28px" Width="228px"></asp:TextBox>
                 
                </td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style10" Text="Enter the game's ID:"></asp:Label>
                    </strong></td>
                <td class="auto-style12">
                   
                    <asp:TextBox ID="gameid" runat="server" Height="35px" Width="82px"></asp:TextBox>
                   
                </td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td>
                    <strong>
                    <asp:Button ID="Button1" runat="server" CssClass="auto-style13" OnClick="Button1_Click" Text="Show Game Details!" Width="242px" />
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
