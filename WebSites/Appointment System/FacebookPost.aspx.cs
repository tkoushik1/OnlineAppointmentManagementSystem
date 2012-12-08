using System;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using ASPSnippets.FaceBookAPI;
using System.Collections.Generic;
using System.Web.Script.Serialization;
public partial class CS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FaceBookConnect.API_Key = "217845935017184";
        FaceBookConnect.API_Secret = "62fdd5377c4ac3b2195c7d63af7615ec";

        if (!IsPostBack)
        {
            string code = Request.QueryString["code"];
            if (!string.IsNullOrEmpty(code))
            {
                ViewState["Code"] = code;
                pnlPost.Enabled = true;
                btnAuthorize.Enabled = false;
            }
        }
    }

    protected void Authorize(object sender, EventArgs e)
    {
        FaceBookConnect.Authorize("publish_actions", Request.Url.AbsoluteUri);
    }

    protected void Post(object sender, EventArgs e)
    {
        Dictionary<string, string> data = new Dictionary<string, string>();
        data.Add("link", "http://www.google.com");
        data.Add("picture", "http://s1274.beta.photobucket.com/user/ksahetya/media/facebook.png");
        data.Add("caption", "Facebook Developer");
        data.Add("name", "Facebook");
        data.Add("message", "I like Facebook");
        FaceBookConnect.Post(ViewState["Code"].ToString(), "me/feed", data);
    }
}