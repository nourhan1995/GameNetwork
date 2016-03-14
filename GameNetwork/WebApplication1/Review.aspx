<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="WebApplication1.Review" %>

<!DOCTYPE html> 

<style>
body  {
    
    background-color:	#DCDCDC ;
}
</style>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
        .auto-style2 {
            width: 100%;
            height: 362px;
        }
        .auto-style3 {
            width: 135px;
        }
        .auto-style4 {
            height: 116px;
        }
        .auto-style5 {
            color: #FF0000;
            font-size: large;
        }
        .auto-style7 {
            font-weight: bold;
        }
        .auto-style8 {
            width: 135px;
            color: #FF0000;
            height: 74px;
        }
        .auto-style9 {
            height: 74px;
        }
        .auto-style10 {
            width: 135px;
            height: 58px;
        }
        .auto-style11 {
            height: 58px;
        }
        .auto-style12 {
            width: 135px;
            color: #FF0000;
            height: 32px;
        }
        .auto-style13 {
            height: 32px;
        }
        .auto-style14 {
            height: 58px;
            width: 266px;
        }
        .auto-style15 {
            height: 32px;
            width: 266px;
        }
        .auto-style16 {
            height: 74px;
            width: 266px;
        }
        .auto-style17 {
            width: 266px;
        }
        .auto-style18 {
            width: 135px;
            color: #FF0000;
            height: 55px;
        }
        .auto-style19 {
            height: 55px;
            width: 266px;
        }
        .auto-style20 {
            height: 55px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style4">
    
        <span class="auto-style5"><strong>Review Conetnt :</strong></span>
        <asp:Label ID="Content" runat="server" Text="Label"></asp:Label>
    
    </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style10"><strong><span class="auto-style1">Reviewer&#39;s Profile :</span></strong></td>
                <td class="auto-style14">
                    <asp:HyperLink ID="Rev" runat="server">Rev</asp:HyperLink>
                </td>
                <td class="auto-style11">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td id="thecell" accesskey="thecell" class="auto-style15">
                </td>
                <td id="thecell" accesskey="thecell" class="auto-style13">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8"><strong>Comments:</strong></td>
                <td id="thecell" accesskey="thecell" class="auto-style16">
                    &nbsp;</td>
                <td id="thecell" accesskey="thecell" class="auto-style9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18"></td>
                <td id="thecell" accesskey="thecell" class="auto-style19">
                    <strong>
                    <asp:Label ID="Label2" runat="server" Text="Enter your comment:"></asp:Label>
                    </strong>
                </td>
                <td id="thecell" accesskey="thecell" class="auto-style20">
                    <asp:TextBox ID="com" runat="server" Height="43px" OnTextChanged="com_TextChanged" Width="248px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td id="thecell" accesskey="thecell" class="auto-style17">
                    <strong>
                    <asp:Button ID="Button2" runat="server" CssClass="auto-style7" OnClick="Button2_Click" Text="Add Comment" />
                    </strong>
                </td>
                <td id="thecell" accesskey="thecell">
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
