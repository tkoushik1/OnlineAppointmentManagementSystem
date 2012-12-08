<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="makeappointment.aspx.cs" Inherits="makeappointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder3">
<script type ="text/javascript">
    function CheckOne(obj)
    {
        var grid = obj.parentNode.parentNode.parentNode;
        var inputs = grid.getElementsByTagName("input");
        for(var i=0;i<inputs.length;i++)
        {
            if (inputs[i].type =="checkbox")
            {
                if(obj.checked && inputs[i] != obj && inputs[i].checked)
                {
                    inputs[i].checked = false;
                }
            }
        }
        
    }
    </script>
    <p>
        Make Appointment :
        </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        Select a Lecturer&nbsp;&nbsp;&nbsp;&nbsp; :
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="LecturerID" 
            Height="33px" Width="165px" onselectedindexchanged="dropList_Select" 
            AutoPostBack="True">
            
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [LecturerID], [Name] FROM [Professor]">
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ID" DataSourceID="SqlDataSource2" EnableModelValidation="True" 
            Width="522px" onselectedindexchanged="GridView1_SelectedIndexChanged" 
            onrowcreated="onRowCreated" BackColor="White" BorderColor="White" 
            BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
            GridLines="None">
            <Columns>
            <asp:TemplateField HeaderText="">
         <ItemTemplate>
             <asp:CheckBox ID="CheckBox1" runat="server" onclick ="CheckOne(this)" />
         </ItemTemplate>
     </asp:TemplateField>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" Visible="False" />
                <asp:BoundField DataField="LecturerID" HeaderText="LecturerID" 
                    SortExpression="LecturerID" Visible="False" />
                <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" 
                    SortExpression="Date" />
                <asp:BoundField DataField="StartTime" DataFormatString="{0:t}" 
                    HeaderText="StartTime" SortExpression="StartTime" />
                <asp:BoundField DataField="Duration" HeaderText="Duration" 
                    SortExpression="Duration" />
                <asp:BoundField DataField="AppointmentVolume" HeaderText="AppointmentVolume" 
                    SortExpression="AppointmentVolume" />
                <asp:BoundField DataField="BookingRestriction" HeaderText="BookingRestriction" 
                    SortExpression="BookingRestriction" />
                <asp:BoundField DataField="StausID" HeaderText="StausID" 
                    SortExpression="StatusID" Visible="False" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT AppointmentTimeTable.ID, AppointmentTimeTable.LecturerID, AppointmentTimeTable.Date, AppointmentTimeTable.StartTime, AppointmentTimeTable.Duration, AppointmentTimeTable.AppointmentVolume, AppointmentTimeTable.BookingRestriction, AppointmentTimeTable.StatusID, AppointmentTimeStatus.Type FROM AppointmentTimeStatus INNER JOIN AppointmentTimeTable ON AppointmentTimeStatus.ID = AppointmentTimeTable.StatusID WHERE (AppointmentTimeTable.LecturerID = @LecturerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="LecturerID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        Subject&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 
        <asp:TextBox ID="txtSubject" runat="server" Height="25px" Width="270px"></asp:TextBox>
    </p>
    <p>
        Start Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
        <asp:DropDownList ID="DropDownList2" runat="server" Height="34px" Width="199px" 
            AutoPostBack="True" onselectedindexchanged="startTime_DropDown">
        </asp:DropDownList>
    </p>
    <p>
        End Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  :
        <asp:TextBox ID="txtEndtime" runat="server" BackColor="#CCCCCC" Enabled="False" 
            ReadOnly="True" Width="187px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Make Appointment" Height="35px" Width="150px" />
    </p>
</asp:Content>


