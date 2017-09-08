<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        String dirname = Server.MapPath("photos");
        DirectoryInfo dir = new DirectoryInfo(dirname);
        foreach( FileInfo  file in dir.GetFiles())
        {
            lblPhotos.Text += 
                string.Format ("<img style='width:100px;height:100px' title='{0}' src='photos/{0}'/><p></p>",file.Name);
        }

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
</head>
<body>
  <form id="form1" runat="server">
      <h1>Photos</h1>
      <asp:Label ID="lblPhotos" runat="server" Text=""></asp:Label>
  </form>
</body>
</html>
