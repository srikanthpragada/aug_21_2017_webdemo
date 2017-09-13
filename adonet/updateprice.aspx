<%@ Page Language="C#" %>
<<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection
             (@"data source=(localdb)\mssqllocaldb;Initial Catalog=msdb;Integrated Security=True"))
        {
            con.Open();
            Response.Write("<h2>Connected</h2>");
        }

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Price</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Update Price</h1>
        Product Id
        <br />
        <asp:TextBox ID="txtProdId" runat="server"></asp:TextBox>
        <p></p>
        New Price
        <br />
        <asp:TextBox ID="txtNewPrice" runat="server"></asp:TextBox>
        <p></p>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        <p></p>
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
