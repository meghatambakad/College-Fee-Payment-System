<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
         import="java.util.List, java.util.ArrayList, java.text.SimpleDateFormat, model.FeePayment" %>

<%
    // Get the report results list from request attribute
    List<FeePayment> reportResults = (List<FeePayment>) request.getAttribute("reportResults");

    // If null, initialize an empty list to avoid errors
    if (reportResults == null) {
        reportResults = new ArrayList<FeePayment>();
    }

    // Date formatter to display dates properly
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Report Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f8fb;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 900px;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links a {
            margin: 0 10px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        .links a:hover {
            text-decoration: underline;
        }

        .no-records {
            text-align: center;
            font-style: italic;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Report Results</h2>

        <table>
            <thead>
                <tr>
                    <th>Payment ID</th>
                    <th>Student ID</th>
                    <th>Student Name</th>
                    <th>Payment Date</th>
                    <th>Amount</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (reportResults.isEmpty()) {
                %>
                    <tr>
                        <td colspan="6" class="no-records">No records found for the selected criteria.</td>
                    </tr>
                <%
                    } else {
                        for (FeePayment fee : reportResults) {
                %>
                    <tr>
                        <td><%= fee.getPaymentID() %></td>
                        <td><%= fee.getStudentID() %></td>
                        <td><%= fee.getStudentName() %></td>
                        <td><%= sdf.format(fee.getPaymentDate()) %></td>
                        <td><%= fee.getAmount() %></td>
                        <td><%= fee.getStatus() %></td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <div class="links">
            <a href="report_form.jsp">Back to Report Criteria</a> |
            <a href="index.jsp">Back to Home</a>
        </div>
    </div>
</body>
</html>
