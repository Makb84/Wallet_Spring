<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!-- Right Side Offcanvas: Accounts Form Container -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header">
            <h5 id="offcanvasRightLabel" class="text-white">ساخت ولت جدید</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <!-- Offcanvas Body: Accounts Form Wrapper -->
        <div class="offcanvas-body">
            <!-- Card: Accounts Form Card  -->
            <div class="card">
                <!-- Card Body -->
                <div class="card-body">
                    <form action="/account/create_account"  method="POST" class="add-account-form">
                        <!-- Form Group -->
                        <div class="form-group mb-3">
                            <label for=""> اسم ولت </label>
                            <input type="text" name="account_name" class="form-control" placeholder="اسم ولت">
                        </div>
                        <!-- End Of Form Group -->
                        <!-- Form Group -->
                        <div class="form-group mb-3">
                            <label for=""> انتخاب نوع ولت </label>
                            <select name="account_type" class="form-control" id="">
                                <option value="">-- انتخاب نوع ولت --</option>
                                <option value="check">چک</option>
                                <option value="savings">پس انداز</option>
                                <option value="business">بیزینس</option>
                            </select>
                        </div>
                        <!-- End Of Form Group -->

                        <!-- Form Group -->
                        <div class="form-group my-2">
                            <button id="" class="btn btn-md transact-btn">افزودن</button>
                        </div>
                        <!-- End Of Form Group -->

                    </form>
                </div>
                <!-- End Of Card Body -->
            </div>
            <!-- End Card: Accounts Form Card  -->
        </div>
        <!-- End Of Offcanvas Body: Accounts Form Wrapper -->
    </div>
    <!-- End Of Right Side Offcanvas: Accounts Form Container -->