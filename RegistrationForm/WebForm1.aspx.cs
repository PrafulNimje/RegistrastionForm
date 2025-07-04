using System;

namespace RegistrationForm
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Display current date and time in 24-hour format
                lblDateTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm");

                // Optional: Set default value for input (in required format for datetime-local)
                dateTimeInput.Value = DateTime.Now.ToString("yyyy-MM-ddTHH:mm");
            }
        }
    }
}
