using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class studentappointmentreport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String[] str = (String[])Session["user"];
        String ID = (String)str.GetValue(0);
        String Name = (String)str.GetValue(1);
        Label1.Text = ID;
        Label2.Text = Name;
    }
}