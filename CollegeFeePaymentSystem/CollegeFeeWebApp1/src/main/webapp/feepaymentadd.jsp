<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Fee Payment</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f7f8;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }
        .container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
            font-weight: 700;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555;
        }
        input[type="text"], 
        input[type="number"], 
        input[type="date"], 
        select {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1.5px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus,
        select:focus {
            border-color: #007BFF;
            outline: none;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #007BFF;
            border: none;
            padding: 12px;
            font-size: 18px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 700;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007BFF;
            text-decoration: none;
            font-weight: 600;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Fee Payment</h2>
        <form action="AddFeePaymentServlet" method="post">
            <label for="studentID">Student ID:</label>
            <input type="number" id="studentID" name="studentID" required>

            <label for="studentName">Student Name:</label>
            <input type="text" id="studentName" name="studentName" required>

            <label for="paymentDate">Payment Date:</label>
            <input type="date" id="paymentDate" name="paymentDate" required>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" step="0.01" name="amount" required>

            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="Paid">Paid</option>
                <option value="Overdue">Overdue</option>
            </select>

            <input type="submit" value="Submit">
        </form>
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
