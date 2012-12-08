using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyService;
public partial class lecturerchangepassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String ID = null;
        String[] str = (String[])Session["user"];
        ID = (String)str.GetValue(0);
        int id = Int32.Parse(ID);
        MyService.UserWebService uws = new UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        String oldpassword = txtLOldPwd.Text;
        String newpassword = txtLNewPwd.Text;
        int n = uws.lecturerChangePassword(id, oldpassword, newpassword);
        if (n == 1)
        {
            Response.Write(@"<script language='javascript'>alert('Password Successfully Changed !!')</script>");
        }
        else if (n == 0)
        {
            Response.Write(@"<script language='javascript'>alert('Please Check Your Old Password Again !!')</script>");
        }

      
    }
}