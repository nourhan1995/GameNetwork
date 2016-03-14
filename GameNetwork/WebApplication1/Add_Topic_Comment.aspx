<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Topic_Comment.aspx.cs" Inherits="WebApplication1.Add_Topic_Comment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="email_label" runat="server"></asp:Label>   
        <asp:Label ID="topic_label" runat="server" Visible="false"></asp:Label> 
        <asp:Label ID="community_label" runat="server" Visible="false"></asp:Label>
        <br />
        <asp:Label ID="comment_label" runat="server" Text="Comment"></asp:Label>
        <br />
        <asp:TextBox ID="comment_textBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="comment_textBox" ErrorMessage="Comment is a required field." ForeColor="Red">
</asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="add_button" runat="server" Text="Add" OnClick="add_button_Click"/>
    </div>
    </form>
</body>
</html>
