using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RegistrationForm
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Constr"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand("dbo.InsertRegistrationAppl", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Add all parameters from your form controls
                    cmd.Parameters.AddWithValue("@ApplicationID", 1001); // Adjust as needed or generate dynamically
                    cmd.Parameters.AddWithValue("@Prefix", ddlPrefix.SelectedValue);
                    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Surname", txtSurname.Text.Trim());
                    cmd.Parameters.AddWithValue("@Age", int.Parse(txtAge.Text.Trim()));

                    cmd.Parameters.AddWithValue("@InstituteNameAddress", txtInstitute.Text.Trim());
                    cmd.Parameters.AddWithValue("@PlaceInst", txtPlaceInst.Text.Trim());
                    cmd.Parameters.AddWithValue("@TalukaInst", txtTalukaInst.Text.Trim());
                    cmd.Parameters.AddWithValue("@DistrictInst", txtDistrictInst.Text.Trim());
                    cmd.Parameters.AddWithValue("@PincodeInst", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text.Trim());

                    cmd.Parameters.AddWithValue("@CorrAddress", txtCorrAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@PlaceCorr", txtPlaceCorr.Text.Trim());
                    cmd.Parameters.AddWithValue("@TalukaCorr", txtTalukaCorr.Text.Trim());
                    cmd.Parameters.AddWithValue("@DistrictCorr", txtDistrictCorr.Text.Trim());
                    cmd.Parameters.AddWithValue("@PincodeCorr", txtPincode.Text.Trim());

                    cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                    cmd.Parameters.AddWithValue("@AccommodationRequired", ddlAccommodation.SelectedValue);
                    cmd.Parameters.AddWithValue("@ArrivalDateTime", DateTime.Parse(txtArrivalDateTime.Text.Trim()));
                    cmd.Parameters.AddWithValue("@DepartureDateTime", DateTime.Parse(txtDepartureDateTime.Text.Trim()));

                    cmd.Parameters.AddWithValue("@OwnVehicle", ddlOwnVehicle.SelectedValue);

                    cmd.Parameters.AddWithValue("@EmergencyName", txtEmergencyName.Text.Trim());
                    cmd.Parameters.AddWithValue("@EmergencyMobile", txtEmergencyMobile.Text.Trim());

                    cmd.Parameters.AddWithValue("@ParticipationCertificateRequired", ddlParticipationCertificate.SelectedValue);

                    try
                    {
                        conn.Open();

                        // Execute SP and get new Application ID
                        object result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            long newApplicationId = Convert.ToInt64(result);
                            string message = "Registration successful! Your Application ID is " + newApplicationId + ".";

                            // JavaScript: alert then clear all form fields
                            string script = $@"
                                alert('{message.Replace("'", "\\'")}');
                                var form = document.getElementById('{form1.ClientID}');
                                if(form) {{
                                    // Clear text inputs, number, email, textareas
                                    var inputs = form.querySelectorAll('input[type=text], input[type=number], input[type=email], textarea');
                                    inputs.forEach(function(input) {{
                                        input.value = '';
                                    }});
                                    // Reset dropdowns
                                    var selects = form.querySelectorAll('select');
                                    selects.forEach(function(select) {{
                                        select.selectedIndex = 0;
                                    }});
                                }}
                            ";

                            ClientScript.RegisterStartupScript(this.GetType(), "SuccessAlertAndClear", script, true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "SuccessAlert", "alert('Registration successful!');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        string errorScript = "alert('Error: " + ex.Message.Replace("'", "\\'") + "');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", errorScript, true);
                    }
                    conn.Close();
                }
            }
        }
    }
}
