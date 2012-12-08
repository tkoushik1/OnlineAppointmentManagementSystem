<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DisplayPop3Email.aspx.cs" Inherits="DisplayPop3Email" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
		.emails-table { width: 600px; border: solid 1px #444444; }
		.emails-table-header { font-family: "Trebuchet MS"; font-size: 9pt;
			background-color: #0099B9; font-weight: bold; color: white;
			text-align: center; border: solid 1px #444444; }
		.emails-table-header-cell { font-family: "Georgia"; font-size: 9pt;
			font-weight: bold; border: solid 1px #666666; padding: 6px; }
		.emails-table-cell { font-family: "Georgia"; font-size: 9pt;
			border: solid 1px #666666; padding: 6px; }
		.emails-table-footer { border: solid 1px #666666; padding: 3px;
			width: 50%; }
		.email-datetime { float: right; color: #666666; }
		
		a { font-family: "Lucida Sans Unicode", "Trebuchet MS"; font-size: 9pt;
			color: #005B7F; }
		a:hover { color:red; }
		pre { font-family: "Georgia"; font-size: 9pt; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Literal ID="DebugLiteral" runat="server" />
    
    <table class="emails-table">
    <tr>
		<td class="emails-table-header" colspan="2">
		Email #<asp:Literal ID="EmailIdLiteral" runat="server" /></td>
    </tr>
    <tr>
		<td class="emails-table-header-cell">Date &amp; Time</td>
		<td class="emails-table-cell">
			<asp:Literal ID="DateLiteral" runat="server" /></td>
    </tr>
    <tr>
		<td class="emails-table-header-cell">From</td>
		<td class="emails-table-cell">
			<asp:Literal ID="FromLiteral" runat="server" /></td>
    </tr>
    <tr>
		<td class="emails-table-header-cell">Subject</td>
		<td class="emails-table-cell">
			<asp:Literal ID="SubjectLiteral" runat="server" /></td>
    </tr>
    <tr id="AttachementsRow" runat="server">
		<td class="emails-table-header-cell">Attachments</td>
		<td class="emails-table-cell">
			<asp:Literal ID="AttachmentsLiteral" runat="server" /></td>
    </tr>
     <tr>
		<td class="emails-table-cell" colspan="2">
			<asp:Literal ID="HeadersLiteral" runat="server" /></td>
    </tr>
    <tr>
		<td class="emails-table-cell" colspan="2">
			<asp:Literal ID="BodyLiteral" runat="server" /></td>
    </tr>
    </table>
    </form>
</body>
</html>
