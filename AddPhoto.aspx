<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (fuPhoto.HasFile)
        {
            string filename = "photos/" + txtName.Text + ".jpg";
            filename = Server.MapPath(filename);
            // Response.Write(filename);
            fuPhoto.SaveAs(filename);
            lblMsg.Text = "Uploaded Successfully!";
        }
        else
            lblMsg.Text = "Sorry! No file uploaded!";
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Add Photo</title>
</head>
<body>
  <form id="form1" runat="server">
  <h1>Add Photo</h1>
  Select a photo to upload to server<br />
  <asp:FileUpload ID="fuPhoto" runat="server" />
  <p></p>
  Enter Person Name <br />
  <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
      <p></p>
      <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
      <p></p>
      <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
      <p />
      <a href="ListPhotos.aspx">List Photos</a>
  </form>
</body>
</html>
