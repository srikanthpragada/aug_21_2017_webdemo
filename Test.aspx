<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("<h1>Heading</h1>");
        Response.Write(Server.HtmlEncode("<h1> For Heading1"));
        Response.Write("&lt;h1&gt; For Heading1");

        int id = Int32.Parse(Request.QueryString["id"]);

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
</head>
<body>
  <form id="form1" runat="server">
  
  </form>
</body>
</html>
