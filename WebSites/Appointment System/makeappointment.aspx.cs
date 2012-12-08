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
public partial class makeappointment : System.Web.UI.Page
{
    string date = null;
    
    int sid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        List<DateTime> list = new List<DateTime>();
        String[] str = (String[])Session["user"];
        ID = (String)str.GetValue(0);
        sid = Int32.Parse(ID);
    }
    protected void dropList_Select(object sender, EventArgs e)
    {
        
        
        GridView1.Visible = true;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string str = GridView1.SelectedRow.Cells[1].Text;
        //TextBox1.Text = str.ToString();

        foreach (GridViewRow row in GridView1.Rows)
        {
            if (((CheckBox)row.FindControl("CheckBox1")).Checked)
            {

                int EmployeeID = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                
                date = GridView1.Rows[row.RowIndex].Cells[4].Text;
                Label1.Text = date;
                List<DateTime> dt = new List<DateTime>();
                int n = Int32.Parse(GridView1.Rows[row.RowIndex].Cells[6].Text);
                int vol = Int32.Parse(GridView1.Rows[row.RowIndex].Cells[7].Text);
               
                Double minintervals = 0;
                if (n <= 9)
                {
                    minintervals = Math.Ceiling(((double)n * 60) / ((double)vol));
                }
                else if (n > 12)
                {
                    minintervals = Math.Ceiling(((double)n) / ((double)vol));
                }
                String time = GridView1.Rows[row.RowIndex].Cells[5].Text;
                String datetime = date + " " + time;
                DateTime dtcomb = DateTime.Parse(datetime);
                
               
                for (int i = 0; i < vol; i++)
                {
                    dt.Add(dtcomb);

                    dtcomb = dtcomb.AddMinutes(minintervals);
                }
                DropDownList2.DataSource = dt;
                DropDownList2.DataBind();
            }
        }
    }
    //protected void gridView_Load(object sender, EventArgs e)
    //{
    //    for (int i = 0; i < GridView1.Rows.Count; i++)
    //    {
    //        if ((DateTime.Parse(GridView1.Rows[i].Cells[2].Text)) < (DateTime.Parse(DateTime.Today.ToShortDateString())))
    //        {
    //            GridView1.Rows[i].Visible = false;
    //            //GridView1.da
    //        }
    //    }
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        MyService.UserWebService uws = new UserWebService();
        uws.Credentials = System.Net.CredentialCache.DefaultCredentials;
        int id = uws.getAppointmentID(Int32.Parse(DropDownList1.SelectedValue), DateTime.Parse(Label1.Text));
        int status = 1;
        uws.makeStudentAppointment(id, sid, txtSubject.Text, DateTime.Parse(DropDownList2.SelectedValue), DateTime.Parse(txtEndtime.Text), status);
    //   SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
    //smtp.UseDefaultCredentials = false;
    //smtp.Credentials = new NetworkCredential("tkoushik1@gmail.com","were690vase804");
    //smtp.EnableSsl = true;
    //smtp.Send("tkoushik1@gmail.com", "tkoushik1@yahoo.com", "Appointment", "Appointment Successfull");
 
    
            
    MailAddress mailfrom = new MailAddress("tkoushik1@gmail.com");
    MailAddress mailto = new MailAddress("tkoushik1@yahoo.com");
    MailMessage newmsg = new MailMessage(mailfrom, mailto);
 
    newmsg.Subject = "APPOINTMENT";
    newmsg.Body = "Appointment Successful";
 
   

//    Attachment att = new Attachment("C:\\...file path");
  //  newmsg.Attachments.Add(att);
 
    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
    smtp.UseDefaultCredentials = false;
    smtp.Credentials = new NetworkCredential("tkoushik1@gmail.com","were690vase804");
    smtp.EnableSsl = true;
    smtp.Send(newmsg);
    Response.Write(@"<script language='javascript'>alert('Appointment Made and Confirmation has been sent to your mail')</script>");
}
    
    //public string SendMail(string toList, string from, string ccList, string subject, string body)
    //{
    //    MailMessage message = new MailMessage();
    //    SmtpClient smtpClient = new SmtpClient();
    //    string msg = string.Empty;
    //    try
    //    {
    //        MailAddress fromAddress = new MailAddress(from);
    //        message.From = fromAddress;
    //        message.To.Add(toList);
    //        if (ccList != null && ccList != string.Empty)
    //            message.CC.Add(ccList);
    //        message.Subject = subject;
    //        message.IsBodyHtml = true;
    //        message.Body = body;
    //        smtpClient.Host = "mail.google.com";
    //        smtpClient.Port = 25;
    //        smtpClient.UseDefaultCredentials = true;
    //        smtpClient.Credentials = new System.Net.NetworkCredential("tkoushik1@gmail.com", "were690vase804");

    //        smtpClient.Send(message);
    //        msg = "Successful made appointment and confirmation sent to mail";
    //    }
    //    catch (Exception ex)
    //    {
    //        msg = ex.Message;
    //    }
    //    return msg;
    //}

    protected void onRowCreated(object sender, GridViewRowEventArgs e)
    {
        //e.Row.Attributes.Add("onMouseOver", "this.style.background='#eeff00'");
        //e.Row.Attributes.Add("onMouseOut", "this.style.background='#ffffff'");     
    }
    protected void startTime_DropDown(object sender, EventArgs e)
    {
        int selectedIndex = DropDownList2.SelectedIndex;
        int tIndex = selectedIndex+1;
        txtEndtime.Text = DropDownList2.Items[tIndex].Value;
    }
}