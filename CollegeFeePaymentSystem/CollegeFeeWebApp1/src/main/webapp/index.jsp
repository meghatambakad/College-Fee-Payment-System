<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>College Fee Payment System</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: white;
            padding: 50px 60px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
            width: 100%;
            max-width: 450px;
        }

        h1 {
            color: #34495e;
            margin-bottom: 30px;
            font-size: 28px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            margin: 20px 0;
        }

        ul li a {
            text-decoration: none;
            font-weight: 600;
            color: #fff;
            background-color: #2980b9;
            padding: 12px 25px;
            border-radius: 8px;
            display: inline-block;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        ul li a:hover {
            background-color: #3498db;
            transform: translateY(-3px);
            box-shadow: 0 8px 16px rgba(52, 152, 219, 0.4);
        }

        @media screen and (max-width: 480px) {
            .container {
                padding: 30px 20px;
            }

            h1 {
                font-size: 22px;
            }

            ul li a {
                padding: 10px 20px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Student Dashboard</h1>
        <ul>
            <li><a href="feepaymentadd.jsp">➕ Add Fee Payment</a></li>
            <li><a href="feepaymentdisplay.jsp">📋 View All Payments</a></li>
            <li><a href="report_form.jsp">📊 Generate Reports</a></li>
        </ul>
    </div>
</body>
</html>
