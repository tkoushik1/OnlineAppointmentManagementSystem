<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/Professor.master" AutoEventWireup="true" CodeFile="managelappointment.aspx.cs" Inherits="managelappointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    Professor ID =
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" DataKeyNames="ID" 
        onrowediting="gridView_RowEdit" onrowupdated="dridView_RoeUpdated" 
    Height="106px" HorizontalAlign="Left" Width="476px">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" 
                DataFormatString="{0:d}" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="StartTime" HeaderText="StartTime" 
                SortExpression="StartTime" DataFormatString="{0:t}" />
            <asp:BoundField DataField="Duration" HeaderText="Duration" 
                SortExpression="Duration" />
            <asp:BoundField DataField="AppointmentVolume" HeaderText="Volume" 
                SortExpression="AppointmentVolume" />
            <asp:BoundField DataField="BookingRestriction" 
                HeaderText="BookingRestriction" SortExpression="BookingRestriction" />
            <asp:BoundField DataField="Type" HeaderText="Type" 
                SortExpression="Type" />
            <asp:BoundField DataField="ID" HeaderText="ID" 
                SortExpression="ID" InsertVisible="False" ReadOnly="True" 
                Visible="False" />
            <asp:BoundField DataField="LecturerID" HeaderText="LecturerID" 
                SortExpression="LecturerID" Visible="False" />
            <asp:BoundField DataField="StatusID" HeaderText="StatusID" 
                SortExpression="StatusID" Visible="False" />
        </Columns>
        <PagerStyle HorizontalAlign="Left" />
        <RowStyle HorizontalAlign="Left" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM AppointmentTimeTable WHERE (ID = @ID)" 
        SelectCommand="SELECT AppointmentTimeTable.Date, AppointmentTimeTable.StartTime, AppointmentTimeTable.Duration, AppointmentTimeTable.AppointmentVolume, AppointmentTimeTable.BookingRestriction, AppointmentTimeStatus.Type, AppointmentTimeTable.ID, AppointmentTimeTable.LecturerID, AppointmentTimeTable.StatusID FROM AppointmentTimeStatus INNER JOIN AppointmentTimeTable ON AppointmentTimeStatus.ID = AppointmentTimeTable.StatusID WHERE (AppointmentTimeTable.LecturerID = @LecturerID) AND (AppointmentTimeTable.Date &gt;= GETDATE())" 
        
        
        UpdateCommand="UPDATE AppointmentTimeTable SET StatusID = @StatusID WHERE (ID = @ID)">
        <DeleteParameters>
            <asp:Parameter Name="ID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" DefaultValue="" Name="LecturerID" 
                PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="StatusID" />
            <asp:Parameter Name="ID" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

