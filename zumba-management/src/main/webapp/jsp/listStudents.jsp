<%@ page import="java.util.List" %>
<%@ page import="com.funfit.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Students</title>
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
            max-width: 800px;
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

        .button-container {
            text-align: right;
            margin-bottom: 20px;
        }

        button, a {
            display: inline-block;
            text-align: center;
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
            padding: 8px 12px;
            border: 1px solid #007bff;
            border-radius: 8px;
            transition: all 0.3s ease-in-out;
            background-color: #fff;
            cursor: pointer;
        }

        button:hover, a:hover {
            background-color: #007bff;
            color: #ffffff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            text-align: left;
            padding: 12px 15px;
            border: 1px solid #dee2e6;
        }

        th {
            background-color: #007bff;
            color: #ffffff;
            font-weight: 500;
        }

        td {
            background-color: #f8f9fa;
            color: #495057;
        }

        /* Update and Delete Forms */
        .update-form, .delete-form {
            display: none;
            margin-top: 20px;
            padding: 20px;
            background-color: #f1f1f1;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .update-form h2, .delete-form h2 {
            margin-bottom: 20px;
            font-size: 1.5rem;
            color: #212529;
        }

        .update-form input[type="text"],
        .update-form input[type="email"],
        .update-form select,
        .delete-form input[type="number"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            font-size: 1rem;
            color: #495057;
            width: 100%;
            box-sizing: border-box;
            transition: border-color 0.3s ease-in-out;
        }

        .update-form input[type="text"]:focus,
        .update-form input[type="email"]:focus,
        .update-form select:focus,
        .delete-form input[type="number"]:focus {
            border-color: #007bff;
            outline: none;
        }

        .update-form input[type="submit"],
        .delete-form input[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .update-form input[type="submit"]:hover,
        .delete-form input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Mobile Responsive */
        @media (max-width: 800px) {
            .container {
                padding: 20px;
            }

            h1 {
                font-size: 1.75rem;
            }

            th, td {
                font-size: 0.9rem;
                padding: 10px 12px;
            }

            button, a {
                font-size: 0.9rem;
                padding: 8px 16px;
            }
        }
    </style>
    <script>
        function showUpdateForm(id, name, email, batchId) {
            document.getElementById('updateId').value = id;
            document.getElementById('updateName').value = name;
            document.getElementById('updateEmail').value = email;
            document.getElementById('updateBatchId').value = batchId;
            document.querySelector('.update-form').style.display = 'block';
            document.querySelector('.delete-form').style.display = 'none';
        }

        function showDeleteForm(id) {
            document.getElementById('deleteId').value = id;
            document.querySelector('.delete-form').style.display = 'block';
            document.querySelector('.update-form').style.display = 'none';
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>List of Students</h1>

        <!-- Add Student Button -->
        <div class="button-container">
            <a href="addStudent.jsp">Add Student</a>
        </div>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Batch</th>
                <th>Actions</th>
            </tr>
            <%
                // Assuming 'students' is a List<Student> passed as a request attribute from the servlet
                List<Student> students = (List<Student>) request.getAttribute("students");
                if (students != null) {
                    for (Student student : students) {
                        String batchName = "";
                        switch (student.getBatchId()) {
                            case 1:
                                batchName = "Morning Batch";
                                break;
                            case 2:
                                batchName = "Evening Batch";
                                break;
                            default:
                                batchName = "Unknown Batch";
                                break;
                        }
            %>
            <tr>
                <td><%= student.getId() %></td>
                <td><%= student.getName() %></td>
                <td><%= student.getEmail() %></td>
                <td><%= batchName %></td>
                <td>
                    <button onclick="showUpdateForm('<%= student.getId() %>', '<%= student.getName() %>', '<%= student.getEmail() %>', '<%= student.getBatchId() %>')">Update</button>
                    <button onclick="showDeleteForm('<%= student.getId() %>')">Delete</button>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5">No students available</td>
            </tr>
            <%
                }
            %>
        </table>
        <a href="index.jsp">Go Back</a>
        
        <!-- Update Student Form -->
        <div class="update-form">
            <h2>Update Student</h2>
            <form action="updateStudent" method="post">
                <input type="hidden" id="updateId" name="id" required>
                
                <label for="updateName">Name:</label>
                <input type="text" id="updateName" name="name" required>
                
                <label for="updateEmail">Email:</label>
                <input type="email" id="updateEmail" name="email" required>
                
                <label for="updateBatchId">Batch:</label>
                <select id="updateBatchId" name="batchId" required>
                    <option value="1">Morning Batch</option>
                    <option value="2">Evening Batch</option>
                </select>
                
                <input type="submit" value="Update Student">
            </form>
        </div>

        <!-- Delete Student Form -->
        <div class="delete-form">
            <h2>Delete Student</h2>
            <form action="deleteStudent" method="post">
                <input type="hidden" id="deleteId" name="id" required>
                <p>Are you sure you want to delete this student?</p>
                <input type="submit" value="Delete Student">
            </form>
        </div>
    </div>
</body>
</html>


