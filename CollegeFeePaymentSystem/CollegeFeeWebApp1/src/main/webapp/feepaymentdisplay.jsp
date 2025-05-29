<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.FeePayment, dao.FeePaymentDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fee Payments List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            margin: 20px;
            color: #333;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
            font-weight: 600;
        }
        tr:hover {
            background-color: #f1faff;
        }
        a, input[type="submit"] {
            cursor: pointer;
            text-decoration: none;
            border: none;
            padding: 8px 16px;
            margin: 0 4px;
            border-radius: 5px;
            font-weight: 600;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }
        a {
            background-color: #28a745;
            color: white;
        }
        a:hover {
            background-color: #218838;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        form {
            display: inline;
        }
        .action-buttons input[type="submit"] {
            padding: 6px 12px;
            font-size: 13px;
            margin: 0 2px;
        }
        .no-records {
            text-align: center;
            font-style: italic;
            padding: 20px 0;
            color: #666;
        }
        .add-new {
            display: block;
            max-width: 200px;
            margin: 25px auto 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Fee Payments</h2>
    <table>
        <thead>
            <tr>
                <th>Payment ID</th>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Payment Date</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            FeePaymentDAO dao = new FeePaymentDAO();
            List<FeePayment> payments = dao.selectAllPayments();
            if (payments != null && !payments.isEmpty()) {
                for (FeePayment payment : payments) {
        %>
            <tr>
                <td><%= payment.getPaymentID() %></td>
                <td><%= payment.getStudentID() %></td>
                <td><%= payment.getStudentName() %></td>
                <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(payment.getPaymentDate()) %></td>
                <td><%= payment.getAmount() %></td>
                <td><%= payment.getStatus() %></td>
                <td class="action-buttons">
                    <form action="updatefee.jsp" method="get">
                        <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>">
                        <input type="submit" value="Edit">
                    </form>
                    <form action="feepaymentdelete.jsp" method="get" onsubmit="return confirm('Are you sure you want to delete this payment?');">
                        <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="7" class="no-records">No payments found.</td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <a class="add-new" href="addfee.jsp">+ Add New Payment</a>
</body>
</html>
