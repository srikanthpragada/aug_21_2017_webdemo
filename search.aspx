<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        hlSearch.Visible = false;
        if (Page.IsPostBack)
        {
            if (ddlSearch.SelectedIndex > 0)
            {
                hlSearch.NavigateUrl = ddlSearch.SelectedItem.Value;
                hlSearch.Text = ddlSearch.SelectedItem.Text;
                hlSearch.Visible = true; 
            }
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
</head>
<body>
  <form id="form1" runat="server">
  Select Search Engine 
      <asp:DropDownList ID="ddlSearch" AutoPostBack="true" runat="server">
          <asp:ListItem Value="">Select Option</asp:ListItem>
          <asp:ListItem Value="http://google.com">google.com</asp:ListItem>
          <asp:ListItem Value="http://bing.com">Microsoft Bing</asp:ListItem>
          <asp:ListItem Value="http://yahoo.com">Yahoo Search</asp:ListItem>
      </asp:DropDownList>
      <p></p>
      <asp:HyperLink ID="hlSearch" runat="server">Search</asp:HyperLink>
  </form>
</body>
</html>
