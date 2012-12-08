<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="studentchangepassword.aspx.cs" Inherits="studentchangepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
 <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <span class="style1">Change Password</span></p>
<p>
    Old Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
    <asp:TextBox ID="txtLOldPwd" runat="server" Height="26px" 
        style="font-size: large" Width="149px" TextMode="Password"></asp:TextBox>
</p>
<p>
    New Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
    <asp:TextBox ID="txtLNewPwd" runat="server" Height="26px" 
        style="font-size: large" Width="149px" TextMode="Password"></asp:TextBox>
</p>
<p>
    Confirm Password&nbsp; :
    <asp:TextBox ID="txtLConfirmPwd" runat="server" Height="26px" 
        style="font-size: large" Width="152px" TextMode="Password"></asp:TextBox>
</p>
<p>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        style="font-size: medium; height: 28px;" Text="Change Password" 
        Width="144px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" style="font-size: medium" Text="Cancel" 
        Width="119px" />
</p>
</asp:Content>

