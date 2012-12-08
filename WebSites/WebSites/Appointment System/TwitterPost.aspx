<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TwitterPost.aspx.cs" Inherits="CS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Button ID="btnAuthorize" runat="server" Text="Authorize" OnClick="btnAuthorize_Click" CausesValidation = "false" />
    <hr />
    <asp:Panel runat="server" ID = "pnlTweet" Enabled = "false">
        <asp:TextBox ID="txtTweet" runat="server" TextMode="MultiLine" Height="50"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTweet"
            ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="btnTweet" runat="server" Text="Tweet" OnClick="btnTweet_Click" /></asp:Panel>
    </form>
</body>
</html>
