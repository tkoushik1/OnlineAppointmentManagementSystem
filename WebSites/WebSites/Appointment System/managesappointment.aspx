<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="managesappointment.aspx.cs" Inherits="managesappointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <p>
        <strong>Mangae Student Appointment :</strong></p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ID" DataSourceID="SqlDataSource1" EnableModelValidation="True" 
            Height="172px" Width="606px" BackColor="White" BorderColor="White" 
            BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
            GridLines="None">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" Visible="False" />
                <asp:BoundField DataField="AppointmentTimeID" HeaderText="AppointmentTimeID" 
                    SortExpression="AppointmentTimeID" Visible="False" />
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" 
                    SortExpression="StudentID" ReadOnly="True" />
                <asp:BoundField DataField="Subject" HeaderText="Subject" 
                    SortExpression="Subject" ReadOnly="True" />
                <asp:BoundField DataField="StartTime" HeaderText="StartTime" 
                    SortExpression="StartTime" ReadOnly="True" />
                <asp:BoundField DataField="EndTime" HeaderText="EndTime" 
                    SortExpression="EndTime" ReadOnly="True" />
                <asp:BoundField DataField="AStatusID" HeaderText="AStatusID" 
                    SortExpression="AStatusID" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM Appointment WHERE [ID] = @ID" 
            SelectCommand="SELECT Appointment.ID, Appointment.AppointmentTimeID, Appointment.StudentID, Appointment.Subject, Appointment.StartTime, Appointment.EndTime, Appointment.AStatusID, AppointmentStatus.Type FROM Appointment INNER JOIN AppointmentStatus ON Appointment.AStatusID = AppointmentStatus.ID">
        </asp:SqlDataSource>
    </p>
</asp:Content>

