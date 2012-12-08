<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="adminmenu.aspx.cs" Inherits="adminmenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    Welcome To Appointment Management System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    List of Student ID&#39;s to add to Database :<br />
    <asp:GridView ID="GridView1" runat="server" 
        onrowdatabound="GridView1_RowDataBound">

    </asp:GridView>
    <br />
    <br />
</asp:Content>


<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

</asp:Content>



