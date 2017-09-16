<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" %>
<script runat="server">

    public void CalculatePrice()
    {
        double amount = Double.Parse(txtAmount.Text);
        double rate = Double.Parse(txtRate.Text);

        double interest = amount * rate / 100;

        if (chkRound.Checked)
            interest = Math.Round(interest);

        lblResult.Text = interest.ToString("c");
    }
    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        CalculatePrice();
    }

    protected void chkRound_CheckedChanged(object sender, EventArgs e)
    {
        CalculatePrice();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="cpBody" Runat="Server">
     <h1>Interest Calculation</h1>

      Amount <br/>
      <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
      <p></p>
      Interest Rate <br />
      <asp:TextBox ID="txtRate" runat="server"></asp:TextBox> 
      <p></p>
      <asp:CheckBox ID="chkRound" runat="server" 
          AutoPostBack="true"
          OnCheckedChanged="chkRound_CheckedChanged" /> Round Interest Amount
      <p></p>
      <asp:Button ID="btnCalculate" runat="server"
           CssClass="actionbutton"
           Text="Calculate"
           OnClick ="btnCalculate_Click" />
      <p></p>

      <asp:Label CssClass="result" ID="lblResult" runat="server" Text=""></asp:Label>
  
</asp:Content>
