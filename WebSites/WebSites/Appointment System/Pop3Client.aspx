<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pop3Client.aspx.cs" Inherits="Pop3Client" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
		.emails-table { width: 600px; border: solid 1px #444444; }
		.emails-table-header { font-family: "Trebuchet MS"; font-size: 9pt;
			background-color: #0099B9; color: white;
			border: solid 1px #444444; }
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:Table ID="EmailsTable" CssClass="emails-table" runat="server">
		<asp:TableHeaderRow>
			<asp:TableHeaderCell CssClass="emails-table-header"
				ColumnSpan="4">Listing emails 
			<asp:Literal ID="EmailFromLiteral" runat="server" />-
			<asp:Literal ID="EmailToLiteral" runat="server" /> of 
			<asp:Literal ID="EmailTotalLiteral" runat="server" /> for 
			<asp:Literal ID="EmailLiteral" runat="server" />
			</asp:TableHeaderCell>
		</asp:TableHeaderRow>
		<asp:TableRow>
			<asp:TableCell CssClass="emails-table-header-cell">
				#</asp:TableCell>
			<asp:TableCell CssClass="emails-table-header-cell">
				From</asp:TableCell>
			<asp:TableCell CssClass="emails-table-header-cell">
				Subject</asp:TableCell>
			<asp:TableCell CssClass="emails-table-header-cell">
				Date &amp; Time</asp:TableCell>
		</asp:TableRow>
		<asp:TableFooterRow>
			<asp:TableCell CssClass="emails-table-footer" ColumnSpan="4">
			<asp:Table ID="FooterTable" Width="100%"
				BorderWidth="0" runat="server">
			<asp:TableRow>
			<asp:TableCell>
				<asp:Literal ID="PreviousPageLiteral" runat="server" />
			</asp:TableCell>
			<asp:TableCell HorizontalAlign="Right">
				<asp:Literal ID="NextPageLiteral" runat="server" />
			</asp:TableCell>
			</asp:TableRow>
			</asp:Table>
			</asp:TableCell>
		</asp:TableFooterRow>
		</asp:Table>
    </div>
    </form>
</body>
</html>
