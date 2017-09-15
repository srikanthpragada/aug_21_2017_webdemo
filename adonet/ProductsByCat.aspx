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
  Select Category : <asp:DropDownList ID="ddlCategories" runat="server"
      DataSourceID="sdsCategories" DataTextField="catdesc" DataValueField="catcode" AutoPostBack="True"></asp:DropDownList>
  <p></p>


  <asp:GridView ID="gvProducts" runat="server" Width="100%"
       AutoGenerateColumns="False" 
       EmptyDataText="Sorry! No products found!"
       DataKeyNames="prodid" DataSourceID="sdsProducts">
      <Columns>
          <asp:BoundField DataField="prodid" HeaderText="prodid" InsertVisible="False" ReadOnly="True" SortExpression="prodid" />
          <asp:BoundField DataField="prodname" HeaderText="prodname" SortExpression="prodname" />
          <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
          <asp:BoundField DataField="qoh" HeaderText="qoh" SortExpression="qoh" />
          <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks" />
          <asp:BoundField DataField="catcode" HeaderText="catcode" SortExpression="catcode" />
          <asp:HyperLinkField 
              DataNavigateUrlFields="prodid,prodname" 
              DataNavigateUrlFormatString="SalesByProd.aspx?id={0}&name={1}" 
              Text="Sales" />
      </Columns>
      </asp:GridView>


      <asp:SqlDataSource ID="sdsProducts" runat="server"
          ConnectionString="<%$ ConnectionStrings:msdbConnectionString %>" 
          SelectCommand="SELECT * FROM [products] WHERE ([catcode] = @catcode)">
          <SelectParameters>
              <asp:ControlParameter ControlID="ddlCategories" Name="catcode" 
                   PropertyName="SelectedValue" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>


  <asp:SqlDataSource ID="sdsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:msdbConnectionString %>" SelectCommand="SELECT * FROM [categories]"></asp:SqlDataSource>
 
  </form>
</body>
</html>
