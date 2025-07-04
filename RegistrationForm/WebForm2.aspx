<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="RegistrationForm.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" rel="stylesheet" />
    <style>
        .styled-datetime {
            width: 100%;
            max-width: 250px;
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
            }

        .section-header {
            font-size: 1.25rem;
            margin-bottom: 1rem;
        }

        .bg-custom-blue {
            background-color: #1A8FE3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="p-3 mb-4 text-center" style="background-color: #1A8FE3; color: #fff;">
            <h3 class="mb-0 fw-bold">Registration Form</h3>
        </div>

        <div class="container my-5">

            <p class="text-danger fw-bold">* Fields are mandatory</p>

            <!-- 1. Personal Details -->
            <div class="section-header bg-custom-blue mb-3 p-2 text-white fw-bold">1. Personal Details</div>
            <div class="row mb-3">
                <!-- Prefix -->
                <div class="col-md-2">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="ddlPrefix" runat="server" CssClass="form-label">Prefix</asp:Label>
                    <asp:DropDownList ID="ddlPrefix" runat="server" CssClass="form-select" ClientIDMode="Static">
                        <asp:ListItem Text="--Select--" Value="" />
                        <asp:ListItem Text="Prof." Value="Prof." />
                        <asp:ListItem Text="Mr." Value="Mr." />
                        <asp:ListItem Text="Ms." Value="Ms." />
                        <asp:ListItem Text="Mrs." Value="Mrs." />
                        <asp:ListItem Text="Dr." Value="Dr." />
                        <asp:ListItem Text="Shrimati" Value="Shrimati" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvPrefix" runat="server" ControlToValidate="ddlPrefix"
                        InitialValue="" ErrorMessage="*" CssClass="text-danger fw-bold"
                        ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                </div>

                <!-- First Name -->
                <div class="col-md-5">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtFirstName" runat="server" CssClass="form-label">First Name</asp:Label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" MaxLength="20" ClientIDMode="Static" onkeypress="return isLetterKey(event)" />
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                        CssClass="text-danger fw-bold" ErrorMessage="*" Display="Dynamic"
                        ValidationGroup="UserForm" SetFocusOnError="True" />
                    <asp:RegularExpressionValidator ID="revFirstName" runat="server" ControlToValidate="txtFirstName"
                        CssClass="text-danger" ValidationExpression="^[A-Za-z]+$"
                        ErrorMessage="First Name must contain only letters"
                        Display="Dynamic" ValidationGroup="UserForm" SetFocusOnError="True" />
                </div>

                <!-- Last Name -->
                <div class="col-md-5">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtSurname" runat="server" CssClass="form-label">Surname</asp:Label>
                    <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" MaxLength="20" ClientIDMode="Static" onkeypress="return isLetterKey(event)" />
                    <asp:RequiredFieldValidator ID="rfvSurname" runat="server" ControlToValidate="txtSurname"
                        CssClass="text-danger fw-bold" ErrorMessage="*" Display="Dynamic"
                        ValidationGroup="UserForm" SetFocusOnError="True" />
                    <asp:RegularExpressionValidator ID="revSurname" runat="server" ControlToValidate="txtSurname"
                        CssClass="text-danger" ValidationExpression="^[A-Za-z]+(?: [A-Za-z]+)*$"
                        ErrorMessage="Last Name must contain only letters"
                        Display="Dynamic" ValidationGroup="UserForm" SetFocusOnError="True" />
                </div>
            </div>

            <!-- Age -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtAge" runat="server" CssClass="form-label">Age (years):</asp:Label>
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control w-auto" TextMode="Number"
                        Style="width: 100px;" ClientIDMode="Static" min="18" max="99" oninput="preventOutOfRange(this);" />
                    <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="txtAge"
                        CssClass="text-danger fw-bold" ErrorMessage="*" Display="Dynamic"
                        ValidationGroup="UserForm" SetFocusOnError="True" />
                    <asp:RangeValidator ID="rangeAgeValidator" runat="server" ControlToValidate="txtAge"
                        MinimumValue="18" MaximumValue="100" Type="Integer"
                        ErrorMessage="Age must be between 18 and 99."
                        CssClass="text-danger" Display="Dynamic" ValidationGroup="UserForm" SetFocusOnError="True" />
                </div>
            </div>

            <!-- Institute Information -->
            <div class="section-header bg-custom-blue mb-3 p-2 text-white fw-bold">2. Institute Information</div>
            <div class="mb-3">
                <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtInstitute" runat="server" CssClass="form-label">Name and Address of Institute</asp:Label>
                <asp:TextBox ID="txtInstitute" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" ClientIDMode="Static" />
                <asp:RequiredFieldValidator ID="rfvInstitute" runat="server" ControlToValidate="txtInstitute"
                    CssClass="text-danger fw-bold" ErrorMessage="*"
                    ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtPlaceInst" runat="server" CssClass="form-label">Place</asp:Label>
                    <asp:TextBox ID="txtPlaceInst" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return isLetterKey(event)" />
                    <asp:RequiredFieldValidator ID="rfvPlaceInst" runat="server" ControlToValidate="txtPlaceInst"
                        CssClass="text-danger fw-bold" ErrorMessage="*" ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                </div>
                <div class="col-md-3">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtTalukaInst" runat="server" CssClass="form-label">Taluka</asp:Label>
                    <asp:TextBox ID="txtTalukaInst" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return isLetterKey(event)" />
                    <asp:RequiredFieldValidator ID="rfvTalukaInst" runat="server" ControlToValidate="txtTalukaInst"
                        CssClass="text-danger fw-bold" ErrorMessage="*" ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                </div>
                <div class="col-md-3">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtDistrictInst" runat="server" CssClass="form-label">District</asp:Label>
                    <asp:TextBox ID="txtDistrictInst" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return isLetterKey(event)" />
                    <asp:RequiredFieldValidator ID="rfvDistrictInst" runat="server" ControlToValidate="txtDistrictInst"
                        CssClass="text-danger fw-bold" ErrorMessage="*" ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                </div>
                <div class="col-md-3">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="TextBox1" runat="server" CssClass="form-label">Pincode</asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" MaxLength="6" ClientIDMode="Static"
                        onkeypress="return isNumberKey(event)" />
                    <asp:RequiredFieldValidator ID="rfvPincodeInst" runat="server" ControlToValidate="TextBox1"
                        CssClass="text-danger fw-bold" ErrorMessage="*" ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                    <asp:RegularExpressionValidator ID="revPincodeInst" runat="server" ControlToValidate="TextBox1"
                        CssClass="text-danger" ValidationExpression="^\d{6}$"
                        ErrorMessage="Pincode must be 6 digits." ValidationGroup="UserForm" Display="Dynamic" />
                </div>

            </div>

            <div class="mb-3">
                <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtDesignation" runat="server" CssClass="form-label">Designation in the Institute</asp:Label>
                <asp:TextBox ID="txtDesignation" runat="server" CssClass="form-control" ClientIDMode="Static" />
                <asp:RequiredFieldValidator ID="rfvDesignation" runat="server" ControlToValidate="txtDesignation"
                    CssClass="text-danger fw-bold" ErrorMessage="*" ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                <asp:RegularExpressionValidator ID="revDesignation" runat="server" ControlToValidate="txtDesignation"
                    CssClass="text-danger"
                    ValidationExpression="^[A-Za-z\s'.-]+$"
                    ErrorMessage="Only letters, spaces, apostrophes, and hyphens are allowed."
                    ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
            </div>

            <!-- Correspondence Address -->
            <div class="section-header bg-custom-blue mb-3 p-2 text-white fw-bold">3. Correspondence Address</div>
            <div class="mb-3">
                <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtCorrAddress" runat="server" CssClass="form-label">Address for Correspondence</asp:Label>
                <asp:TextBox ID="txtCorrAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" ClientIDMode="Static" />
                <asp:RequiredFieldValidator ID="rfvCorrAddress" runat="server" ControlToValidate="txtCorrAddress"
                    CssClass="text-danger fw-bold" ErrorMessage="*"
                    ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtPlaceCorr" runat="server" CssClass="form-label">Place</asp:Label>
                    <asp:TextBox ID="txtPlaceCorr" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return isLetterKey(event)" />
                    <asp:RequiredFieldValidator ID="rfvPlaceCorr" runat="server" ControlToValidate="txtPlaceCorr"
                        CssClass="text-danger fw-bold" ErrorMessage="*" ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                </div>
                <div class="col-md-3">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtTalukaCorr" runat="server" CssClass="form-label">Taluka</asp:Label>
                    <asp:TextBox ID="txtTalukaCorr" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return isLetterKey(event)" />
                    <asp:RequiredFieldValidator ID="rfvTalukaCorr" runat="server" ControlToValidate="txtTalukaCorr"
                        CssClass="text-danger fw-bold" ErrorMessage="*" ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                </div>
                <div class="col-md-3">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtDistrictCorr" runat="server" CssClass="form-label">District</asp:Label>
                    <asp:TextBox ID="txtDistrictCorr" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return isLetterKey(event)" />
                    <asp:RequiredFieldValidator ID="rfvDistrictCorr" runat="server" ControlToValidate="txtDistrictCorr"
                        CssClass="text-danger fw-bold" ErrorMessage="*" ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                </div>
                <div class="col-md-3">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtPincode" runat="server" CssClass="form-label">Pincode</asp:Label>
                    <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" MaxLength="6" ClientIDMode="Static"
                        onkeypress="return isNumberKey(event)" />
                    <asp:RequiredFieldValidator ID="rfvPincode" runat="server" ControlToValidate="txtPincode"
                        CssClass="text-danger fw-bold" ErrorMessage="*" ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                    <asp:RegularExpressionValidator ID="revPincode" runat="server" ControlToValidate="txtPincode"
                        CssClass="text-danger" ValidationExpression="^\d{6}$"
                        ErrorMessage="*" ValidationGroup="UserForm" Display="Dynamic" />
                </div>
            </div>

            <!-- Contact Details -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtMobile" runat="server" CssClass="form-label">Mobile No.</asp:Label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" MaxLength="10" ClientIDMode="Static" onkeypress="return limitNumber(event)" />
                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile"
                        CssClass="text-danger fw-bold" ErrorMessage="*" ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                    <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile"
                        CssClass="text-danger" ValidationExpression="^[6-9]\d{9}$"
                        ErrorMessage="Enter a valid 10-digit mobile number starting with 6-9." ValidationGroup="UserForm" Display="Dynamic" />
                </div>
                <div class="col-md-6">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtEmail" runat="server" CssClass="form-label">Email</asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ClientIDMode="Static" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                        CssClass="text-danger fw-bold" ErrorMessage="*" ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        CssClass="text-danger" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
                        ErrorMessage="Enter a valid email address." ValidationGroup="UserForm" Display="Dynamic" />
                </div>
            </div>

            <!-- Accommodation Required -->
            <div class="section-header bg-custom-blue mb-3 p-2 text-white fw-bold">4. Accommodation Details</div>
            <div class="mb-3 d-flex align-items-center">
                <span class="text-danger fw-bold">*</span><asp:Label runat="server" AssociatedControlID="ddlAccommodation"
                    CssClass="form-label me-3 mb-0">Accommodation Required</asp:Label>
                <asp:DropDownList ID="ddlAccommodation" runat="server" CssClass="form-control w-auto" ClientIDMode="Static">
                    <asp:ListItem Text="--Select an option--" Value="" Selected="True" Disabled="True" />
                    <asp:ListItem Text="Yes" Value="Yes" />
                    <asp:ListItem Text="No" Value="No" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvAccommodation" runat="server" ControlToValidate="ddlAccommodation"
                    InitialValue="" ErrorMessage="*"
                    CssClass="text-danger ms-3 fw-bold" Display="Dynamic" ValidationGroup="UserForm" SetFocusOnError="True" />
            </div>

            <!-- Arrival and Departure DateTime -->
            <div class="row mb-3">
                <div class="col-md-6 d-flex align-items-center">
                    <span class="text-danger fw-bold">*</span><asp:Label runat="server" CssClass="form-label me-3">Arrival at Guest House</asp:Label>
                    <asp:TextBox ID="txtArrivalDateTime" runat="server" CssClass="form-control datetimepicker w-50" placeholder="Select arrival date and time" />
                    <asp:RequiredFieldValidator ID="rfvArrivalDateTime" runat="server" ControlToValidate="txtArrivalDateTime" ErrorMessage="*"
                        CssClass="text-danger ms-3 fw-bold" Display="Dynamic"
                        ValidationGroup="UserForm" />
                </div>

                <div class="col-md-6 d-flex align-items-center">
                    <span class="text-danger fw-bold">*</span><asp:Label runat="server" CssClass="form-label me-3">Departure from Guest House</asp:Label>
                    <asp:TextBox ID="txtDepartureDateTime" runat="server" CssClass="form-control datetimepicker w-50" placeholder="Select departure date and time" />

                    <asp:RequiredFieldValidator ID="rfvDepartureDateTime" runat="server" ControlToValidate="txtDepartureDateTime"
                        CssClass="text-danger ms-3 fw-bold" ErrorMessage="*" Display="Dynamic" ValidationGroup="UserForm" />
                </div>
            </div>

            <!-- Transport -->
            <div class="section-header bg-custom-blue mb-3 p-2 text-white fw-bold">5. Transport</div>
            <div class="mb-3 d-flex align-items-center">
                <span class="text-danger fw-bold">*</span><asp:Label runat="server" AssociatedControlID="ddlOwnVehicle" CssClass="form-label me-3 mb-0">Have own vehicle for transport</asp:Label>
                <asp:DropDownList ID="ddlOwnVehicle" runat="server" CssClass="form-control w-auto" ClientIDMode="Static">
                    <asp:ListItem Text="--Select an option--" Value="" Selected="True" Disabled="True" />
                    <asp:ListItem Text="Yes" Value="Yes" />
                    <asp:ListItem Text="No" Value="No" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvOwnVehicle" runat="server" ControlToValidate="ddlOwnVehicle"
                    InitialValue="" ErrorMessage="*"
                    CssClass="text-danger ms-3 fw-bold" Display="Dynamic" ValidationGroup="UserForm" SetFocusOnError="True" />
            </div>

            <!-- Emergency Contact -->
            <div class="section-header bg-custom-blue mb-3 p-2 text-white fw-bold">6. Emergency Contact</div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtEmergencyName" runat="server" CssClass="form-label">Name</asp:Label>
                    <asp:TextBox ID="txtEmergencyName" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return isLetterKey(event)" />
                    <asp:RequiredFieldValidator ID="rfvEmergencyName" runat="server" ControlToValidate="txtEmergencyName"
                        CssClass="text-danger fw-bold" ErrorMessage="*"
                        ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                    <asp:RegularExpressionValidator ID="revEmergencyName" runat="server" ControlToValidate="txtEmergencyName"
                        CssClass="text-danger" ValidationExpression="^[A-Za-z\s'-]+$"
                        ErrorMessage="Name must contain only letters."
                        ValidationGroup="UserForm" Display="Dynamic" />
                </div>
                <div class="col-md-6">
                    <span class="text-danger fw-bold">*</span><asp:Label AssociatedControlID="txtEmergencyMobile" runat="server" CssClass="form-label">Mobile No.</asp:Label>
                    <asp:TextBox ID="txtEmergencyMobile" runat="server" CssClass="form-control" MaxLength="10" ClientIDMode="Static" onkeypress="return limitNumber(event)" />
                    <asp:RequiredFieldValidator ID="rfvEmergencyMobile" runat="server" ControlToValidate="txtEmergencyMobile"
                        CssClass="text-danger fw-bold" ErrorMessage="*"
                        ValidationGroup="UserForm" Display="Dynamic" SetFocusOnError="True" />
                    <asp:RegularExpressionValidator ID="revEmergencyMobile" runat="server" ControlToValidate="txtEmergencyMobile"
                        CssClass="text-danger" ValidationExpression="^[6-9]\d{9}$"
                        ErrorMessage="Enter a valid 10-digit mobile number starting with 6-9."
                        ValidationGroup="UserForm" Display="Dynamic" />
                </div>
            </div>

            <!-- Participation Certificate -->
            <div class="mb-3 d-flex align-items-center">
                <span class="text-danger fw-bold">*</span><asp:Label runat="server" CssClass="form-label me-3" AssociatedControlID="ddlParticipationCertificate">Participation Certificate Required</asp:Label>
                <asp:DropDownList ID="ddlParticipationCertificate" runat="server" CssClass="form-control w-auto" ClientIDMode="Static">
                    <asp:ListItem Text="--Select an option--" Value="" Selected="True" Disabled="True" />
                    <asp:ListItem Text="Yes" Value="Yes" />
                    <asp:ListItem Text="No" Value="No" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvParticipationCertificate" runat="server"
                    ControlToValidate="ddlParticipationCertificate" InitialValue=""
                    ErrorMessage="*"
                    CssClass="text-danger ms-3 fw-bold" Display="Dynamic" ValidationGroup="UserForm" SetFocusOnError="True" />
            </div>

            <!-- Submit Button -->
            <div class="text-center mt-4">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg"
                    ValidationGroup="UserForm" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>

    <!-- Bootstrap JS Bundle (Popper included) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            flatpickr(".datetimepicker", {
                enableTime: true,
                dateFormat: "Y-m-d H:i",
                time_24hr: true // change to true if you want 24-hour format
            });
        });

        function isNumberKey(evt) {
            var charCode = evt.which ? evt.which : evt.keyCode;
            // Allow only digits (0-9)
            if (charCode >= 48 && charCode <= 57) {
                return true;
            }
            // Allow control keys like backspace (8), delete (46), arrow keys (37-40)
            if (charCode === 8 || charCode === 46 || (charCode >= 37 && charCode <= 40)) {
                return true;
            }
            return false;
        }

        function isLetterKey(evt) {
            var charCode = evt.which ? evt.which : evt.keyCode;
            // Allow uppercase A-Z (65-90) and lowercase a-z (97-122)
            if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122)) {
                return true;
            }
            // Allow backspace (8), delete (46), left/right arrows (37,39), up/down arrows (38,40) .|| option - space char code - charCode === 32
            if (charCode === 8 || charCode === 46 || (charCode >= 37 && charCode <= 40 || charCode === 32)) {
                return true;
            }
            return false;
        }

        function preventOutOfRange(input) {
            let value = parseInt(input.value, 10);

            if (isNaN(value)) return;

            if (value < 18) input.value = 18;
            if (value > 99) input.value = 99;
        }

        function limitNumber(evt) {
            var charCode = evt.which || evt.keyCode;

            // Allow control keys: backspace(8), delete(46), arrows(37-40), tab(9)
            if (charCode === 8 || charCode === 46 || (charCode >= 37 && charCode <= 40) || charCode === 9) {
                return true;
            }

            var charTyped = String.fromCharCode(charCode);

            // Allow only digits 6,7,8,9
            if (/^[6-9]$/.test(charTyped)) {
                return true;
            }

            // Block everything else
            evt.preventDefault();
            return false;
        }

        window.onload = function () {
            var mobileInput = document.getElementById('<%= txtMobile.ClientID %>');
           if (mobileInput) {
               mobileInput.addEventListener('paste', function (e) {
                   var pasteData = (e.clipboardData || window.clipboardData).getData('text');
                   if (/[^6-9]/.test(pasteData)) {
                       e.preventDefault();
                   }
               });
           }
       };
    </script>
</body>
</html>
