<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Reports</title>
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
            width: 400px;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        select, input[type="date"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
            text-align: center;
        }
    </style>

    <script>
        function toggleDateRange() {
            var reportType = document.getElementById("reportType").value;
            var dateRangeDiv = document.getElementById("dateRange");

            if (reportType === "dateRange") {
                dateRangeDiv.style.display = "block";
            } else {
                dateRangeDiv.style.display = "none";
                document.getElementById("fromDate").value = "";
                document.getElementById("toDate").value = "";
            }
        }

        window.onload = function () {
            toggleDateRange(); // Run on page load
        };
    </script>
</head>
<body>
    <div class="container">
        <h2>Generate Reports</h2>

        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <p class="error"><%= errorMessage %></p>
        <%
            }
        %>

        <form action="ReportServlet" method="get">
            <label for="reportType">Select Report Type:</label>
            <select name="reportType" id="reportType" onchange="toggleDateRange()" required>
                <option value="">-- Select --</option>
                <option value="overdue" <%= "overdue".equals(request.getParameter("reportType")) ? "selected" : "" %>>Students with Overdue Payments</option>
                <option value="dateRange" <%= "dateRange".equals(request.getParameter("reportType")) ? "selected" : "" %>>Payments within Date Range</option>
            </select>

            <div id="dateRange" style="display: none;">
                <label for="fromDate">From Date:</label>
                <input type="date" id="fromDate" name="fromDate"
                    value="<%= request.getParameter("fromDate") != null ? request.getParameter("fromDate") : "" %>">

                <label for="toDate">To Date:</label>
                <input type="date" id="toDate" name="toDate"
                    value="<%= request.getParameter("toDate") != null ? request.getParameter("toDate") : "" %>">
            </div>

            <input type="submit" value="Generate Report">
        </form>

        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
