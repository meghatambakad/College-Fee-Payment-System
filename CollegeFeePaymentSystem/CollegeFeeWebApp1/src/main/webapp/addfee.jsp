<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Fee Payment</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9fafd;
            margin: 40px;
            color: #333;
        }
        h2 {
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }
        form {
            background-color: #ffffff;
            max-width: 450px;
            margin: 0 auto;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            margin-top: 15px;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }
        input[type="submit"] {
            margin-top: 25px;
            width: 100%;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 18px;
            padding: 12px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        /* Optional: add a little spacing at bottom */
        body > form + * {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Add New Fee Payment</h2>
    <form action="AddFeePaymentServlet" method="post">
        <label for="studentID">Student ID:</label>
        <input type="number" id="studentID" name="studentID" required>

        <label for="studentName">Student Name:</label>
        <input type="text" id="studentName" name="studentName" required>

        <label for="paymentDate">Payment Date:</label>
        <input type="date" id="paymentDate" name="paymentDate" required>

        <label for="amount">Amount:</label>
        <input type="number" step="0.01" id="amount" name="amount" required>

        <label for="status">Status:</label>
        <select id="status" name="status" required>
            <option value="Paid">Paid</option>
            <option value="Pending">Pending</option>
            <option value="Overdue">Overdue</option>
        </select>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
