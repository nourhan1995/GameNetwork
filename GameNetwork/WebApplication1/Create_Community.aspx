<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create_Community.aspx.cs" Inherits="WebApplication1.Create_Community" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="email_label" runat="server"></asp:Label>
        </div>
    <div>
        <div>
            <asp:Label ID ="name_label" runat="server" Text="Community Name: "></asp:Label>
            <asp:TextBox ID="name_textBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="name_textBox" ErrorMessage="Name is a required field." ForeColor="Red">
</asp:RequiredFieldValidator>
            <br />
            <asp:Label ID ="description_label" runat ="server" Text ="Description: "></asp:Label>
            <br />
            <asp:TextBox ID ="description_textBox" runat ="server" Height="100px" Width="300px"></asp:TextBox>
            <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="description_textBox" ErrorMessage="Description is a required field." ForeColor="Red">
</asp:RequiredFieldValidator>
        </div>
        <div>            
            <asp:Label ID="confirm_submit" runat ="server" />
        </div>
        <div>
            <asp:Button ID="submit_button" runat="server" OnClick="submit_button_Click" Text="Submit" style="height: 26px"/>
        </div>
                
    </div>
    </form>
</body>
</html>
