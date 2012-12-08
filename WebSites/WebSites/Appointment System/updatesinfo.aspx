<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="updatesinfo.aspx.cs" Inherits="updatesinfo_" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder3">
    Student ID :
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" BackColor="White" BorderColor="#3366CC" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" CellSpacing="1" 
        Height="182px" Width="623px">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" 
                SortExpression="StudentID" />
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                SortExpression="Name" />
            <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" 
                SortExpression="CourseID" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Mobilephone" HeaderText="Mobilephone" 
                SortExpression="Mobilephone" />
        </Columns>
        <EditRowStyle HorizontalAlign="Left" />
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" 
            HorizontalAlign="Center" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#33CCFF" BorderStyle="Groove" Font-Bold="True" 
            ForeColor="#CCFF99" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Student] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [Student] ([StudentID], [Name], [CourseID], [Email], [Mobilephone]) VALUES (@StudentID, @Name, @CourseID, @Email, @Mobilephone)" 
        SelectCommand="SELECT * FROM [Student] WHERE ([StudentID] = @StudentID)" 
        UpdateCommand="UPDATE [Student] SET [Email] = @Email, [Mobilephone] = @Mobilephone WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="StudentID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="CourseID" Type="Int32" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Mobilephone" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="StudentID" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="StudentID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="CourseID" Type="Int32" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Mobilephone" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>


