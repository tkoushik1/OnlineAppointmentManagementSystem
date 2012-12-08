<%@ Page Title="" Language="C#" MasterPageFile="~/Professor.master" Debug="true" AutoEventWireup="true" CodeFile="setupappointmenttime.aspx.cs" Inherits="setupappointment" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: large;
        }
    .style2
    {
        font-size: large;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    
    <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
      </ajaxtoolkit:ToolkitScriptManager>
    <p class="style2">
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        Setup Appointment Time</strong></p>
    <p class="style2">
       Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 
        <asp:TextBox ID="txtCalendar" runat="server" Width="200px" Height="35px" />
<ajaxtoolkit:PopupControlExtender ID="txtCalendar_PopupControlExtender" runat="server" 
            Enabled="True" PopupControlID="pnlCalendar" Position="Bottom" 
            TargetControlID="txtCalendar" />
<asp:Panel ID="pnlCalendar" runat="server">
   <asp:Calendar ID="MyCalendar" runat="server" BackColor="White" 
        BorderColor="Black" Font-Names="Verdana" Font-Size="9pt" 
        ForeColor="Black" Height="194px" NextPrevFormat="ShortMonth" Width="439px" 
        onselectionchanged="MyCalendar_SelectionChanged" 
        ondayrender="MyCalendar_DayRender" BorderStyle="Solid" CellSpacing="1">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
            Height="8pt" />
        <DayStyle BackColor="#CCCCCC" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="#333399" 
            Font-Bold="True" Font-Size="12pt" ForeColor="White" BorderStyle="Solid" 
            Height="12pt" />
        <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar> 
</asp:Panel> 
</p>
<p class="style2">
        Start Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
        <asp:DropDownList ID="DropDownList1" runat="server" Height="35px" Width="175px">
        </asp:DropDownList>
&nbsp;</p>
<p class="style2">
        Duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
        <asp:DropDownList ID="DropDownList2" runat="server" Height="35px" Width="175px">
            <asp:ListItem Value="30">30 Min</asp:ListItem>
            <asp:ListItem Value="1">1 Hours</asp:ListItem>
            <asp:ListItem Value="2 ">2 Hours</asp:ListItem>
        </asp:DropDownList>
</p>
<p class="style2">
        Max No of Appointments :
        <asp:TextBox ID="txtAppvolume" runat="server" Height="35px" Width="175px"></asp:TextBox>
</p>
<p class="style2">
        Booking Restriction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
        <asp:DropDownList ID="DropDownList3" runat="server" Height="35px" Width="175px">
        </asp:DropDownList>
&nbsp;or
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Open to All Students" />
</p>
<p class="style1">
        <asp:Button ID="Button1" runat="server" Text="Submit" Width="116px" 
            onclick="Button1_Click" Height="35" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Reset" Width="116px" Height="35" />
</p>
</asp:Content>

