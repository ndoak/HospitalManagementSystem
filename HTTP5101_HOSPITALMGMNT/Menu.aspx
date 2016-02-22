<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="HTTP5101_HOSPITALMGMNT.Menu" %>

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
       <h2> Main Menu:</h2><br />
        <br />
       <h4> Thank you for logging in.</h4><br />
        <br />
       <h4> Please choose from on of the following options.</h4><br />
        <br />
        <asp:Button ID="btnAddDoc" runat="server" OnClick="btnAddDoc_Click" Text="Add A Doctor Profile" PostBackUrl="DoctorPage.aspx" />
        <br />
        <br />
        <asp:Button ID="btnAddPatient" runat="server" OnClick="btnAddPatient_Click" PostBackUrl="Patient.aspx" style="height: 26px" Text="Add A Patient Profile" />
        <br />
        <br />
        <asp:Button ID="btnDischarge" runat="server" OnClick="btnDischarge_Click" Text="Discharge A Patient" PostBackUrl="~/Discharge.aspx" />
        <br />
        <br />
        <asp:Button ID="btnAssignP" runat="server" PostBackUrl="Assign.aspx" Text="Assign a Doctor to Patient" OnClick="btnAssignP_Click" />
    </div>
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
