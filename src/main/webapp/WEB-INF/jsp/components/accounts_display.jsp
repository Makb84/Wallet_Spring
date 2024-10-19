<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

    <div class="container d-flex">

      <button id="add-account-btn" class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
          ولت جدید
      </button>

      <button id="transact-btn" class="btn btn-primary ms-auto" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
          تراکنش جدید
      </button>

  </div>



  <div class="container d-flex py-3" dir="rtl">
      <h2 class="me-auto">موجودی کلی حساب‌ها: </h2>
        <h2 class="ms-auto">
          <c:if test="${totalBalance != null}">
            <c:out value="${totalBalance}"/>
          </c:if>
        </h2>
  </div>



  <div class="container" dir="rtl">
    <hr>
    <br>
    <!-- Accordion Menu / Drop Down -->
    <h2 class="text-center">لیست ولت‌ها</h2>
    <br>
    <c:if test="${userAccounts != null }">

     <c:forEach items="${userAccounts}" var="account">

    <div class="accordion accordion-flush" id="accordionFlushExample" dir="ltr">
        <div class="accordion-item">
          <h2 class="accordion-header" id="flush-headingOne">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-${account.account_id}" aria-expanded="false" aria-controls="flush-collapseOne">
              ${account.account_name}
            </button>
          </h2>
          <div id="flush-${account.account_id}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
            <div class="accordion-body">
                <!-- Account Details List -->
                <ul class="list-group list-group-flush">
                    <li class="list-group-item d-flex">نام حساب <span class="ms-auto"><b>${account.account_name}</b></span></li>
                    <li class="list-group-item d-flex">شماره حساب <span class="ms-auto"><b>${account.account_number}</b></span></li>
                    <li class="list-group-item d-flex">نوع حساب <span class="ms-auto"><b>${account.account_type}</b></span></li>
                    <li class="list-group-item d-flex">موجودی <span class="ms-auto"><b>${account.balance}</b></span></li>
                    <!-- <li class="list-group-item d-flex">تاریخ ایجاد <span class="ms-auto"><b>${account.created_at}</b></span></li> -->
                </ul>
                <!-- Account Details List -->
            </div>
          </div>
        </div>
      </div>
     </c:forEach>

    </c:if>
    <!-- End Of Accordion Menu / Drop Down -->
</div>
<!-- End Of Container: Accordion Menu / Drop Down -->
