<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Development.aspx.cs" Inherits="WebApplication1.Development" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 417px;
        }
        .auto-style3 {
            width: 57px;
        }
        .auto-style4 {
            width: 72px;
        }
        .auto-style5 {
            width: 126px;
        }
        .auto-style6 {
            margin-left: 38px;
        }
        .auto-style7 {
            margin-left: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="Search" runat="server" Width="385px"></asp:TextBox>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="SearchB" runat="server" Text="Search" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Team" runat="server" Text="Team Name"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Button ID="Update" runat="server" Text="Update" OnClick="Update_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="TeamName" runat="server" Text=""></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Com" runat="server" Text="Company Name"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="ComanyName" runat="server" Text=""></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Foundation" runat="server" Text="Foundation Date : MM/DD/YY"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="FoundationDate" runat="server" Text=""></asp:Label>
                    <table class="auto-style1">
                        <tr>
                            <td>
                                <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style4">
                                            <asp:Button ID="Games" runat="server" Text="Games" />
                                        </td>
                                        <td class="auto-style5">
                                            <asp:Button ID="comunity" runat="server" CssClass="auto-style7" Text="comunity" />
                                        </td>
                                        <td>
                                            <asp:Button ID="conferences" runat="server" CssClass="auto-style6" Text="conferences" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
