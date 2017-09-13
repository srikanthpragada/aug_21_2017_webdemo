<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    void DisplayNames()
    {
        List<string> list = Session["names"] as List<String>;
        if (list != null)
        {
            string output = "<ul>";
            foreach (string n in list)
            {
                output += "<li>" + n + "</li>";
            }
            output += "</ul>";
            lblNames.Text = output;
        }
        else
            lblNames.Text = "No Names Found!";
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        List<string> list = Session["names"] as List<string>;
        if (list == null)
        {
            list = new List<String>();
            Session.Add("names", list);
            Trace.Write("Added Names!");
        }
        list.Add(txtName.Text);

        // display list of names 
        DisplayNames();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (! Page.IsPostBack)
            DisplayNames();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
</head>
<body>
  <form id="form1" runat="server">
  Name : <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
      <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
  <p></p>
  <asp:Label ID="lblNames" runat="server" Text=""></asp:Label>
  </form>
</body>
</html>
