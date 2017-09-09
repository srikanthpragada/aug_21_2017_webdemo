<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        // find city of client by using city cookie
        if (Request.Cookies["city"] != null)
            lblMovies.Text = "Movies in " + Request.Cookies["city"].Value;
        else
            Response.Redirect("selectcity.aspx");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
</head>
<body>
  <form id="form1" runat="server">
      <asp:Label ID="lblMovies" runat="server" Text=""></asp:Label>
  </form>
</body>
</html>
