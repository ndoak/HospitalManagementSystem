<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HTTP5101_HOSPITALMGMNT.Login" %>

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
    
        <h2>Hosptital Management System</h2><br />
       <h4>Group1</h4><br />
        <br />
        <h4>Username:</h4>
        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <h4>Password:</h4>
        
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        <br />
        <br />
        <br id="btnLogin" />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <br />
        <br />
    
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
