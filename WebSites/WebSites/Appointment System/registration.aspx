<%@ Page Title="" Language="C#" MasterPageFile="~/Admin0.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    Registration&nbsp; Page&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <p>
        Registration Type :
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            Height="48px" onselectedindexchanged="IndexChange" Width="182px">
            <asp:ListItem>Select Here..</asp:ListItem>
            <asp:ListItem Value="Professor">Professor</asp:ListItem>
            <asp:ListItem Value="Student">Student</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        UserName&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        :
        <asp:TextBox ID="txtSUsername" runat="server" Height="35px" 
            style="font-size: large" Width="175px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Image ID="imgTick" runat="server" ImageUrl="~/images/checkmark.png" />
&nbsp;&nbsp;
        <asp:Image ID="imgWrong" runat="server" ImageUrl="~/images/error.png" />
&nbsp;<asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
            style="font-size: large" Text="Check Availability" Width="166px" />
    </p>
    <p>
        Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        :
        <asp:TextBox ID="txtSPassword" runat="server" Height="36px" 
            style="font-size: large" Width="179px" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        Retype Password :
        <asp:TextBox ID="txtSConfirmPassword" runat="server" Height="36px" 
            style="font-size: large" Width="182px" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        Student ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        : 
        <asp:TextBox ID="txtStudentID" runat="server" Height="33px" 
            style="font-size: large" Width="182px"></asp:TextBox>
    </p>
    <p>
        Professor ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
        <asp:TextBox ID="txtProfessorID" runat="server" Height="34px" 
            style="font-size: large" Width="181px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" style="font-size: large" Text="Submit" 
            Width="131px" onclick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" style="font-size: large" Text="Reset" 
            Width="121px" onclick="Button2_Click" />
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server">Back To HomePage</asp:LinkButton>
        &nbsp;</p>
</asp:Content>

