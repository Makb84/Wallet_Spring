<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<div class="card deposit-card">
                    
    <div class="card-body">
        <div class="form-group">
            <label for="">شماره حساب</label>
            <input type="text" name="account_number" class="form-control my-2" placeholder="شماره حساب">
        </div>
    </div>

    <div class="card-body">
        <!-- <div class="form-group">
            <label for="">ذینفع</label>
            <input type="text" name="account_name" class="form-control my-2" placeholder="نام ذینفع">
        </div> -->
        
        <div class="form-group mb-2">
            <label for="">مقدار</label>
            <input type="text" name="amount" class="form-control my-2" placeholder="مقدار">
        </div>

        <div class="form-group mb-2 text-center">
            <button id="transact-btn" class="btn btn-md" style="background-color: rgba(25, 152, 255, 0.536); width: 100px;">ثبت</button>
        </div>
        
    </div>

</div>