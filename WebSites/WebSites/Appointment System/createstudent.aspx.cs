using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyService;
public partial class createstudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MyService.UserWebService uws = new UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        String[] id = uws.getNonRegisteredStudentId();
        DropDownList2.DataSource = id;
        DropDownList2.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MyService.UserWebService uws = new UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        int n = uws.addStudentInfo(Int32.Parse(DropDownList2.SelectedValue), txtStudentName.Text,Int32.Parse(DropDownList1.SelectedValue), txtStudentEmail.Text, txtStudentMobile.Text);
        if (n == 3)
        {
            Response.Write(@"<script language='javascript'>alert('This Student ID already Exists !!')</script>");
        }
        else if (n == 1)
        {
            Response.Write(@"<script language='javascript'>alert('Successfull Added the Student Info to Table!!')</script>");
        }
        else if (n == -1)
        {
            Response.Write(@"<script language='javascript'>alert('Error in Adding the Student Info!! Please Check the Format of the entered fields')</script>");
        }
        else if (n == 2)
        {
            Response.Write(@"<script language='javascript'>alert('Error in Adding the Student Info!!Student not yet Signed Up!!')</script>");
        }
    }
}