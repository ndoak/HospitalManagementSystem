<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorPage.aspx.cs" Inherits="DoctorPage.DoctorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>SHEARCH DOCTOR BY ID</h2>
        <div>
             <asp:Label ID="lblID" runat="server" Text="Doctor ID: "/>
            <asp:TextBox ID="txtDoctorId" runat="server"></asp:TextBox>

             <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
             <br />

        </div>
        <h2>Add Doctor</h2>
        <div>
            <asp:Label ID="lblDoctorFName" runat="server" Text="Doctor First Name: "/>
            <asp:TextBox ID="txtDoctorFName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDoctorFName" runat="server" ErrorMessage="*Required" ControlToValidate="txtDoctorFName" ValidationGroup="insert"></asp:RequiredFieldValidator>
        </div>

        <div>
            <asp:Label ID="lblDoctorLName" runat="server" Text="Doctor Last Name: "/>
            <asp:TextBox ID="txtDoctorLName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDoctorLName" runat="server" ErrorMessage="*Required" ControlToValidate="txtDoctorLName" ValidationGroup="insert"></asp:RequiredFieldValidator>
        </div>
 
        <div>
            <asp:Label ID="lblExpertise" runat="server" Text="Expertise: "/>
            <asp:TextBox ID="txtExpertise" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvExpertise" runat="server" ErrorMessage="*Required" ControlToValidate="txtExpertise" ValidationGroup="insert"></asp:RequiredFieldValidator>
        </div>

         <div>
            <asp:Label ID="lblPhone" runat="server" Text="Phone: "/>
            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="*Required" ControlToValidate="txtPhone" ValidationGroup="insert"></asp:RequiredFieldValidator>
        </div>

         <div>
            <asp:Label ID="lblAddress" runat="server" Text="Address: "/>
            <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="*Required" ControlToValidate="txtAddress" ValidationGroup="insert"></asp:RequiredFieldValidator>
         </div>

        <div>
            <asp:Label ID="lblCity" runat="server" Text="City: "/>
            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="*Required" ControlToValidate="txtCity" ValidationGroup="insert"></asp:RequiredFieldValidator>
        </div>

        
        <div>
            <asp:Label ID="lblState" runat="server" Text="State: "/>
            <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="*Required" ControlToValidate="txtState" ValidationGroup="insert"></asp:RequiredFieldValidator>

        </div>

        <div>
            <asp:Label ID="lblPostalCode" runat="server" Text="Postal Code: "/>
            <asp:TextBox ID="txtPostalCode" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ErrorMessage="*Required" ControlToValidate="txtPostalCode" ValidationGroup="insert"></asp:RequiredFieldValidator>

        </div>

        <div>
            <asp:Button ID="btnAddDoctor" runat="server" Text="Add Doctor" OnClick="btnAddDoctor_Click" />
            <asp:Button ID="btnShowDoctors" runat="server" Text="Show Doctors" OnClick="btnShowDoctors_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
        </div>

        <div>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>

        <div>
            <asp:GridView ID="gvShowAllDoctor" runat="server"></asp:GridView>
        </div>

        <div>
            <h2>Delete Row by ID</h2>
            <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
             <asp:Button ID="btnDelete" runat="server" Text="Delete Doctor" OnClick="btnDelete_Click" />
        </div>
    </div>
    </form>
</body>
</html>
