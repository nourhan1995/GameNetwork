<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Topic.aspx.cs" Inherits="WebApplication1.Add_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="email_label" runat="server"></asp:Label>   
        <asp:Label ID="theme_label" runat="server" Visible="false"></asp:Label> 
        <br />
        <asp:Label ID="title_label" runat="server" Text ="Title"></asp:Label>
        <asp:TextBox ID="title_textBox" runat="server" OnTextChanged="title_textBox_TextChanged" Width="251px"></asp:TextBox>
        <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="title_textBox" ErrorMessage="Title is a required field." ForeColor="Red">
</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="description_label" runat="server" Text="Description"></asp:Label>
        <br />
        <asp:TextBox ID="description_textBox" runat="server" Height="230px" Width="273px"></asp:TextBox>
        <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="description_textBox" ErrorMessage="Description is a required field." ForeColor="Red">
</asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="add_button" runat="server" Text="Add" OnClick="add_button_Click"/>
    </div>
    </form>
</body>
</html>
