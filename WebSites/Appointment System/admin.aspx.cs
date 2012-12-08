using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyService;
public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MyService.UserWebService uws = new UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        String name = txtAdminUserName.Text;
        String password = txtAdminPwd.Text;
        String[] adminInfo = uws.adminLoginCheck(name, password);
        if(adminInfo.Contains("success"))
        {
            Session["admin"] = adminInfo;
            Response.Redirect("adminmenu.aspx");
        }
        else if (adminInfo.Contains("fail"))
        {
            Response.Write(@"<script language='javascript'>alert('Please Check Your UserName Or password Again !!')</script>");
             
        }
    }
}