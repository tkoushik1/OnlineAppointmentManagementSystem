using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyService;
public partial class studentmenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id = null;
        String uname = null;
        String[] str = (String[])Session["user"];
        id = (String)str.GetValue(0);
        uname = (String)str.GetValue(1);
        Label3.Text = id;
        MyService.UserWebService uws = new UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        String name = uws.getStudentNameById(Int32.Parse(id));
        Label1.Text = name;
        Label2.Text = DateTime.Now.ToString();
    }
}