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
   Email Address <br />
   <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="rfv1" runat="server"
       ControlToValidate="txtEmail" Display ="Dynamic"
       ErrorMessage="Email is required"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="rev1" 
          runat="server"
          ControlToValidate="txtEmail"
          ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
          ErrorMessage="Invalid Email Address"></asp:RegularExpressionValidator>
   <p></p>
   Password <br />
   <asp:TextBox ID="txtPwd"  TextMode="Password" runat="server"></asp:TextBox>
   <asp:RequiredFieldValidator ID="rfv2" runat="server"
       ControlToValidate="txtPwd"
       ErrorMessage="Password is required"></asp:RequiredFieldValidator>
   <p></p>
   <asp:Button ID="btnLogin" runat="server" Text="Login" />
  </form>
</body>
</html>
