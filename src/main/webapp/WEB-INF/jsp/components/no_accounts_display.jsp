<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

    <div class="container">
        <div class="card no-accounts-card">
            <div class="card-body" dir="rtl">

                <h1 class="card-title">
                    <i class="fas fa-ban text-danger"></i>حساب رجیستر نشده
                </h1>

                <hr>
                
                <div class="card-text">
                    شما در حال حاضر حساب رجیستر شده‌ای ندارید. <br>
                    برای ساخت حساب روی لینک کلیک کنید
                </div>
                <br>

                <button id="add-account-btn" class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                    حساب جدید
                </button>

            </div>
        </div>
    </div>