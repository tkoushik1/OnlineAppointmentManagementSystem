<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacebookPost.aspx.cs" Inherits="CS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<asp:Button ID="btnAuthorize" runat="server" Text="Authorize" OnClick="Authorize" /><hr />
<asp:Panel ID="pnlPost" runat="server" Enabled="false">
    Message: <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"></asp:TextBox><br />
    <asp:Button ID="btnPost" runat="server" Text="Post to Wall" OnClick="Post" />
</asp:Panel>
    </form>
</body>
</html>
