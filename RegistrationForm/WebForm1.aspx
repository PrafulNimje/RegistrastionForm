<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="RegistrationForm.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Date and Time Picker</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            padding: 40px;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            max-width: 500px;
            margin: auto;
        }

        label {
            font-size: 18px;
            color: #333;
            display: block;
            margin-bottom: 10px;
        }

        input[type="datetime-local"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        input[type="datetime-local"]:focus {
            border-color: #007bff;
            outline: none;
        }

        .datetime-display {
            margin-top: 25px;
            font-size: 18px;
            color: #007bff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <label for="dateTimeInput">Select Date & Time (24hr):</label>
            <input type="datetime-local" id="dateTimeInput" name="dateTimeInput" runat="server" />

            <div class="datetime-display">
                <asp:Label ID="lblCurrentDateTime" runat="server" Text="Current DateTime: " />
                <asp:Label ID="lblDateTime" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>
