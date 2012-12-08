using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lecturermenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String[] str = (String[])Session["user"];
        String ID = (String)str.GetValue(0);
        String Name = (String)str.GetValue(1);
        Label1.Text = Name;
        Label2.Text = ID;
    }

    protected void gridView_RowEdit(object sender, GridViewEditEventArgs e)
    {
        GridView1.Columns[1].Visible = true;
        GridView1.Columns[4].Visible = true;
        GridView1.Columns[5].Visible = false;
        GridView1.Columns[7].Visible = true;
        GridView1.Columns[8].Visible = false;
        GridView1.Columns[9].Visible = false;
        GridView1.Columns[10].Visible = true;
        GridView1.Columns[11].Visible = false;
    }
    protected void gridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GridView1.Columns[1].Visible = true;
        GridView1.Columns[4].Visible = true;
        GridView1.Columns[5].Visible = true;
        GridView1.Columns[6].Visible = true;
        GridView1.Columns[8].Visible = true;
        GridView1.Columns[9].Visible = true;
        GridView1.Columns[10].Visible = false;
        GridView1.Columns[11].Visible = true;
        GridView1.Columns[7].Visible = true;
    }
}