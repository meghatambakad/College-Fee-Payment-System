<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.FeePaymentDAO, model.FeePayment" %>
<%
    String paymentIDStr = request.getParameter("paymentID");
    FeePayment payment = null;
    if (paymentIDStr != null && !paymentIDStr.trim().isEmpty()) {
        try {
            int paymentID = Integer.parseInt(paymentIDStr);
            FeePaymentDAO dao = new FeePaymentDAO();
            payment = dao.selectPayment(paymentID);
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error fetching payment details: " + e.getMessage() + "</p>");
        }
    }

    if (payment == null) {
%>
        <p style="color:red;">Invalid or missing payment ID.</p>
        <a href="feepaymentdisplay.jsp">Back to Payment List</a>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Fee Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f7f9fc;
            margin: 40px;
            color: #333;
        }
        h2 {
            color: #d9534f; /* Bootstrap Danger Red */
            text-align: center;
        }
        p {
            font-size: 18px;
            text-align: center;
        }
        strong {
            color: #d9534f;
        }
        form {
            text-align: center;
            margin-top: 30px;
        }
        input[type="submit"] {
            background-color: #d9534f;
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #c9302c;
        }
        a {
            display: block;
            margin: 25px auto;
            text-align: center;
            width: max-content;
            font-weight: 600;
            color: #0275d8;
            text-decoration: none;
            font-size: 16px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Delete Fee Payment</h2>
    <p>Are you sure you want to delete the payment record of 
        <strong><%= payment.getStudentName() %></strong> 
        with Payment ID 
        <strong><%= payment.getPaymentID() %></strong>?
    </p>
    
    <form action="DeleteFeePaymentServlet" method="get">
        <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>">
        <input type="submit" value="Confirm Delete">
    </form>

    <a href="feepaymentdisplay.jsp">Cancel and Back to Payment List</a>
</body>
</html>
