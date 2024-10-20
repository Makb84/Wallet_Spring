<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
        <link rel="stylesheet" href="../css/fontawesome/css/all.css">
        <link rel="stylesheet" href="../css/main.css">
        <script src="../js/bootstrap.bundle.js"></script>
        <title>Dashboard</title>
    </head>
<body>

<!-- Header -->
<c:import url="components/incl/header.jsp"/>

<div class="container mt-5" dir = "rtl">
    <h2>اطلاعات شخصی</h2>

    <form:form method="post" modelAttribute="user" class="mt-3">
        <div class="form-group">
            <label for="first_name">نام: </label>
            <form:input path="first_name" class="form-control" id="first_name"/>
            <form:errors path="first_name" cssClass="text-danger"/>
        </div>
        
        <div class="form-group">
            <label for="last_name">نام خانوادگی: </label>
            <form:input path="last_name" class="form-control" id="last_name"/>
            <form:errors path="last_name" cssClass="text-danger"/>
        </div>

        <div class="form-group">
            <label for="email">ایمیل: </label>
            <form:input path="email" class="form-control" id="email"/>
            <form:errors path="email" cssClass="text-danger"/>
        </div>

        <div class="form-group">
            <label for="phone_number">شماره موبایل: </label>
            <form:input path="phone_number" class="form-control" id="phone_number"/>
            <form:errors path="phone_number" cssClass="text-danger"/>
        </div>

        <div class="form-group">
            <label for="date_of_birth">تاریخ تولد: </label>
            <form:input path="date_of_birth" class="form-control" id="date_of_birth"/>
            <form:errors path="date_of_birth" cssClass="text-danger"/>
        </div>

        <div class="form-group">
            <label for="gender">جنسیت: </label>
            <form:input path="gender" class="form-control" id="gender"/>
            <form:errors path="gender" cssClass="text-danger"/>
        </div>
        <br>
        <div class="button-wrapper d-flex align-items-center justify-content-center">
            <button type="submit" class="btn btn-primary">بروزرسانی</button>
        </div>
    </form:form>
</div>

</body>
</html>
