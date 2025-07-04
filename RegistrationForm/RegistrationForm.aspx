<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="RegistrationForm.RegistrationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="p-3 mb-4 text-center" style="background-color: #1A8FE3; color: #fff;">
        <h3 class="mb-0 fw-bold">Registration Form</h3>
    </div>
    <div class="container my-5">
        <!-- Personal Details -->
        <div class="section-header bg-custom-blue">1. Personal Details</div>
        <div class="row mb-3">
            <!-- Prefix -->
            <div class="col-md-2">
                <asp:Label AssociatedControlID="ddlPrefix" runat="server" CssClass="form-label">Prefix</asp:Label>
                <asp:DropDownList ID="ddlPrefix" runat="server" CssClass="form-select" >
                    <asp:ListItem Text="--Select--" Value="" />
                    <asp:ListItem Text="Prof." Value="Prof." />
                    <asp:ListItem Text="Mr." Value="Mr." />
                    <asp:ListItem Text="Ms." Value="Ms." />
                    <asp:ListItem Text="Mrs." Value="Mrs." />
                    <asp:ListItem Text="Dr." Value="Dr." />
                    <asp:ListItem Text="Shrimati" Value="Shrimati" />

                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvPrefix" runat="server"
                    ControlToValidate="ddlPrefix" InitialValue=""
                    ErrorMessage="Prefix is required." CssClass="text-danger"
                    ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
                
            </div>
            <!-- First Name -->
            <div class="col-md-5">
                <asp:Label AssociatedControlID="txtFirstName" runat="server" CssClass="form-label">First Name</asp:Label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" MaxLength="20" />
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                    CssClass="text-danger" ErrorMessage="First Name is required." Display="Dynamic"
                    ValidationGroup="UserForm" SetFocusOnError="True" />
                <asp:RegularExpressionValidator ID="revFirstName" runat="server" ControlToValidate="txtFirstName"
                    CssClass="text-danger" ValidationExpression="^[A-Za-z\s]+$"
                    ErrorMessage="First Name must contain only letters and spaces." Display="Dynamic"
                    ValidationGroup="UserForm" SetFocusOnError="True"/>
            </div>
            <!-- Surname -->
            <div class="col-md-5">
                <asp:Label AssociatedControlID="txtSurname" runat="server" CssClass="form-label">Last Name</asp:Label>
                <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" MaxLength="20" />
                <asp:RequiredFieldValidator ID="rfvSurname" runat="server" ControlToValidate="txtSurname"
                    CssClass="text-danger" ErrorMessage="Surname is required." Display="Dynamic"
                    ValidationGroup="UserForm" SetFocusOnError="True"/>
                <asp:RegularExpressionValidator ID="revSurname" runat="server" ControlToValidate="txtSurname"
                    CssClass="text-danger" ValidationExpression="^[A-Za-z\s]+$"
                    ErrorMessage="Surname must contain only letters and spaces." Display="Dynamic"
                    ValidationGroup="UserForm" SetFocusOnError="True"/>
            </div>
        </div>
        <!-- Age -->
        <div class="row mb-3">
            <div class="col-md-3">
                <asp:Label AssociatedControlID="txtAge" runat="server" CssClass="form-label">Age (years):</asp:Label>
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control w-auto"
                    TextMode="Number"
                    Style="width: 100px;"
                    Attributes-Add="min='18' max='100' step='1'" />
                <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="txtAge"
                    CssClass="text-danger" ErrorMessage="Enter Age" Display="Dynamic"
                    ValidationGroup="UserForm" SetFocusOnError="True" />
                <asp:RangeValidator ID="rangeAgeValidator" runat="server" ControlToValidate="txtAge"
                    MinimumValue="18" MaximumValue="100" Type="Integer"
                    ErrorMessage="Age must be between 18 and 100."
                    CssClass="text-danger" Display="Dynamic" ValidationGroup="UserForm" SetFocusOnError="True" />
            </div>
        </div>

      
        <!-- Institute Information -->
        <div class="section-header bg-custom-blue">2. Institute Information</div>
        <div class="mb-3">
            <asp:Label AssociatedControlID="txtInstitute" runat="server" CssClass="form-label">Name and Address of Institute</asp:Label>
            <asp:TextBox ID="txtInstitute" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" />
            <asp:RequiredFieldValidator ID="rfvInstitute" runat="server" ControlToValidate="txtInstitute"
                CssClass="text-danger" ErrorMessage="Institute name and address is required."
                ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
        </div>
        <div class="row mb-3">
            <div class="col-md-3">
                <asp:Label AssociatedControlID="txtPlaceInst" runat="server" CssClass="form-label">Place</asp:Label>
                <asp:TextBox ID="txtPlaceInst" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvPlaceInst" runat="server" ControlToValidate="txtPlaceInst"
                    CssClass="text-danger" ErrorMessage="Place is required." ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
            </div>
            <div class="col-md-3">
                <asp:Label AssociatedControlID="txtTalukaInst" runat="server" CssClass="form-label">Taluka</asp:Label>
                <asp:TextBox ID="txtTalukaInst" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvTalukaInst" runat="server" ControlToValidate="txtTalukaInst"
                    CssClass="text-danger" ErrorMessage="Taluka is required." ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
            </div>
            <div class="col-md-3">
                <asp:Label AssociatedControlID="txtDistrictInst" runat="server" CssClass="form-label">District</asp:Label>
                <asp:TextBox ID="txtDistrictInst" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvDistrictInst" runat="server" ControlToValidate="txtDistrictInst"
                    CssClass="text-danger" ErrorMessage="District is required." ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
            </div>
            <div class="col-md-3">
                <asp:Label AssociatedControlID="txtPincodeInst" runat="server" CssClass="form-label">Pincode</asp:Label>
                <asp:TextBox ID="txtPincodeInst" runat="server" CssClass="form-control" MaxLength="6" />
                <asp:RequiredFieldValidator ID="rfvPincodeInst" runat="server" ControlToValidate="txtPincodeInst"
                    CssClass="text-danger" ErrorMessage="Pincode is required." ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
                <asp:RegularExpressionValidator ID="revPincodeInst" runat="server" ControlToValidate="txtPincodeInst"
                    CssClass="text-danger" ValidationExpression="^\d{6}$"
                    ErrorMessage="Pincode must be 6 digits." ValidationGroup="UserForm" Display="Dynamic" />
            </div>
        </div>
        <div class="mb-3">
            <asp:Label AssociatedControlID="txtDesignation" runat="server" CssClass="form-label">Designation in the Institute</asp:Label>
            <asp:TextBox ID="txtDesignation" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvDesignation" runat="server" ControlToValidate="txtDesignation"
                CssClass="text-danger" ErrorMessage="Designation is required." ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
            <asp:RegularExpressionValidator ID="revDesignation" runat="server" ControlToValidate="txtDesignation"
                CssClass="text-danger"
                ValidationExpression="^[A-Za-z\s]+$"
                ErrorMessage="Only letters and spaces are allowed."
                ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
        </div>
        <!-- Correspondence Address -->
        <div class="section-header bg-custom-blue">3. Correspondence Address</div>
        <div class="mb-3">
            <asp:Label AssociatedControlID="txtCorrAddress" runat="server" CssClass="form-label">Address for Correspondence</asp:Label>
            <asp:TextBox ID="txtCorrAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" />
            <asp:RequiredFieldValidator ID="rfvCorrAddress" runat="server" ControlToValidate="txtCorrAddress"
                CssClass="text-danger" ErrorMessage="Correspondence address is required."
                ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
        </div>
        <div class="row mb-3">
            <div class="col-md-3">
                <asp:Label AssociatedControlID="txtPlaceCorr" runat="server" CssClass="form-label">Place</asp:Label>
                <asp:TextBox ID="txtPlaceCorr" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvPlaceCorr" runat="server" ControlToValidate="txtPlaceCorr"
                    CssClass="text-danger" ErrorMessage="Place is required." ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
            </div>
            <div class="col-md-3">
                <asp:Label AssociatedControlID="txtTalukaCorr" runat="server" CssClass="form-label">Taluka</asp:Label>
                <asp:TextBox ID="txtTalukaCorr" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvTalukaCorr" runat="server" ControlToValidate="txtTalukaCorr"
                    CssClass="text-danger" ErrorMessage="Taluka is required." ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
            </div>
            <div class="col-md-3">
                <asp:Label AssociatedControlID="txtDistrictCorr" runat="server" CssClass="form-label">District</asp:Label>
                <asp:TextBox ID="txtDistrictCorr" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvDistrictCorr" runat="server" ControlToValidate="txtDistrictCorr"
                    CssClass="text-danger" ErrorMessage="District is required." ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
            </div>
            <div class="col-md-3">
                <asp:Label AssociatedControlID="txtPincodeCorr" runat="server" CssClass="form-label">Pincode</asp:Label>
                <asp:TextBox ID="txtPincodeCorr" runat="server" CssClass="form-control" MaxLength="6" />
                <asp:RequiredFieldValidator ID="rfvPincodeCorr" runat="server" ControlToValidate="txtPincodeCorr"
                    CssClass="text-danger" ErrorMessage="Pincode is required." ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
                <asp:RegularExpressionValidator ID="revPincodeCorr" runat="server" ControlToValidate="txtPincodeCorr"
                    CssClass="text-danger" ValidationExpression="^\d{6}$"
                    ErrorMessage="Pincode must be 6 digits." ValidationGroup="UserForm" Display="Dynamic" />
            </div>
        </div>
        <!-- Contact Details -->
        <div class="row mb-3">
            <div class="col-md-6">
                <asp:Label AssociatedControlID="txtMobile" runat="server" CssClass="form-label">Mobile No.</asp:Label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" MaxLength="10" />
                <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile"
                    CssClass="text-danger" ErrorMessage="Mobile number is required." ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
                <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile"
                    CssClass="text-danger" ValidationExpression="^[6-9]\d{9}$"
                    ErrorMessage="Enter a valid 10-digit mobile number starting with 6-9." ValidationGroup="UserForm" Display="Dynamic" />
            </div>
            <div class="col-md-6">
                <asp:Label AssociatedControlID="txtEmail" runat="server" CssClass="form-label">Email</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    CssClass="text-danger" ErrorMessage="Email is required." ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                    CssClass="text-danger" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
                    ErrorMessage="Enter a valid email address." ValidationGroup="UserForm" Display="Dynamic" />
            </div>
        </div>

        <!-- Accommodation Required -->
        <div class="section-header bg-custom-blue">4. Accommodation Details</div>
        <div class="mb-3 d-flex align-items-center">
            <asp:Label
                runat="server"
                AssociatedControlID="ddlAccommodation"
                CssClass="form-label me-3 mb-0"
                Text="Accommodation Required" SetFocusOnError="True">
            </asp:Label>
            <asp:DropDownList
                ID="ddlAccommodation"
                runat="server"
                CssClass="form-control w-auto"
                required="required">
                <asp:ListItem Text="--Select an option--" Value="" Selected="True" Disabled="True"></asp:ListItem>
                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                <asp:ListItem Text="No" Value="No"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator
                ID="rfvAccommodation"
                runat="server"
                ControlToValidate="ddlAccommodation"
                InitialValue=""
                ErrorMessage="Please select an accommodation option."
                CssClass="text-danger ms-3"
                Display="Dynamic"
                ValidationGroup="UserForm"
                SetFocusOnError="True" />
        </div>

        <div class="row mb-3">
            <div class="col-md-12 d-flex align-items-center">
                <!-- Label -->
                <asp:Label runat="server" CssClass="form-label me-3" Text="Arrival at Guest House"></asp:Label>

                <!-- DateTime Input -->
                <input type="datetime-local" id="dateTimeInput" name="dateTimeInput" runat="server" class="form-control styled-datetime me-3" style="max-width: 250px;" />

                <!-- RequiredFieldValidator -->
                <asp:RequiredFieldValidator ID="rfvDateTime" runat="server"
                    ControlToValidate="dateTimeInput"
                    Display="Dynamic"
                    ErrorMessage="Date and time is required"
                    CssClass="text-danger"
                    InitialValue=""
                    ValidationGroup="UserForm"
                    SetFocusOnError="true" />
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-12 d-flex align-items-center">
                <!-- Label -->
                <asp:Label runat="server" CssClass="form-label me-3" Text="Departure from Guest House:"></asp:Label>
                <input type="datetime-local" id="Datetimelocal1" name="dateTimeInput" runat="server" class="form-control styled-datetime me-3" style="max-width: 250px;" />

                <!-- RequiredFieldValidator -->
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="dateTimeInput"
                    Display="Dynamic"
                    ErrorMessage="Date and time is required"
                    CssClass="text-danger"
                    InitialValue=""
                    ValidationGroup="UserForm"
                    SetFocusOnError="true" />
            </div>
        </div>
        <!-- Emergency Contact -->
        <div class="section-header bg-custom-blue">5. Transport</div>
        <div class="mb-3 d-flex align-items-center">
            <asp:Label
                runat="server"
                AssociatedControlID="ddlOwnVehicle"
                CssClass="form-label me-3 mb-0"
                Text="Have own vehicle for transport">
            </asp:Label>
            <asp:DropDownList
                ID="ddlOwnVehicle"
                runat="server"
                CssClass="form-control w-auto">
                <asp:ListItem Text="--Select an option--" Value="" Selected="True" Disabled="True"></asp:ListItem>
                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                <asp:ListItem Text="No" Value="No"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator
                ID="rfvOwnVehicle"
                runat="server"
                ControlToValidate="ddlOwnVehicle"
                InitialValue=""
                ErrorMessage="Please select if you have your own vehicle."
                CssClass="text-danger ms-3"
                Display="Dynamic"
                ValidationGroup="UserForm"
                SetFocusOnError="True" />
        </div>


        <!-- Emergency Contact -->
        <div class="section-header bg-custom-blue">6. Emergency Contact</div>
        <div class="row mb-3">
            <div class="col-md-6">
                <asp:Label AssociatedControlID="txtEmergencyName" runat="server" CssClass="form-label">Name</asp:Label>
                <asp:TextBox ID="txtEmergencyName" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvEmergencyName" runat="server" ControlToValidate="txtEmergencyName"
                    CssClass="text-danger" ErrorMessage="Emergency contact name is required."
                    ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
                <asp:RegularExpressionValidator ID="revEmergencyName" runat="server" ControlToValidate="txtEmergencyName"
                    CssClass="text-danger" ValidationExpression="^[A-Za-z\s]+$"
                    ErrorMessage="Name must contain only letters and spaces." ValidationGroup="UserForm" Display="Dynamic" />
            </div>
            <div class="col-md-6">
                <asp:Label AssociatedControlID="txtEmergencyMobile" runat="server" CssClass="form-label">Mobile No.</asp:Label>
                <asp:TextBox ID="txtEmergencyMobile" runat="server" CssClass="form-control" MaxLength="10" />
                <asp:RequiredFieldValidator ID="rfvEmergencyMobile" runat="server" ControlToValidate="txtEmergencyMobile"
                    CssClass="text-danger" ErrorMessage="Emergency mobile number is required."
                    ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True"/>
                <asp:RegularExpressionValidator ID="revEmergencyMobile" runat="server" ControlToValidate="txtEmergencyMobile"
                    CssClass="text-danger" ValidationExpression="^[6-9]\d{9}$"
                    ErrorMessage="Enter a valid 10-digit mobile number starting with 6-9." ValidationGroup="UserForm" Display="Dynamic" />
            </div>
        </div>
        <!-- Participation Certificate -->
        <div class="mb-3 d-flex align-items-center">
            <asp:Label runat="server" CssClass="form-label me-3" AssociatedControlID="DropDownList1">
        Participation Certificate Required
            </asp:Label>
            <asp:DropDownList
                ID="DropDownList1"
                runat="server"
                CssClass="form-control w-auto">
                <asp:ListItem Text="--Select an option--" Value="" Selected="True" Disabled="True"></asp:ListItem>
                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                <asp:ListItem Text="No" Value="No"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator
                ID="rfvParticipationCertificate"
                runat="server"
                ControlToValidate="DropDownList1"
                InitialValue=""
                ErrorMessage="Please select if participation certificate is required."
                CssClass="text-danger ms-3"
                Display="Dynamic"
                ValidationGroup="UserForm"
                SetFocusOnError="True" />
        </div>
        <div class="text-center mt-4">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary px-5"
                ValidationGroup="UserForm" OnClick="btnSubmit_Click" />
        </div>
    </div>

 <style>.styled-datetime {
    width: 50%;
    padding: 7px 8px;
    font-size: 15px;
    border-radius: 6px;
    border: 1px solid #ccc;
    box-sizing: border-box;
    background-color: #fff;
    transition: border-color 0.3s, box-shadow 0.3s;
}

    .styled-datetime:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        outline: none;
    }</style>
    
</asp:Content>

    