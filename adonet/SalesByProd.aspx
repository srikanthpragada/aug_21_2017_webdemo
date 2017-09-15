<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
</head>
<body>
  <form id="form1" runat="server">

      <h2>Sales for Product [<%= Request.QueryString["name"] %>] </h2>
      <asp:DataList ID="DataList1" runat="server"  DataSourceID="sdsSales">
          <ItemTemplate>
               Invoice No : <%# Eval("invno") %>
               <br />
               Trans Date : <%# String.Format("{0:dd-MM-yyyy}",Eval("transdate")) %>
               <br />
               Sales Amount  : <%# String.Format("{0:c}",Eval("amount")) %>
               <br />
               Quantity Sold : <%# Eval("qty") %>
               <p></p>
          </ItemTemplate>
     
      </asp:DataList>
   
      <asp:SqlDataSource ID="sdsSales" runat="server" 
          ConnectionString="<%$ ConnectionStrings:msdbConnectionString %>"
          SelectCommand="SELECT * FROM [sales] WHERE ([prodid] = @prodid)">
          <SelectParameters>
              <asp:QueryStringParameter Name="prodid" QueryStringField="id" Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>
   
  </form>
</body>
</html>
