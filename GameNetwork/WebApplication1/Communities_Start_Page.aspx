<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Communities_Start_Page.aspx.cs" Inherits="WebApplication1.Communities_Start_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!--<h4> user email to be added</h4>-->
            <asp:Label ID="email_label" runat="server" ></asp:Label>
        </div>
    <div>

        <div>
            <h1>Welcome to our communities</h1>
        </div>
        <div>
            <asp:Label ID="confirm_submit" runat ="server" />
        </div>
        <div>
            <asp:Button  ID ="create_button" runat="server" Text ="Create"  OnClick ="Create_Community"/>
            <asp:Button  ID ="view_button" runat="server" Text ="View All Communities" OnClick="view" />
        </div>
    
    </div>
    </form>
</body>
</html>
