<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RatingPage.aspx.cs" Inherits="WebApplication1.RatingPage" %>

<!DOCTYPE html> 
<style>
body  {
    
    background-color:		#FFE4C4;
}
</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 331px;
        }
        .auto-style4 {
            width: 125px;
        }
        .auto-style6 {
            width: 150px;
        }
        .auto-style8 {
            font-weight: bold;
            color: #FF0000;
            margin-left: 24px;
            font-size: large;
        }
        .auto-style9 {
            text-decoration: underline;
            color: #993333;
            margin-left: 0px;
            background-color: #CCCCCC;
        }
        .auto-style10 {
            height: 589px;
        }
        .auto-style12 {
            width: 95px;
        }
        .auto-style14 {
            color: #0000FF;
            font-size: large;
        }
        .auto-style15 {
            width: 116px;
        }
        .auto-style16 {
            width: 150px;
            font-size: large;
            color: #0000FF;
        }
    </style>
</head>
<body style="height: 1183px">
    <form id="form1" runat="server" class="auto-style10">
        <table class="auto-style1">
            <tr>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6"><strong>
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style14" Text="Enter your ratings:"></asp:Label>
                    </strong></td>
                <td class="auto-style12"><em>
                    <asp:Label ID="Label2" runat="server" Text="Interactivity"></asp:Label>
                    </em></td>
                <td class="auto-style15"><em>
                    <asp:Label ID="Label3" runat="server" Text="Uniqueness"></asp:Label>
                    </em></td>
                <td class="auto-style4"><em>
                    <asp:Label ID="Label4" runat="server" Text="Level Design"></asp:Label>
                    </em></td>
                <td><em>
                    <asp:Label ID="Label5" runat="server" Text="Graphics"></asp:Label>
                    </em></td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style12">
                    <asp:TextBox ID="I" runat="server" Width="22px"></asp:TextBox>
                </td>
                <td class="auto-style15">
                    <asp:TextBox ID="U" runat="server" Width="22px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="L" runat="server" Width="22px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="G" runat="server" Width="22px"></asp:TextBox>
                </td>
            </tr>
            <tr id="tr1" runat="server">
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style15"><strong>
                    <asp:Button ID="submit" runat="server" CssClass="auto-style8" OnClick="submit_Click" Text="Submit!" Width="81px" />
                    </strong></td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr >
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style15">
                    <asp:Button ID="newrate" runat="server" CssClass="auto-style9" OnClick="Button2_Click" Text="Find new overall rate!" Width="130px" />
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
