<%@ Page Language="C#" Trace="false" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnDetails_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection
             (@"data source=(localdb)\mssqllocaldb;Initial Catalog=msdb;Integrated Security=True"))
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand
                    ("select prodname, catdesc, price from products p inner join categories c on (p.catcode = c.catcode) where prodid = @prodid",con);
                cmd.Parameters.AddWithValue("@prodid", txtProdId.Text);
                SqlDataReader dr =  cmd.ExecuteReader();

                if (dr.Read())
                {

                    String details = String.Format("<h2>{0}</h2><h3>{1}</h3><h3>{2:C}</h3>",
                                dr["prodname"].ToString(),
                                dr["catdesc"].ToString(),
                                dr["price"].ToString());

                    dr.Close();

                    SqlCommand cmd2 = new SqlCommand ("select isnull(sum(qty),0),  isnull(sum(amount),0)  from sales where prodid = @prodid",con);
                    cmd2.Parameters.AddWithValue("@prodid", txtProdId.Text);
                    SqlDataReader dr2 =  cmd2.ExecuteReader();
                    dr2.Read(); 

                    String summary = String.Format("<h3>Total Qty : {0}</h3><h3>Total Sales : {1}</h3>", dr2[0].ToString(),
                           dr2[1].ToString());

                    lblInfo.Text = details + summary;

                }
                else
                {
                    lblInfo.Text = "Sorry! Product Not Found!";
                }
            }
            catch(Exception ex)
            {
                Trace.Write("Error : " + ex.Message);
                lblInfo.Text = "Sorry! An Error Occurred!";
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
        Product Id :
        <asp:TextBox ID="txtProdId" runat="server"></asp:TextBox>
        <asp:Button ID="btnDetails" runat="server" Text="Get Details" OnClick="btnDetails_Click" />
        <p></p>
        <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>

    </form>
</body>
</html>
