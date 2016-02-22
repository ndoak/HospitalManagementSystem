<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patient.aspx.cs" Inherits="HTTP5101_HOSPITALMGMNT.Patient" %>

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
        <!--Everything on the Patients page was designed by Bethany Hynds -->
    
        <h2>Patient Page</h2><br />
        <br />
        <h4>Enter a Patient</h4><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h4>Enter your first name:</h4>&nbsp; <asp:TextBox ID="txtPFname" runat="server" class="aspForm"></asp:TextBox>
        <asp:RegularExpressionValidator ID="PFirstNamevalidator" runat="server" ControlToValidate="txtPFname" ErrorMessage="Enter a name using letters A-Z" ForeColor="Red" OnDataBinding="btnSubmit_Click" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="PFNameRequired" runat="server" ControlToValidate="txtPFname" ErrorMessage="Enter your first name" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h4>Enter your last name</h4> <asp:TextBox ID="txtPLname" runat="server" class="aspForm"></asp:TextBox>
        <asp:RegularExpressionValidator ID="PLastNamevalidator" runat="server" ControlToValidate="txtPLname" ErrorMessage="Enter a name using letters A-Z" ForeColor="Red" OnDataBinding="btnSubmit_Click" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="PFNameRequired0" runat="server" ControlToValidate="txtPLname" ErrorMessage="Enter your last name" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <h4>Admission date:</h4>
        <p>
        <asp:TextBox ID="txtPAdmission" class="aspForm" runat="server"></asp:TextBox>
        </p> 
        <asp:RequiredFieldValidator ID="RequiredAdmissionDate" runat="server" ControlToValidate="txtPAdmission" ErrorMessage="Enter the date of admission" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:LinkButton ID="lbPatientAdmis" runat="server" CausesValidation="False" OnClick="LinkButton1_Click">
            <asp:Image ID="Image1" runat="server" ImageUrl="calendar.png" style="border-width: 0px;" />
        </asp:LinkButton>
        <br />
        <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False"></asp:Calendar>
        &nbsp;<h4>Type of injury or illness:</h4>&nbsp;&nbsp;
        <asp:TextBox ID="txtPIllness" runat="server" class="aspForm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredPIllness" runat="server" ControlToValidate="txtPIllness" ErrorMessage="Enter the reason for admission to hospital" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h4>Phone:</h4> <asp:TextBox ID="txtPPhone" runat="server" class="aspForm"></asp:TextBox>
        <asp:RegularExpressionValidator ID="PPhonevalidation" runat="server" ControlToValidate="txtPPhone" ErrorMessage="Enter your phone number ex. (###)###-####" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="PPhoneRequired" runat="server" ControlToValidate="txtPPhone" ErrorMessage="Enter your phone number" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h4>Street address:</h4>
        <asp:TextBox ID="txtPStreet" runat="server" class="aspForm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredPStreet" runat="server" ControlToValidate="txtPStreet" ErrorMessage="Enter your street number and name" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h4>City:</h4>
        <asp:TextBox ID="txtPCity" runat="server" class="aspForm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredPCity" runat="server" ControlToValidate="txtPCity" ErrorMessage="Enter your City" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h4>Province:</h4>
        <asp:TextBox ID="txtPStateProv" runat="server" class="aspForm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredPProvince" runat="server" ControlToValidate="txtPStateProv" ErrorMessage="Enter your province" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h4>Postal code:</h4><asp:TextBox ID="txtPPostal" runat="server" class="aspForm"></asp:TextBox>
        <asp:RegularExpressionValidator ID="PPostalvalidator" runat="server" ControlToValidate="txtPPostal" ErrorMessage="Enter a Canadian Postal code " ForeColor="Red" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="PPostalRequired" runat="server" ControlToValidate="txtPPostal" ErrorMessage="Enter a postal code" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <h4> Birthdate (MM/DD/YYYY):</h4>
        <asp:TextBox ID="txtPBirthdate" class="aspForm" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredPBirthdate" runat="server" ControlToValidate="txtPBirthdate" ErrorMessage="Enter your Birthdate" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="PBirthdateValiator" runat="server" ErrorMessage="Enter a date MM/DD/YYYY" ForeColor="Red" ValidationExpression="^([0]?[1-9]|[1|2][0-9]|[3][0|1])[./-]([0]?[1-9]|[1][0-2])[./-]([0-9]{4}|[0-9]{2})$" ControlToValidate="txtPBirthdate"></asp:RegularExpressionValidator>
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h4>OHIP number:</h4><asp:TextBox ID="txtPOhip1" runat="server" MaxLength="4" Width="68px"></asp:TextBox>
        <asp:TextBox ID="txtPOhip2" runat="server" MaxLength="3" Width="29px"></asp:TextBox>
        <asp:TextBox ID="txtPOhip3" runat="server" MaxLength="3" Width="24px"></asp:TextBox>
        <asp:TextBox ID="txtPOhip4" runat="server" MaxLength="2" Width="31px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPOhip1" ErrorMessage="Enter a correct ohip number" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredPOhip" runat="server" ControlToValidate="txtPOhip1" ErrorMessage="Enter your OHIP number" ForeColor="Red"></asp:RequiredFieldValidator>
        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPOhip2" ErrorMessage="Enter a correct ohip number" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPOhip3" ErrorMessage="Enter a correct ohip number" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        <br />
        <asp:Label ID="lblPatient" runat="server"></asp:Label>
    
        <br />
        <br />
        <br />
&nbsp;<br />
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
