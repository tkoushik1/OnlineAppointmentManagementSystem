using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class calendersetup : System.Web.UI.Page
{
    public static List<DateTime> list = new List<DateTime>();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void wkDayCalendar_DayRender(object sender, DayRenderEventArgs e)
    {
        e.Day.IsSelectable = !e.Day.IsWeekend;
        if (e.Day.Date < (System.DateTime.Now.AddDays(-1)))//.AddDays(_nDaysToBlock)))
        {
            e.Cell.BackColor = System.Drawing.Color.Beige;
            e.Day.IsSelectable = false;
            e.Cell.Font.Strikeout = true;
        }
            if((e.Day.IsSelected == true)){

            list.Add(e.Day.Date);
            }
        }
    
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        MyService.UserWebService uws = new MyService.UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        foreach (DateTime t in list)
        {
         
            int n = uws.setNonWorkingDays(t.Date);
            
        }
        Response.Write(@"<script language='javascript'>alert('Holiday Dates are Set!!')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MyService.UserWebService uws = new MyService.UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        foreach (DateTime t in list)
        {
            int n = uws.deleteNonWorkingDays(t);

        }
        Response.Write(@"<script language='javascript'>alert('Selected Holiday Dates are Deleted!!')</script>");
    }
}