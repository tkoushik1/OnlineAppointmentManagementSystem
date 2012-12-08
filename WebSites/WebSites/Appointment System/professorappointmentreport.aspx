<%@ Page Title="" Language="C#" MasterPageFile="~/Professor.master" AutoEventWireup="true" CodeFile="professorappointmentreport.aspx.cs" Inherits="professorappointmentreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    Lecturer ID :&nbsp;
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" 
        Height="196px" Width="534px">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" 
                DataFormatString="{0:d}" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="StartTime" HeaderText="StartTime" 
                SortExpression="StartTime" DataFormatString="{0:t}" />
            <asp:BoundField DataField="EndTime" HeaderText="EndTime" 
                SortExpression="EndTime" DataFormatString="{0:t}" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" 
                SortExpression="Subject" />
            <asp:BoundField DataField="Type" HeaderText="Status" SortExpression="Type" />
            <asp:BoundField DataField="AppointmentTimeID" HeaderText="AppointmentTimeID" 
                SortExpression="AppointmentTimeID" Visible="False" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" 
                SortExpression="StudentID" Visible="False" />
            <asp:BoundField DataField="AStatusID" HeaderText="AStatusID" 
                SortExpression="AStatusID" Visible="False" />
            <asp:BoundField DataField="LecturerID" HeaderText="LecturerID" 
                SortExpression="LecturerID" Visible="False" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT Appointment.AppointmentTimeID, Appointment.ID, Appointment.StudentID, Appointment.Subject, Appointment.StartTime, Appointment.EndTime, Appointment.AStatusID, AppointmentStatus.Type, AppointmentTimeTable.Date, Student.Name, AppointmentTimeTable.LecturerID FROM Appointment INNER JOIN AppointmentStatus ON Appointment.AStatusID = AppointmentStatus.ID INNER JOIN AppointmentTimeTable ON Appointment.AppointmentTimeID = AppointmentTimeTable.ID INNER JOIN Student ON Appointment.StudentID = Student.StudentID INNER JOIN ProfessorAccount ON AppointmentTimeTable.LecturerID = ProfessorAccount.LecturerID WHERE (AppointmentTimeTable.LecturerID = @LecturerID) AND (AppointmentTimeTable.Date &gt;= GETDATE()) AND (Appointment.AStatusID = 2)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label3" Name="LecturerID" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

