<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        HttpCookie c = new HttpCookie("city", txtCity.Text);
        c.Expires = DateTime.Today.AddDays(7);
        Response.Cookies.Add(c);
        Response.Redirect("movies.aspx");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
</head>
<body>
  <form id="form1" runat="server">
  City : <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
  <p></p>
  <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
  </form>
</body>
</html>
