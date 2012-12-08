using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using Prabhu;
public partial class Pop3Client : System.Web.UI.Page
{
    public const string Host = "pop.gmail.com";
    public const int Port = 995;
    public string Email ;
    public string Password ;
    public const int NoOfEmailsPerPage = 5;
    public const string SelfLink ="<a href=\"Pop3Client.aspx?page={0}\">{1}</a>";
    public const string DisplayEmailLink ="<a href=\"DisplayPop3Email.aspx?emailId={0}\">{1}</a>";
    protected void Page_Load(object sender, EventArgs e)
    {
       
        int page = 1;
        if (Request.QueryString["page"] == null)
        {
            Response.Redirect("Pop3Client.aspx?page=1");
            Response.Flush();
            Response.End();
        }
        else
            page = Convert.ToInt32(Request.QueryString["page"]);
        try
        {
            Email = Session["email"].ToString();
            Password = Session["pwd"].ToString();
        }
        catch (Exception ex) { Response.Redirect("Home.aspx"); }
        int totalEmails;
        List<Email> emails;
        string emailAddress;
        using (Prabhu.Pop3Client client = new Prabhu.Pop3Client(Host, Port, Email, Password, true))
        {
            emailAddress = client.Email;
            client.Connect();
            totalEmails = client.GetEmailCount();
            emails = client.FetchEmailList(((page - 1) * NoOfEmailsPerPage) + 1, NoOfEmailsPerPage);
        }
        int totalPages;
        int mod = totalEmails % NoOfEmailsPerPage;
        if (mod == 0)
            totalPages = totalEmails / NoOfEmailsPerPage;
        else
           totalPages = ((totalEmails - mod) / NoOfEmailsPerPage) + 1;
        for (int i = 0; i < emails.Count; i++)
        {
            Email email = emails[i];
            int emailId = ((page - 1) * NoOfEmailsPerPage) + i + 1;
            TableCell noCell = new TableCell();
            noCell.CssClass = "emails-table-cell";
            noCell.Text = Convert.ToString(emailId);
            TableCell fromCell = new TableCell();
            fromCell.CssClass = "emails-table-cell";
            fromCell.Text = email.From;
            TableCell subjectCell = new TableCell();
            subjectCell.CssClass = "emails-table-cell";
            subjectCell.Style["width"] = "300px";
            subjectCell.Text = String.Format(DisplayEmailLink, emailId, email.Subject);
            TableCell dateCell = new TableCell();
            dateCell.CssClass = "emails-table-cell";
            if (email.UtcDateTime != DateTime.MinValue)
               dateCell.Text = email.UtcDateTime.ToString();
            TableRow emailRow = new TableRow();
            emailRow.Cells.Add(noCell);
            emailRow.Cells.Add(fromCell);
            emailRow.Cells.Add(subjectCell);
            emailRow.Cells.Add(dateCell);
            EmailsTable.Rows.AddAt(2 + i, emailRow);
        }
        if (totalPages > 1)
        {
            if (page > 1)
                PreviousPageLiteral.Text = String.Format(SelfLink, page - 1, "Previous Page");
            if (page > 0 && page < totalPages)
                NextPageLiteral.Text = String.Format(SelfLink, page + 1, "Next Page");
        }
        EmailFromLiteral.Text = Convert.ToString(((page - 1) * NoOfEmailsPerPage) + 1);
        EmailToLiteral.Text = Convert.ToString(page * NoOfEmailsPerPage);
        EmailTotalLiteral.Text = Convert.ToString(totalEmails);
        EmailLiteral.Text = emailAddress;
    }
}
