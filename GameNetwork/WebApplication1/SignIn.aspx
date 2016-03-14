<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="WebApplication1.SignIn1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> SIGN UP !!!</title>
        <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
            .auto-style3 {
                width: 450px;
            }
            .auto-style4 {
                width: 214px;
            }
            .auto-style5 {
                height: 26px;
            }
            .auto-style6 {
                height: 26px;
                width: 278px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="SignIn">
    
    </div>
         <table class="auto-style1">
            <tr>
                <td class="auto-style3">
        <asp:Label ID="E" runat="server" Text="Please Enter Your Email"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style6">
        <asp:TextBox ID="Email" runat="server"   RepeatDirection="Horizontal" TextMode="Email" ></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                <asp:Label ID="em"  runat ="server" ForeColor="#CC0000"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
   <asp:Label ID="Pa" runat="server" Text="Please a Password"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
        <asp:TextBox ID="Password" runat="server"  RepeatDirection="Horizontal" AutoCompleteType="Disabled" TextMode="Password" ></asp:TextBox>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Cp" runat="server" Text="Confirm Password"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:TextBox ID="ConfirmP" runat="server" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="ComP" runat="server" ForeColor="#CC0000"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
        <asp:Label ID="genre" runat="server" Text="Please Choose Your Prefered Genre"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:RadioButtonList ID="Gen" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
                    </asp:RadioButtonList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
   <asp:Label ID="member" runat="server" Text="The type of membership"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
   <asp:RadioButtonList ID="Members" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  ></asp:RadioButtonList>

                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">

            <asp:Button ID="Sign" runat="server" Text="Sign Up" AutoPostBack="True"  OnCheckedChanged="CtrlChanged"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
