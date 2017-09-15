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
      <asp:DetailsView ID="DetailsView1" runat="server" 
          AllowPaging="True" AutoGenerateRows="False" 
          DataKeyNames="prodid" 
          DataSourceID="SqlDataSource1">
          <Fields>
              <asp:BoundField DataField="prodid" HeaderText="prodid" InsertVisible="False" ReadOnly="True" SortExpression="prodid" />
              <asp:BoundField DataField="prodname" HeaderText="prodname" SortExpression="prodname" />
              <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
              <asp:BoundField DataField="qoh" HeaderText="qoh" SortExpression="qoh" />
              <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks" />
              <asp:BoundField DataField="catcode" HeaderText="catcode" SortExpression="catcode" />
              <asp:CommandField ShowEditButton="True" />
          </Fields>
      </asp:DetailsView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server"
           ConnectionString="<%$ ConnectionStrings:msdbConnectionString %>"
           DeleteCommand="DELETE FROM [products] WHERE [prodid] = @original_prodid AND [prodname] = @original_prodname AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([qoh] = @original_qoh) OR ([qoh] IS NULL AND @original_qoh IS NULL)) AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL)) AND (([catcode] = @original_catcode) OR ([catcode] IS NULL AND @original_catcode IS NULL))" 
           InsertCommand="INSERT INTO [products] ([prodname], [price], [qoh], [remarks], [catcode]) VALUES (@prodname, @price, @qoh, @remarks, @catcode)" SelectCommand="SELECT * FROM [products]" 
           UpdateCommand="UPDATE [products] SET [prodname] = @prodname, [price] = @price, [qoh] = @qoh, [remarks] = @remarks, [catcode] = @catcode WHERE [prodid] = @original_prodid AND [prodname] = @original_prodname AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([qoh] = @original_qoh) OR ([qoh] IS NULL AND @original_qoh IS NULL)) AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL)) AND (([catcode] = @original_catcode) OR ([catcode] IS NULL AND @original_catcode IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
          <DeleteParameters>
              <asp:Parameter Name="original_prodid" Type="Int32" />
              <asp:Parameter Name="original_prodname" Type="String" />
              <asp:Parameter Name="original_price" Type="Decimal" />
              <asp:Parameter Name="original_qoh" Type="Int32" />
              <asp:Parameter Name="original_remarks" Type="String" />
              <asp:Parameter Name="original_catcode" Type="String" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="prodname" Type="String" />
              <asp:Parameter Name="price" Type="Decimal" />
              <asp:Parameter Name="qoh" Type="Int32" />
              <asp:Parameter Name="remarks" Type="String" />
              <asp:Parameter Name="catcode" Type="String" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="prodname" Type="String" />
              <asp:Parameter Name="price" Type="Decimal" />
              <asp:Parameter Name="qoh" Type="Int32" />
              <asp:Parameter Name="remarks" Type="String" />
              <asp:Parameter Name="catcode" Type="String" />
              <asp:Parameter Name="original_prodid" Type="Int32" />
              <asp:Parameter Name="original_prodname" Type="String" />
              <asp:Parameter Name="original_price" Type="Decimal" />
              <asp:Parameter Name="original_qoh" Type="Int32" />
              <asp:Parameter Name="original_remarks" Type="String" />
              <asp:Parameter Name="original_catcode" Type="String" />
          </UpdateParameters>
      </asp:SqlDataSource>
  </form>
</body>
</html>
