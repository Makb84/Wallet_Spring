<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="https://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/fontawesome/css/all.css">
    <title>Register</title>
</head>
<body class="d-flex align-items-center justify-content-center">

    <!-- Card: register -->
    <div class="card registration-form-card col-5 bg-transparent border-0">

        <!-- Card body-->
        <div class="card-body">

            <h1 class="form-header card-title text-center">
                ثبت نام <i class="fa fa-edit"></i>
            </h1>
            <br>

            <form:form action="/register" class="reg-form" modelAttribute = "registerUser">

                <div class="row">
                    
                    <div class="form-group col">
                        <form:input type="text" path="last_name" class="form-control text-center" placeholder="نام خانوادگی">
                        <form:errors path="last_name" class="text-white bg-danger"/>
                    </div>

                    <div class="form-group col">
                        <form:input type="text" path="first_name" class="form-control text-center" placeholder="نام">
                        <form:errors path="first_name" class="text-white bg-danger"/>
                    </div>
                    
                </div>
                

                <div class="row">

                    <div class="form-group col">
                        <form:input type="email" path="email" class="form-control text-center" placeholder="ایمیل">
                        <form:errors path="email" class="text-white bg-danger"/>
                    </div>

                </div>


                <div class="row">
                    
                    <div class="form-group col">
                        <form:input type="password" path="password" class="form-control text-center" placeholder="تایید رمز عبور">
                        <form:errors path="password" class="text-white bg-danger"/>
                    </div>

                    <div class="form-group col">
                        <form:input type="password" name="confirm_password" class="form-control text-center" placeholder="رمز عبور">
                        <small class="text-white bg-danger">${confirm_pass}</small>
                    </div>
                    
                </div>

                <br>

                <div class="row text-center">

                    <div class="form-group col">
                        <button class="btn btn-md text-center">ثبت</button>
                    </div>

                </div>

            </form:form>

            <br>

            <p class="text-center">
                در صورتی که حساب دارید وارد شوید: <span class="ms-2 text-primary btn-lg"><a href="/login">ورود</a></span>
            </p>

            <br>
            <br>

            <small class="text-primary">
                <i class="fa fa-arrow-alt-circle-left me-2"></i><a href="/" class="btn btn-sm text-primary">بازگشت</a>
            </small>

        </div>
        <!-- Card body-->

    </div>
    <!-- Card: register -->
    
</body>
</html>