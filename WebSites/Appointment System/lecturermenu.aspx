<%@ Page Title="" Language="C#" MasterPageFile="~/Professor.master" AutoEventWireup="true" CodeFile="lecturermenu.aspx.cs" Inherits="lecturermenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    Lecturer ID :
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSource1" EnableModelValidation="True" 
        Height="190px" Width="609px" AllowSorting="True" BackColor="White" 
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        HorizontalAlign="Center" onrowediting="gridView_RowEdit" onrowupdated="gridView_RowUpdated" 
        >
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="AppointmentTimeID" HeaderText="AppointmentTimeID" 
                SortExpression="AppointmentTimeID" Visible="False" ReadOnly="True" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" 
                DataFormatString="{0:d}" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" 
                SortExpression="Name" ReadOnly="True" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" 
                SortExpression="Subject" ReadOnly="True" />
            <asp:BoundField DataField="StartTime" HeaderText="StartTime" 
                SortExpression="StartTime" DataFormatString="{0:t}" ReadOnly="True" />
            <asp:BoundField DataField="EndTime" DataFormatString="{0:t}" 
                HeaderText="EndTime" SortExpression="EndTime" ReadOnly="True" />
            <asp:BoundField DataField="Type" HeaderText="Type" 
                SortExpression="Type" ReadOnly="True" />
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" 
                SortExpression="StudentID" ReadOnly="True" />
            <asp:BoundField DataField="AStatusID" 
                HeaderText="AStatusID" SortExpression="AStatusID" Visible="False" />
            <asp:BoundField DataField="LecturerID" HeaderText="LecturerID" 
                SortExpression="LecturerID" Visible="False" ReadOnly="True" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" 
            HorizontalAlign="Center" VerticalAlign="Middle" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" 
            VerticalAlign="Middle" />
        <RowStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Left" 
            VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        SelectCommand="SELECT Appointment.AppointmentTimeID, Appointment.ID, Appointment.StudentID, Appointment.Subject, Appointment.StartTime, Appointment.EndTime, Appointment.AStatusID, AppointmentStatus.Type, AppointmentTimeTable.Date, Student.Name, AppointmentTimeTable.LecturerID FROM Appointment INNER JOIN AppointmentStatus ON Appointment.AStatusID = AppointmentStatus.ID INNER JOIN AppointmentTimeTable ON Appointment.AppointmentTimeID = AppointmentTimeTable.ID INNER JOIN Student ON Appointment.StudentID = Student.StudentID INNER JOIN ProfessorAccount ON AppointmentTimeTable.LecturerID = ProfessorAccount.LecturerID WHERE (AppointmentTimeTable.LecturerID = @LecturerID) AND (AppointmentTimeTable.Date &gt;= GETDATE() AND ((Appointment.AStatusID = 1) OR (Appointment.AStatusID = 3)))" 
        UpdateCommand="UPDATE Appointment SET AStatusID = @AstatusID WHERE (ID = @ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label2" Name="LecturerID" 
                PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="AstatusID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

