using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class professorappointmentreport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String[] str = (String[])Session["user"];
        String ID = (String)str.GetValue(0);
        Label3.Text = ID;
    }
}