<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter("select * from products where prodname like @prodname", con);
        da.SelectCommand.Parameters.AddWithValue("@prodname", "%" + txtProdName.Text + "%");
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        // check whether we have any data in Data Table

        panelDetails.Visible = false;
        lblMsg.Visible = false;

        if (ds.Tables["products"].Rows.Count > 0)
        {
            gvProducts.DataSource = ds.Tables["products"];
            gvProducts.DataBind();
            panelDetails.Visible = true;
        }
        else
            lblMsg.Visible = true;

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="txtProdName"  required="required" runat="server" placeholder="Product Name"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />

        <asp:Panel ID="panelDetails" runat="server" Visible="false">
            <h2>List Of Products</h2>
            <asp:GridView EnableViewState="false" ID="gvProducts" SkinID="redheader" runat="server" Width="100%">
            </asp:GridView>
        </asp:Panel>
        <p></p>
        <asp:Label ID="lblMsg" EnableViewState="false" CssClass="error"  Visible="false" runat="server" Text="Sorry! No products found with the given name!"></asp:Label>
    </form>
</body>
</html>
