using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyService;
public partial class createlecturer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MyService.UserWebService uws = new UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        String[] id = uws.getNonRegisteredProfessorId();
        DropDownList2.DataSource = id;
        DropDownList2.DataBind();
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminmenu.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MyService.UserWebService uws = new UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        int n = uws.addProfessorInfo(Int32.Parse(DropDownList2.SelectedValue), txtProfessorName.Text, Int32.Parse(DropDownList1.SelectedValue), txtProfessorEmail.Text, txtProfessorMobile.Text);
        if (n == 3)
        {
            Response.Write(@"<script language='javascript'>alert('This Lecturer ID already Exists !!')</script>");
        }
        else if (n == 1)
        {
            Response.Write(@"<script language='javascript'>alert('Successfull Added the Lecturer Info to Table!!')</script>");
        }
        else if (n == -1)
        {
            Response.Write(@"<script language='javascript'>alert('Error in Adding the Lecturer Info!! Please Check the Format of the entered fields')</script>");
        }
        else if (n == 2)
        {
            Response.Write(@"<script language='javascript'>alert('Error in Adding the Lecturer Info!! Lecturer not yet Signed Up!!')</script>");
        }
    }
}