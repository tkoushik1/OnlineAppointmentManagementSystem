<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Put the following javascript before the closing </head> tag. -->
    <link href="jquery-ui-1.9.1.custom.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.8.2.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.9.1.custom.js" type="text/javascript"></script>
     <script>
         $(function () {
             $("#TextBox1").datepicker();
             $("#anim").change(function () {
                 $("#TextBox1").datepicker("option", "showAnim", $slideDown);
             });
         });
    </script>
<script type="text/javascript">
    (function () {
        var cx = '015812879989043969613:bcsonp-4urq';
        var gcse = document.createElement('script'); gcse.type = 'text/javascript'; gcse.async = true;
        gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//www.google.com/cse/cse.js?cx=' + cx;
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(gcse, s);
    })();
</script>

<!-- Place this tag where you want both of the search box and the search results to render -->

</head>
<body>
    <form id="form1" runat="server">
    <div class="main">
    <gcse:search>
    <iframe id="Ifgooglesearch" src="Googlesearch.htm" frameborder="0" scrolling="no" style="padding-top:0px; height:auto; width:auto; margin-top:0px"></iframe>
    </gcse:search>
    </div>
    <div>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
            DataFile="http://feeds.bbci.co.uk/news/technology/rss.xml" 
            XPath="rss/channel/item [position()&lt;=4]"></asp:XmlDataSource>
    </div>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="XmlDataSource1">
    <ItemTemplate>
                <%#XPath("title")%><br />
                <%#XPath("pubDate")%><br />
                <%#XPath("author")%><br />
                <%#XPath("description")%>
</ItemTemplate>
    </asp:DataList>

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:Calendar ID="Calendar1" runat="server" 
        onselectionchanged="selectionChange"></asp:Calendar>

    </form>
    <p>Animations:<br />
    <select id="anim">
        <option value="show">Show (default)</option>
        <option value="slideDown">Slide down</option>
        <option value="fadeIn">Fade in</option>
        <option value="blind">Blind (UI Effect)</option>
        <option value="bounce">Bounce (UI Effect)</option>
        <option value="clip">Clip (UI Effect)</option>
        <option value="drop">Drop (UI Effect)</option>
        <option value="fold">Fold (UI Effect)</option>
        <option value="slide">Slide (UI Effect)</option>
        <option value="">None</option>
    </select>
</p>
</body>
</html>
