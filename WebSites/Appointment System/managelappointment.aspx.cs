using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyService;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Net;


public partial class managelappointment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String[] str = (String[])Session["user"];
        String ID = (String)str.GetValue(0);

        Label1.Text = ID;
     
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void gridView_RowEdit(object sender, GridViewEditEventArgs e)
    {
        
        GridView1.Columns[1].Visible = true;
        GridView1.Columns[2].Visible = false;
        GridView1.Columns[3].Visible = false;
        GridView1.Columns[4].Visible = false;
        GridView1.Columns[5].Visible = false;
        GridView1.Columns[6].Visible = false;
        GridView1.Columns[7].Visible = true;
        GridView1.Columns[8].Visible = false;
        GridView1.Columns[9].Visible = true;
    }
    protected void dridView_RoeUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GridView1.Columns[1].Visible = true;
        GridView1.Columns[2].Visible = true;
        GridView1.Columns[3].Visible = true;
        GridView1.Columns[4].Visible = true;
        GridView1.Columns[5].Visible = true;
        GridView1.Columns[6].Visible = true;
       
        GridView1.Columns[9].Visible = false;

        //MailAddress mailfrom = new MailAddress("tkoushik1@gmail.com");
        //MailAddress mailto = new MailAddress("tkoushik1@yahoo.com");
        //MailMessage newmsg = new MailMessage(mailfrom, mailto);

        //newmsg.Subject = "APPOINTMENT";
        //newmsg.Body = "Appointment On date :" + GridView1.Rows[ + " is " + GridView1.SelectedRow.Cells[6].Text;



        ////    Attachment att = new Attachment("C:\\...file path");
        ////  newmsg.Attachments.Add(att);

        //SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        //smtp.UseDefaultCredentials = false;
        //smtp.Credentials = new NetworkCredential("tkoushik1@gmail.com", "were690vase804");
        //smtp.EnableSsl = true;
        //smtp.Send(newmsg);
        //Response.Write(@"<script language='javascript'>alert('Appointment Status sent to Student's Mail')</script>");
    }
}