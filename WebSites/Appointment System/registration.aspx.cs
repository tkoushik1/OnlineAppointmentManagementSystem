using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyService;
public partial class registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        imgTick.Visible = false;
        imgWrong.Visible = false;
        Button3.Visible = true;
        txtStudentID.Enabled = false;
        txtProfessorID.Enabled = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MyService.UserWebService uws = new UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        if (DropDownList1.SelectedValue == "Student")
        {
            txtStudentID.Enabled = true;
            bool b = uws.checkSUsername(txtSUsername.Text);
            if (b == true)
            {
                Button3.Visible = false;
                imgWrong.Visible = true;
                Response.Write(@"<script language='javascript'>alert('UserName Already Exists !! Please Type In Different UserName')</script>");
            }
            else if (b == false)
            {
                Button3.Visible = false;
                imgTick.Visible = true;
            }

        }
        else if((DropDownList1.SelectedValue == "Professor"))
        {
            txtProfessorID.Enabled = true;
            bool b = uws.checkPUsername(txtSUsername.Text);
            if (b == true)
            {
                Button3.Visible = false;
                imgWrong.Visible = true;
                //txtSPassword.Enabled = false;
                //txtSConfirmPassword.Enabled = false;
                Response.Write(@"<script language='javascript'>alert('UserName Already Exists !! Please Type In Different UserName')</script>");
                
                
            }
            else if (b == false)
            {
                Button3.Visible = false;
                imgTick.Visible = true;
            }
        }

    }
    protected void IndexChange(object sender, EventArgs e)
    {
         if (DropDownList1.SelectedValue == "Student")
        {
             
            txtStudentID.Enabled = true;
        }
         else if (DropDownList1.SelectedValue == "Professor")
         {
             txtProfessorID.Enabled = true;
         }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MyService.UserWebService uws = new UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        if (DropDownList1.SelectedValue == "Student")
        {
            int n = uws.studentRegistration(Int32.Parse(txtStudentID.Text), txtSUsername.Text, txtSPassword.Text);
            if (n == 1)
            {
                Response.Write(@"<script language='javascript'>alert('Student Registration Successfully Done!!')</script>");
                Response.Redirect("login.aspx");
            }
            else if (n == 0)
            {
                Response.Write(@"<script language='javascript'>alert('Student Registration Failed!!')</script>");
            }
        }
        else if (DropDownList1.SelectedValue == "Professor")
        {
            int n = uws.professorRegistration(Int32.Parse(txtProfessorID.Text), txtSUsername.Text, txtSPassword.Text);
            if (n == 1)
            {
                Response.Write(@"<script language='javascript'>alert('Professor Registration Successfully Done!!')</script>");
                Response.Redirect("login.aspx");
            }
            else if (n == 0)
            {
                Response.Write(@"<script language='javascript'>alert('Professor Registration Failed!!')</script>");
            }
        }
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("registration.aspx");
    }
}