<%@ Page Title="" Language="C#" MasterPageFile="~/Professor.master" AutoEventWireup="true" CodeFile="updatelinfo.aspx.cs" Inherits="updatelinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: large;
            font-family: Verdana;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="style1"><strong>Update Lecturer Info</strong></span></p>
    <p>
        Lecturer ID :
        <asp:TextBox ID="txtUpdateLID" runat="server" Enabled="False" Height="26px" 
            ReadOnly="True" Width="154px"></asp:TextBox>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ID" DataSourceID="SqlDataSource1" EnableModelValidation="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" Visible="False" />
                <asp:BoundField DataField="LecturerID" HeaderText="LecturerID" 
                    SortExpression="LecturerID" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" 
                    ReadOnly="True" />
                <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" 
                    SortExpression="DepartmentID" ReadOnly="True" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Mobilephone" HeaderText="Mobilephone" 
                    SortExpression="Mobilephone" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Professor] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [Professor] ([LecturerID], [Name], [DepartmentID], [Email], [Mobilephone]) VALUES (@LecturerID, @Name, @DepartmentID, @Email, @Mobilephone)" 
            SelectCommand="SELECT * FROM [Professor] WHERE ([LecturerID] = @LecturerID)" 
            UpdateCommand="UPDATE [Professor] SET [Email] = @Email, [Mobilephone] = @Mobilephone WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LecturerID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="DepartmentID" Type="Int32" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Mobilephone" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtUpdateLID" Name="LecturerID" 
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="LecturerID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="DepartmentID" Type="Int32" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Mobilephone" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

