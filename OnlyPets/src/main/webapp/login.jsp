<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Pet Adoption</title>
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
    <link href="./css/main.css" rel="stylesheet" />
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <% String error = request.getParameter("error"); %>
        <% if ("1".equals(error)) { %>
            <p style="color:red;">Invalid email or password!</p>
        <% } %>
        <form action="loginHandler" method="post">
            <label for="email">Email:</label><br/>
            <input type="email" id="email" name="email" required /><br/><br/>
            
            <label for="password">Password:</label><br/>
            <input type="password" id="password" name="password" required /><br/><br/>
            
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
