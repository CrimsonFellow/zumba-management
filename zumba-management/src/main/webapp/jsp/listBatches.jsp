<%@ page import="java.util.List" %>
<%@ page import="com.funfit.model.Batch" %>
<!DOCTYPE html>
<html>
<head>
    <title>List of Batches</title>
</head>
<body>
    <h1>List of Batches</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Time Slot</th>
        </tr>
        <%
            // Assuming 'batches' is a List<Batch> passed as a request attribute from the servlet
            List<Batch> batches = (List<Batch>) request.getAttribute("batches");
            if (batches != null) {
                for (Batch batch : batches) {
        %>
            <tr>
                <td><%= batch.getId() %></td>
                <td><%= batch.getName() %></td>
                <td><%= batch.getTimeSlot() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="3">No batches available</td>
            </tr>
        <%
            }
        %>
    </table>
    <a href="index.jsp">Go Back</a>
</body>
</html>
