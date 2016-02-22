<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Discharge.aspx.cs" Inherits="HTTP5101_HOSPITALMGMNT.Discharge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
    <header id="header">
		<div class="header-wrapper clearfix">
			<div class="logo">
				Temiskaming Hospital
			</div>
		</div>	
		</header>

    <form id="form1" runat="server">
    <div class="form-width">
    
        <h2>Discharge a patient</h2>
        <br />
        <h4>Ohip Number:</h4>&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtOhip1" runat="server" MaxLength="4" Width="100%" class="aspForm" ></asp:TextBox>
        <asp:TextBox ID="txtOhip2" runat="server" MaxLength="3" Width="100px"></asp:TextBox>
        &nbsp;<asp:TextBox ID="txtOhip3" runat="server" MaxLength="3" Width="100px"></asp:TextBox>
        &nbsp;<asp:TextBox ID="txtOhip4" runat="server" MaxLength="2" Width="100px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Find Patient" />
        <asp:Label ID="lblOhipMessage" runat="server"></asp:Label>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtOhip4" ErrorMessage="You need to enter the last two letters." ForeColor="Red" ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
        <br />
        <h4>First name:</h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtFirstName" class="aspForm" runat="server" BackColor="#EEEEEE"  ReadOnly="True"></asp:TextBox>
        <br />
        <h4>Last name:</h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtLastName" class="aspForm" runat="server" BackColor="#EEEEEE" ReadOnly="True"></asp:TextBox>
        <br />
        <h4>Assign date:</h4>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtAssign" class="aspForm" runat="server" BackColor="#EEEEEE" ReadOnly="True"></asp:TextBox>
        <br />
        <h4>Discharge date:</h4>&nbsp;
        <asp:TextBox ID="txtDischarge" class="aspForm" runat="server" AutoPostBack="True"></asp:TextBox>
        <asp:LinkButton ID="lbDischarge" runat="server" CausesValidation="False" OnClick="LinkButton1_Click">
            <asp:Image ID="Image1" runat="server" ImageUrl="calendar.png" style="border-width: 0px;" />
        </asp:LinkButton>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredDischargeDate" runat="server" ControlToValidate="txtDischarge" ErrorMessage="Please set a date." ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False"></asp:Calendar>
        &nbsp;<br />
        <h4>Diagnosis:</h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtDiagnosis" class="aspForm" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredDiagnosis" runat="server" ControlToValidate="txtDiagnosis" ErrorMessage="Please enter the diagnosis." ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <h4>Treatment:</h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtTreatment" class="aspForm" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredTreatment" runat="server" ControlToValidate="txtTreatment" ErrorMessage="Please enter the treatment." ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" />
        &nbsp;
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    
    </div>
        <asp:Button ID="btnHomePage" runat="server" OnClick="btnHomePage_Click" PostBackUrl="~/Menu.aspx" Text="Home Page" />
    </form>
     <footer id="footer">
			<div class="footer-wrapper">
			
			<section class=" footer-info">
					<h2>About Us</h2>
					<img src="images/image.png">
					<p>Temiskaming Hospital is a Catholic teaching and research hospital founded by the Sisters of St. Joseph in 1892 to care for the sick and poor of Toronto's inner city.</p>
				</section>
				
				<section class="footer-info">
					<h2>Opening Hours</h2>
					<img src="images/image.png">
					<p><b>Mon-Thu:</b> 7:00am-8:00pm<br>
						<b>Fri-Sun:</b> 7:00am-10:00pm</p>
				</section>
				
					<section class="footer-info">
					<h2>Our Location</h2>
					<img src="images/image.png">
					<p>19th Paradise Street Sitia
					<br>
128 Meserole Avenue</p>
			<img src="images/icons.png" class="footer-logo">
				</section>
				
				

			</div>
		</footer>

</body>
</html>
