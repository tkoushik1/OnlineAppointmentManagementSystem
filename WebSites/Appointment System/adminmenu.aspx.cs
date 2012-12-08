using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyService;
public partial class adminmenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MyService.UserWebService uws = new UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        String[] id = uws.getNonRegisteredStudentId();
        GridView1.DataSource = id;
        GridView1.DataBind();
        
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var firstCell = e.Row.Cells[0];
            firstCell.Controls.Clear();
            firstCell.Controls.Add(new HyperLink { NavigateUrl = "createstudent.aspx/"+firstCell.Text, Text = firstCell.Text });
        
        }
    }
}