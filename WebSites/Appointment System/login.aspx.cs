using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyService;
public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String[] list = null;
        MyService.UserWebService uws = new MyService.UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        if (DropDownList1.SelectedItem.Value == "Student")
        {
            list = uws.StudentLoginCheck(txtLoginUName.Text, txtLoginPwd.Text);
            Session["user"] = list;
            if (list.Contains(txtLoginUName.Text))
            {
                Response.Redirect("studentmenu.aspx");
            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Check Username or Password Again!!')</script>");
            }

        }
        else if (DropDownList1.SelectedItem.Value == "Lecturer")
        {
            list = uws.LecturerLoginCheck(txtLoginUName.Text, txtLoginPwd.Text);
            Session["user"] = list;
            if (list.Contains(txtLoginUName.Text))
            {
                Response.Redirect("lecturermenu.aspx");
            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Lecturer Login Failed! Check Username or Password Again!!')</script>");
            }
        }
        else if (DropDownList1.SelectedItem.Value == "Admin")
        {
            Response.Redirect("admin.aspx");
        }
        else
        {
            Response.Write("Check The Username and Password");
        }

    }
}