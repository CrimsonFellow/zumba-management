<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zumba Management</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }

        h1 {
            color: #212529;
            margin-bottom: 30px;
            font-size: 2rem;
            font-weight: 600;
            text-align: center;
            border-bottom: 2px solid #dee2e6;
            padding-bottom: 15px;
        }

        h2 {
            color: #495057;
            font-size: 1.25rem;
            font-weight: 500;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin-bottom: 30px;
        }

        li {
            margin: 12px 0;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: 500;
            display: block;
            padding: 12px 20px;
            border: 1px solid #007bff;
            border-radius: 8px;
            transition: all 0.3s ease-in-out;
        }

        a:hover {
            background-color: #007bff;
            color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 123, 255, 0.2);
        }

        a:active {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        /* Media Query for Mobile Devices */
        @media (max-width: 500px) {
            .container {
                padding: 20px;
            }

            h1 {
                font-size: 1.75rem;
            }

            h2 {
                font-size: 1rem;
            }

            a {
                padding: 10px 16px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Zumba Management System</h1>
        <h2>Manage Students</h2>
        <ul>
            <li><a href="addStudent.jsp">Add Student</a></li>
            <li><a href="listStudents">List Students</a></li>
        </ul>
    </div>
</body>
</html>
