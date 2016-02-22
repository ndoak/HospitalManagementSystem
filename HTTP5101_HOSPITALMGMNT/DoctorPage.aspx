<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorPage.aspx.cs" Inherits="HTTP5101_HOSPITALMGMNT.DoctorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	 <script src="./js/Menu.js"></script>
</head>
<body>
    <header id="header">
		<div class="header-wrapper clearfix">
			<div class="logo">
				Temiskaming Hospital
			</div>
		</div>	
		</header>
    <section id="slide-show">

		<div class="slide">
			<img src="./images/hospital1.jpg">
			<div class="slide-content">
				<div class="slide-content-wrapper">
					<h3 class="title">Temiskaming Hosptial</h3>
					<p class="description">Famous Hospital</p>
				</div>
			</div>

		</div>

		<div class="slide" style="display:none">
			<img src="./images/hospital2.jpg">
			<div class="slide-content">
				<div class="slide-content-wrapper">
					<h3 class="title">Temiskaming Hosptial</h3>
					<p class="description">Famous Hospital</p>
				</div>
			</div>
		</div>

		<div class="slide" style="display:none">
			<img src="./images/hospital3.jpg">
			<div class="slide-content">
				<div class="slide-content-wrapper">
					<h3 class="title">Temiskaming Hospital</h3>
					<p class="description">Famous Hospital</p>
				</div>
			</div>


		</div>

		<div class="timers">
			<div class="timers-wrapper">
				<div class="timer">
					<div class="process"></div>
				</div>
				<div class="timer">
					<div class="process"></div>
				</div>
				<div class="timer">
					<div class="process"></div>
				</div>
			</div>
		</div>

		<div class="PrevSlide">
			<span class="left-arrow"></span>
		</div>

		<div class="NextSlide">
			<span class="right-arrow"></span>
		</div>
	</section>

    <form id="form1" runat="server">
    <div class="form-width">
        <h2 class="search">SEARCH DOCTOR BY ID</h2>
        <hr />
        <div class="formHospital">
             <asp:Label ID="lblID" runat="server" Text="Doctor ID: "/>
            <asp:TextBox ID="txtDoctorId" runat="server" class="aspForm"></asp:TextBox>

             <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="Search" class="btn-form" />
             <asp:RequiredFieldValidator ID="rfvDoctorId" runat="server" ControlToValidate="txtDoctorId" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Search"></asp:RequiredFieldValidator>
            
            <div>
                <asp:Label ID="lblSearchError" runat="server"></asp:Label>
            </div>
            <div>
                <asp:GridView ID="gvSearch" class="table-bordered" runat="server">
                </asp:GridView>
                
            </div>

             <br />

        </div>

        <h2 class="add">Add Doctor</h2>
        <hr />
        <div class="formHospital1">
           
        <div>

            <asp:Label ID="lblDoctorFName" runat="server" Text="Doctor First Name: "/>
            <asp:TextBox ID="txtDoctorFName" runat="server" class="aspForm"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDoctorName" runat="server" ControlToValidate="txtDoctorFName" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>

        </div>

        <div>
            <asp:Label ID="lblDoctorLName" runat="server" Text="Doctor Last Name: "/>
            <asp:TextBox ID="txtDoctorLName" runat="server" class="aspForm"></asp:TextBox>
            .<asp:RequiredFieldValidator ID="rfvDoctorLastName" runat="server" ControlToValidate="txtDoctorLName" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
        </div>
 
        <div>
            <asp:Label ID="lblExpertise" runat="server" Text="Expertise: "/>
            <asp:TextBox ID="txtExpertise" runat="server" class="aspForm"></asp:TextBox>
            .<asp:RequiredFieldValidator ID="rfvExpertise" runat="server" ControlToValidate="txtExpertise" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
        </div>

         <div>
            <asp:Label ID="lblPhone" runat="server" Text="Phone: "/>
            <asp:TextBox ID="txtPhone" runat="server" class="aspForm"></asp:TextBox>
             .<asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
        </div>

         <div>
            <asp:Label ID="lblAddress" runat="server" Text="Address: "/>
            <asp:TextBox ID="txtAddress" runat="server" class="aspForm"></asp:TextBox>
             .<asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
         </div>

        <div>
            <asp:Label ID="lblCity" runat="server" Text="City: "/>
            <asp:TextBox ID="txtCity" runat="server" class="aspForm"></asp:TextBox>
            .<asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
        </div>

        
        <div>
            <asp:Label ID="lblState" runat="server" Text="State: "/>
            <asp:TextBox ID="txtState" runat="server" class="aspForm"></asp:TextBox>
            .<asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>

        </div>

        <div>
            <asp:Label ID="lblPostalCode" runat="server" Text="Postal Code: "/>
            
            <asp:TextBox ID="txtPostalCode" runat="server" class="aspForm"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Add" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revPostCode" runat="server" ErrorMessage="not valid postal code" ControlToValidate="txtPostalCode" Display="Dynamic" ForeColor="Red" ValidationExpression="^([a-zA-Z]\d[a-zA-z]( )?\d[a-zA-Z]\d)$" ValidationGroup="Add" ></asp:RegularExpressionValidator>
        </div>

        <div>
            <asp:Button class="btn-form" ID="btnAddDoctor" runat="server" Text="Add Doctor" OnClick="btnAddDoctor_Click" ValidationGroup="Add" />
            <asp:Button class="btn-form" ID="btnShowDoctors" runat="server" Text="Show Doctors" OnClick="btnShowDoctors_Click" />
           
            <asp:Button class="btn-form" ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
        </div>

        <div>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>

        <div>
            <asp:GridView class="table-bordered" ID="gvShowAllDoctor" runat="server" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px"></asp:GridView>
        </div>

        </div>

        <div>
             <h2 class="modify">Modify Doctor</h2>
                <hr />
            <div class="formHospital3">   
             <div>
                <asp:Label ID="lblDocID" runat="server" Text="IF YOU WANT TO MODIFY DOCTOR FILL IN DOCTOR ID:"></asp:Label>
                <asp:TextBox ID="txtDocID" runat="server" class="aspForm"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDocID" runat="server" ErrorMessage="REQUIRED" ControlToValidate="txtDocID" ForeColor="Red" ValidationGroup="Modify"></asp:RequiredFieldValidator>
                <asp:Label ID="lblDocIDMessage" runat="server" Text=""></asp:Label>
            
            </div>

              <div>

            <asp:Label ID="lblDoctorFName1" runat="server" Text="Doctor First Name: "/>
            <asp:TextBox ID="txtDoctorFName1" runat="server" class="aspForm"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDoctorName1" runat="server" ControlToValidate="txtDoctorFName1" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Modify"></asp:RequiredFieldValidator>

        </div>

        <div>
            <asp:Label ID="lblDoctorLName1" runat="server" Text="Doctor Last Name: "/>
            <asp:TextBox ID="txtDoctorLName1" runat="server" class="aspForm"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDoctorLastName1" runat="server" ControlToValidate="txtDoctorLName1" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Modify"></asp:RequiredFieldValidator>
        </div>
        
        <div>
            <asp:Label ID="lblExpertise1" runat="server" Text="Expertise: "/>
            <asp:TextBox ID="txtExpertise1" runat="server" class="aspForm"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvExpertise1" runat="server" ControlToValidate="txtExpertise1" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Modify"></asp:RequiredFieldValidator>
        </div>
            
        <div>
            <asp:Label ID="lblPhone1" runat="server" Text="Phone: "/>
            <asp:TextBox ID="txtPhone1" runat="server" class="aspForm"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhone1" runat="server" ControlToValidate="txtPhone1" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Modify"></asp:RequiredFieldValidator>
        </div> 
            
            
         <div>
            <asp:Label ID="lblAddress1" runat="server" Text="Address: "/>
            <asp:TextBox ID="txtAddress1" runat="server" class="aspForm"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" ControlToValidate="txtAddress1" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Modify"></asp:RequiredFieldValidator>
         </div>
            
         <div>
            <asp:Label ID="lblCity1" runat="server" Text="City: "/>
            <asp:TextBox ID="txtCity1" runat="server" class="aspForm"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCity1" runat="server" ControlToValidate="txtCity1" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Modify"></asp:RequiredFieldValidator>
        </div>  
            
        <div>
            <asp:Label ID="lblState1" runat="server" Text="State: "/>
            <asp:TextBox ID="txtState1" runat="server" class="aspForm"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvState1" runat="server" ControlToValidate="txtState1" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Modify"></asp:RequiredFieldValidator>

        </div>
            
          <div>
            <asp:Label ID="lblPostalCode1" runat="server" Text="Postal Code: "/>          
            <asp:TextBox ID="txtPostalCode1" runat="server" class="aspForm"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPostalCode1" runat="server" ControlToValidate="txtPostalCode1" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Modify" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revPostCode1" runat="server" ErrorMessage="not valid postal code" ControlToValidate="txtPostalCode1" Display="Dynamic" ForeColor="Red" ValidationExpression="^([a-zA-Z]\d[a-zA-z]( )?\d[a-zA-Z]\d)$" ValidationGroup="Modify" ></asp:RegularExpressionValidator>
        </div>      
        
            <div>
                 <asp:Label ID="lblMessage1" runat="server" Text=""></asp:Label>
                <asp:Button class="btn-form" ID="btnModify" runat="server" Text="Modify Doctors" OnClick="btnModify_Click" ValidationGroup="Modify" />
            </div>
</div> 
    </div>

        <div>
            <h2 class="delete">Delete Row by ID</h2>
            <hr />
            <div class="formHospital2">
            <asp:TextBox ID="txtId" runat="server" class="aspForm"></asp:TextBox>
             <asp:Button class="btn-form" ID="btnDelete" runat="server" Text="Delete Doctor" OnClick="btnDelete_Click" ValidationGroup="Delete" />
            <asp:RequiredFieldValidator ID="rfvDeleteDoctor" runat="server" ControlToValidate="txtId" ErrorMessage="REQUIRED" ForeColor="Red" ValidationGroup="Delete"></asp:RequiredFieldValidator>
            <div>
                <asp:Label ID="lblDeleteMessage" runat="server"></asp:Label>
                <asp:Button ID="btnReturnHome" runat="server" Text="Return Home Page" class="btn-form" PostBackUrl="~/Menu.aspx" />
            </div>
           </div>
        </div>
    </div>
        <div>
            
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
