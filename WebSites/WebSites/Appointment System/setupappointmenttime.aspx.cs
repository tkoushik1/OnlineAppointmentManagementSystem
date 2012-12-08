
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyService;
public partial class setupappointment : System.Web.UI.Page
{
    String ID = null;
    int id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        String[] str = (String[])Session["user"];
        ID = (String)str.GetValue(0);
        int id = Int32.Parse(ID);
        List<String> time = new List<String>();
        DateTime t = DateTime.Today;
        for (int i = 0; i < 48; i++)
        {
            String st = t.ToShortTimeString();
            time.Add(st);
            DropDownList1.Items.Add(st);
         t = t.AddMinutes(30);
        }

      // DropDownList1.DataSource = time;
       //DropDownList1.DataBind();
        //Label1.Text = t.ToShortTimeString();
       if (!Page.IsPostBack)
       {
           MyService.UserWebService uws = new UserWebService();
           uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
           String[] dname = uws.getDepartment(id);
           foreach (String name in dname)
           {
               DropDownList3.Items.Add(new ListItem(name, name));
           }
       }
      
    }

    protected void MyCalendar_DayRender(object sender, DayRenderEventArgs e)

    {

        MyService.UserWebService uws = new MyService.UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        e.Day.IsSelectable = !e.Day.IsWeekend;
        if (e.Day.Date < (System.DateTime.Now.AddDays(-1)))//.AddDays(_nDaysToBlock)))
        {
            e.Cell.BackColor = System.Drawing.Color.Beige;
            e.Day.IsSelectable = false;
            e.Cell.Font.Strikeout = true;
        }
        DateTime[] dt = uws.getNonNonWorkingDays();
        foreach (DateTime d in dt)
        {
            if(d!=null){
           if(d.Equals(e.Day.Date)){
               e.Cell.BackColor = System.Drawing.Color.PaleVioletRed;
                        e.Day.IsSelectable = false;
           }
            }
        }

}
    protected void  MyCalendar_SelectionChanged(object sender, EventArgs e)
{
    txtCalendar.Text = ((Calendar)sender).SelectedDate.ToShortDateString();
}
    protected void Button1_Click(object sender, EventArgs e)
    {
        String[] str = (String[])Session["user"];
        ID = (String)str.GetValue(0);
        int id = Int32.Parse(ID);
        String restriction=null;
        if (CheckBox1.Checked)
        {
            restriction = CheckBox1.Text;
        }
        else
        {
            restriction = DropDownList3.SelectedValue;
        }
        MyService.UserWebService uws = new MyService.UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        DateTime astime = DateTime.Parse(DropDownList1.SelectedValue + txtCalendar.Text);
        DateTime adate = DateTime.Parse(txtCalendar.Text);
        int sid = 1;
        int n = uws.setappointmenttime(id, adate, astime, Int32.Parse(DropDownList2.SelectedValue),Int32.Parse(txtAppvolume.Text), restriction,sid);
        if (n == 1)
        {
            Response.Write(@"<script language='javascript'>alert('The Appointment time is successfully created !!')</script>");
        }
    }
}
