<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="createlecturer.aspx.cs" Inherits="createlecturer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    .style2
    {
        text-align: left;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <p class="style1">
        <strong>Create Professor Account:</strong></p>
    <p class="style2">
        Professor ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
        <asp:DropDownList ID="DropDownList2" runat="server" Height="33px" Width="151px">
        </asp:DropDownList>
    </p>
    <p class="style2">
        Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        :
        <asp:TextBox ID="txtProfessorName" runat="server" Height="30px" Width="150px"></asp:TextBox>
    </p>
    <p class="style2">
        Department ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="Name" 
            DataValueField="DepartmentID" Height="31px" Width="150px">
            <asp:ListItem>Select Here.....</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [DepartmentID], [Name] FROM [Department]">
        </asp:SqlDataSource>
    </p>
    <p class="style2">
        Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        : 
        <asp:TextBox ID="txtProfessorEmail" runat="server" Height="30px" Width="150px"></asp:TextBox>
    </p>
    <p class="style2">
        MobilePhone No&nbsp;&nbsp; :
        <asp:TextBox ID="txtProfessorMobile" runat="server" Height="30px" Width="150px"></asp:TextBox>
    </p>
    <p class="style2">
        <asp:Button ID="Button1" runat="server" Text="Submit" Width="131px" 
            onclick="Button1_Click" Height="33px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Reset" Width="138px" 
            Height="31px" />
    </p>
    <p class="style1">
        </p>
    <p class="style1">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Back to Admin Menu</asp:LinkButton>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

