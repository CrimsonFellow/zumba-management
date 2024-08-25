<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
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
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h1 {
            color: #212529;
            margin-bottom: 20px;
            font-size: 2rem;
            font-weight: 600;
            text-align: center;
            border-bottom: 2px solid #dee2e6;
            padding-bottom: 15px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            font-weight: 500;
            color: #495057;
        }

        input[type="text"],
        input[type="email"],
        select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            font-size: 1rem;
            color: #495057;
            transition: border-color 0.3s ease-in-out;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease-in-out;
        }

        a:hover {
            color: #0056b3;
        }

        /* Mobile Responsive */
        @media (max-width: 400px) {
            .container {
                padding: 20px;
            }

            h1 {
                font-size: 1.75rem;
            }

            input[type="text"],
            input[type="email"],
            select {
                font-size: 0.9rem;
            }

            input[type="submit"] {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Student</h1>
        <form action="addStudent" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="batchId">Batch:</label>
            <select id="batchId" name="batchId" required>
                <option value="1">Morning Batch</option>
                <option value="2">Evening Batch</option>
            </select>
            
            <input type="submit" value="Add Student">
        </form>
        <a href="index.jsp">Go Back</a>
    </div>
</body>
</html>

