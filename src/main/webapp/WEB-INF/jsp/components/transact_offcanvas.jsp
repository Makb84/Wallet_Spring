<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>


    <!-- Transact Offconvas: Start-->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasExampleLabel">تراکنش</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

            <!-- offcanvas: transact body-->
            <div class="offcanvas-body" dir="rtl">

                <small class="card-text">
                    لطفا نوع تراکنش را انتخاب کنید:
                </small>
                
                <select name="transact-type" class="form-control my-2" id="transact-type">
                    <option value="">-- انتخاب نوع تراکنش --</option>
                    <option value="deposit"> واریز </option>
                    <option value="withdraw"> برداشت </option>
                    <option value="transfer"> انتقال </option>
                </select>

                <!-- Payments Form Card -->
                <c:import url="components/transact_forms/payment_form.jsp"/>
                <!-- Transfer Form Card -->
                <c:import url="components/transact_forms/transfer_form.jsp"/>
                <!-- Deposit Form Card -->
                <c:import url="components/transact_forms/deposit_form.jsp"/>
                <!-- Withdraw Form Card -->
                <c:import url="components/transact_forms/withdraw_form.jsp"/>



            </div>
            <!-- offcanvas: transact body-->

    </div>
    <!-- Transact Offconvas: End-->
