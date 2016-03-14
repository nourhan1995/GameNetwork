<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Community_Details.aspx.cs" Inherits="WebApplication1.Community_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="email_label" runat="server"></asp:Label>
        <asp:Label ID="theme_label" runat="server"></asp:Label>
        <br />
        <asp:Label ID="name_label" runat="server"></asp:Label> 
        <br />
        <asp:Label ID="description_label" runat="server"></asp:Label>   
        <br />
        <asp:Button ID="join_button" runat="server" Text="Join" OnClick="join_button_Click" />
        <asp:Button ID="add_topic" runat="server" Text="Add Topic" OnClick="add_topic_Click" />

    </div>
    </form>
</body>
</html>
