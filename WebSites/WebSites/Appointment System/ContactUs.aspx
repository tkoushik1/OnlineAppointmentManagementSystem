<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest = "false" CodeFile="ContactUs.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Contact Us Form</title>
    <script type="text/javascript" src="tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
   tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        plugins : "safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager",
        theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_statusbar_location : "bottom",
        theme_advanced_resizing : false,
        template_external_list_url : "js/template_list.js",
        external_link_list_url : "js/link_list.js",
        external_image_list_url : "js/image_list.js",
        media_external_list_url : "js/media_list.js"
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<table border = "0" style="width: 409px">
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Name*"></asp:Label><br />
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server" ValidationGroup = "contact"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" 
             ControlToValidate = "txtName"></asp:RequiredFieldValidator> 
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Subject*"></asp:Label><br />
        </td>
        <td>
            <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" 
             ControlToValidate = "txtSubject"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Email*"></asp:Label><br />
        </td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />
            <asp:RegularExpressionValidator id="valRegEx" runat="server"
            ControlToValidate="txtEmail"
            ValidationExpression=".*@.*\..*"
            ErrorMessage="*Invalid Email address."
            display="dynamic">
            </asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" 
            ControlToValidate = "txtEmail"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td valign = "top" >
            <asp:Label ID="Label4" runat="server" Text="Body*"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtBody" runat="server" TextMode = "MultiLine" ></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" 
            ControlToValidate = "txtBody"></asp:RequiredFieldValidator>
        </td>
    </tr>
     <tr>
        <td></td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
       </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
       </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor = "Green"></asp:Label>
       </td>
    </tr>
</table>
</div>
    </form>
</body>
</html>
