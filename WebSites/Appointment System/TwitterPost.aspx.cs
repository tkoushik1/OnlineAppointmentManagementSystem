using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.TwitterAPI;

public partial class CS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TwitterConnect.API_Key = "<Your Twitter API Key>";
        TwitterConnect.API_Secret = "<Your Twitter API Secret>";
        if (!IsPostBack)
        {
            if (TwitterConnect.IsAuthorized)
            {
                btnAuthorize.Enabled = false;
                pnlTweet.Enabled = true;
            }
            if (TwitterConnect.IsDenied)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "alert('User has denied access.')", true);
            }
        }
    }
    protected void btnAuthorize_Click(object sender, EventArgs e)
    {
        if (!TwitterConnect.IsAuthorized)
        {
            TwitterConnect twitter = new TwitterConnect();
            twitter.Authorize(Request.Url.AbsoluteUri.Split('?')[0]);
        }
    }
    protected void btnTweet_Click(object sender, EventArgs e)
    {
        TwitterConnect twitter = new TwitterConnect();
        twitter.Tweet(txtTweet.Text);
    }
}