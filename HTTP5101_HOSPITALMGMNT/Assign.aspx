<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Assign.aspx.cs" Inherits="HTTP5101_HOSPITALMGMNT.Assign" %>

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
       <h2>Assign a Doctor to a patient page:</h2><br />
        <br />
        <h4>Patient id:</h4><asp:TextBox ID="txtPidAssign"  class="aspForm" runat="server"></asp:TextBox>
        &nbsp;<asp:Button ID="btnLoad" runat="server" Text="Load Patient" OnClick="btnLoad_Click" />
        <asp:RegularExpressionValidator ID="PatientIdValidator" runat="server" ControlToValidate="txtPidAssign" ErrorMessage="Enter a number" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredPatientId" runat="server" ControlToValidate="txtPidAssign" ErrorMessage="Enter the patient id" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <h4>Patient first name:</h4><asp:TextBox ID="txtPfnameAssign"  class="aspForm" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <h4>Patient last name:</h4><asp:TextBox ID="txtPlnameAssign"  class="aspForm" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <h4>Patient Illness:</h4><asp:TextBox ID="txtPillnessAssign"  class="aspForm" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblPatient" runat="server"></asp:Label>
        <br />
        <br />
       
        <h4>Enter Doctor expertise: </h4> <asp:TextBox ID="txtDoctor"  class="aspForm" runat="server"></asp:TextBox>
        <asp:Button ID="btnDoctor" runat="server" OnClick="btnDoctor_Click" Text="Find Doctor" Width="106px" />
        <asp:RegularExpressionValidator ID="DoctorExpertiseValidator" runat="server" ControlToValidate="txtDoctor" ErrorMessage="Enter the doctor expertise" ForeColor="Red" ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Temiskaming %>" SelectCommand="SELECT [doc_first_name], [doc_last_name], [doctor_id], [expertise] FROM [Doctor] WHERE ([expertise] = @expertise) ORDER BY [doctor_id]">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtDoctor" Name="expertise" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="doctor_id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="doctor_id" HeaderText="doctor_id" InsertVisible="False" ReadOnly="True" SortExpression="doctor_id" />
                <asp:BoundField DataField="doc_first_name" HeaderText="doc_first_name" SortExpression="doc_first_name" />
                <asp:BoundField DataField="doc_last_name" HeaderText="doc_last_name" SortExpression="doc_last_name" />
                <asp:BoundField DataField="expertise" HeaderText="expertise" SortExpression="expertise" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />
        <h4>Enter doctor id:</h4>
        <asp:TextBox ID="txtDocidAssign"  class="aspForm" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="DoctorIdValidator" runat="server" ControlToValidate="txtDocidAssign" ErrorMessage="Enter the doctor id (it is a number)" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
        <br />
        <h4>Click here to assign the patient to the doctor: </h4><asp:Button ID="btnAssign" runat="server" OnClick="btnAssign_Click" Text="Assign" />
        <br />
        <br />
       
        <asp:Label ID="lblPatientAssign" runat="server"></asp:Label>
       
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
