<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="studentappointmentreport.aspx.cs" Inherits="studentappointmentreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    Student ID :
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="0" DataSourceID="SqlDataSource1" EnableModelValidation="True" 
        GridLines="Vertical" Height="212px" HorizontalAlign="Left" Width="607px">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" 
                SortExpression="Date" />
            <asp:BoundField DataField="StartTime" DataFormatString="{0:t}" 
                HeaderText="StartTime" SortExpression="StartTime" />
            <asp:BoundField DataField="EndTime" DataFormatString="{0:t}" 
                HeaderText="EndTime" SortExpression="EndTime" />
            <asp:BoundField DataField="Name" HeaderText="Lecturer" SortExpression="Name" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" 
                SortExpression="Subject" />
            <asp:BoundField DataField="Type" HeaderText="Status" SortExpression="Type" />
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" 
                SortExpression="StudentID" Visible="False" />
            <asp:BoundField DataField="AStatusID" HeaderText="AStatusID" 
                SortExpression="AStatusID" Visible="False" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Center" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT Appointment.ID, Appointment.StartTime, Appointment.EndTime, AppointmentStatus.Type, AppointmentTimeTable.Date, StudentAccount.StudentID, Professor.Name, Appointment.AStatusID, Appointment.Subject FROM Appointment INNER JOIN AppointmentStatus ON Appointment.AStatusID = AppointmentStatus.ID INNER JOIN AppointmentTimeTable ON Appointment.AppointmentTimeID = AppointmentTimeTable.ID INNER JOIN ProfessorAccount ON AppointmentTimeTable.LecturerID = ProfessorAccount.LecturerID INNER JOIN StudentAccount ON Appointment.StudentID = StudentAccount.StudentID INNER JOIN Professor ON ProfessorAccount.LecturerID = Professor.LecturerID WHERE (StudentAccount.StudentID = @StudentID) AND (Appointment.AStatusID = 2)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="StudentID" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

