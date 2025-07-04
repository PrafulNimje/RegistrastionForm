using System;

namespace YourNamespace.Models
{
    public class RegistrationApplication
    {
        public long A_Id { get; set; }  // Auto-incremented primary key, usually not set manually

        public long ApplicationID { get; set; }

        // 1. Personal Details
        public string Prefix { get; set; }
        public string FirstName { get; set; }
        public string Surname { get; set; }
        public int Age { get; set; }

        // 2. Institute Information
        public string InstituteNameAddress { get; set; }
        public string PlaceInst { get; set; }
        public string TalukaInst { get; set; }
        public string DistrictInst { get; set; }
        public string PincodeInst { get; set; }
        public string Designation { get; set; }

        // 3. Correspondence Address
        public string CorrAddress { get; set; }
        public string PlaceCorr { get; set; }
        public string TalukaCorr { get; set; }
        public string DistrictCorr { get; set; }
        public string PincodeCorr { get; set; }

        // 4. Contact Details
        public string MobileNo { get; set; }
        public string Email { get; set; }

        // 5. Accommodation Details
        public string AccommodationRequired { get; set; }  // e.g. "Yes" or "No"

        // 6. Arrival and Departure DateTime
        public DateTime ArrivalDateTime { get; set; }
        public DateTime DepartureDateTime { get; set; }

        // 7. Transport
        public string OwnVehicle { get; set; }  // e.g. "Yes" or "No"

        // 8. Emergency Contact
        public string EmergencyName { get; set; }
        public string EmergencyMobile { get; set; }

        // 9. Participation Certificate
        public string ParticipationCertificateRequired { get; set; }  // e.g. "Yes" or "No"

        // Optional: Timestamp for record creation
        public DateTime CreatedOn { get; set; }
    }
}
