<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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

    <!-- Card: login -->
    <div class="card login-form-card col-5 bg-transparent border-0">

        <!-- Card body-->
        <div class="card-body">

            <h1 class="form-header card-title text-center">
                ورود <i class="fa fa-user-circle"></i>
            </h1>
            <br>

            <form action="/login" method="POST" class="login-form">
                
                <div class="row">

                    <div class="form-group col">
                        <input type="email" name="email" class="form-control text-center" placeholder="ایمیل">
                    </div>

                </div>


                <div class="row">

                    <div class="form-group col">
                        <input type="password" name="password" class="form-control text-center" placeholder="رمز عبور">
                    </div>
                    
                </div>

                <!-- From Group -->
                <div class="form-group col">
                    <input type="hidden" name="_token" value="${token}"/>
                </div>
                <!-- End Of From Group -->

                <br>

                <div class="row text-center">

                    <div class="form-group col">
                        <button class="btn btn-md text-center" style="background-color: lightgreen;">ورود</button>
                    </div>

                </div>

            </form>

            <br>

            <p class="text-center">
                اگر کاربر جدید هستید: <span class="ms-2 text-primary btn-lg"><a href="/register">ثبت نام</a></span>
            </p>

            <br>
            <br>

            <small class="text-primary">
                <i class="fa fa-arrow-alt-circle-left me-2"></i><a href="/" class="btn btn-sm text-primary">بازگشت</a>
            </small>

        </div>
        <!-- Card body-->

    </div>
    <!-- Card: login -->
    
</body>
</html>