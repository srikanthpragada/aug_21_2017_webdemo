using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TwoFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write(DateTime.Now + "<hr/>");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<h1>Two File ASPX</h1>");
       
    }
}