using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class updatesinfo_ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id = null;
        String uname = null;
        String[] str = (String[])Session["user"];
        id = (String)str.GetValue(0);
        uname = (String)str.GetValue(1);
        Label1.Text = id;
        Label2.Text = uname;
      
    }
}