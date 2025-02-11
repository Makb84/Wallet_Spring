<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

    <header class="main-page-header mb-3 bg-primary">
        
        <div class="container d-flex align-items-center" dir="rtl">
            <div class="company-name">
                ISC Wallet
            </div>

            <nav class="navigation">
                <li><a href="/app/dashboard"> داشبورد </a></li>
                <li><a href="/app/edit_profile"> پروفایل </a></li>
                <!-- <li><a href=""> پرداخت‌ها </a></li> -->
                <li><a href="/app/transact_history"> تراکنش‌ها </a></li>
            </nav>
            
            <div class="display-name text-white">
                <i class="fa fa-circle text-success me-2 shadow-sm"></i> خوش آمدید: ${user.first_name}  ${user.last_name} 
            </div>

            <a href="/logout" class="btn btn-sm text-white ms-2">
                <i class="fa fa-sign-out-alt"></i> خروج
            </a>

        </div>

    </header>

