<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Topic_Details.aspx.cs" Inherits="WebApplication1.Topic_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="email_label" runat="server"></asp:Label>    
        <asp:Label ID="topic" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="community" runat="server" Visible="false"></asp:Label>
        <br />
        <asp:Label runat="server" Text="Title: "></asp:Label>
        <asp:Label ID="title_label" runat="server"></asp:Label>
        <br />
        <asp:Label runat="server" Text="Author: "></asp:Label>
        <asp:HyperLink ID="author_topic_email" runat="server"></asp:HyperLink>
        <br />
        <asp:Label runat="server" Text="Article: "></asp:Label>
        <asp:Label ID="description_label" runat="server"></asp:Label>
        <br /> 
        <asp:Button ID="delete_button" runat="server" Text="Delete Topic" OnClick="delete_button_Click" />
        <asp:Button ID="add_comment_button" runat="server" Text ="Add Comment" OnClick="add_comment_button_Click" />
        <br />
        <asp:Label runat="server" Text="Comments: "></asp:Label>
        <br />
        <asp:Label ID="confirm_label" runat="server"></asp:Label>
        <br />

    </div>
    </form>
</body>
</html>
