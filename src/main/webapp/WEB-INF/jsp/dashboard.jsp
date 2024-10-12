<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/fontawesome/css/all.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="js/bootstrap.bundle.js"></script>
    <title>Dashboard</title>
</head>
<body>
    
    <header class="main-page-header mb-3 bg-primary">
        
        <div class="container d-flex align-items-center" dir="rtl">
            <div class="company-name">
                ISC Wallet
            </div>

            <nav class="navigation">
                <li><a href=""> داشبورد </a></li>
                <li><a href=""> پرداخت‌ها </a></li>
                <li><a href=""> تراکنش‌ها </a></li>
            </nav>
            
            <div class="display-name text-white">
                <i class="fa fa-circle text-success me-2 shadow-sm"></i> خوش آمدید: MAKB
            </div>

            <a href="" class="btn btn-sm text-white ms-2">
                <i class="fa fa-sign-out-alt"></i> خروج
            </a>

        </div>

    </header>



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

                <div class="card withdrawal-card">

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

                <div class="card transfer-card">

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

            </div>
            <!-- offcanvas: transact body-->

    </div>
    <!-- Transact Offconvas: End-->



    <!-- Account form container: Start -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header">
            <h5 id="offcanvasRightLabel">حساب</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <!-- offcanvas: Account body-->
        <div class="offcanvas-body" dir="rtl">
            فرم حساب
        </div>
        <!-- offcanvas: Account body-->

    </div>
    <!-- Account form container: End -->



    <div class="container d-flex">

        <button id="add-account-btn" class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
            حساب جدید
        </button>

        <button id="transact-btn" class="btn btn-primary ms-auto" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
            تراکنش جدید
        </button>

    </div>



    <div class="container d-flex py-3" dir="rtl">
        <h2 class="me-auto">موجودی کلی حساب‌ها: </h2>
        <h2 class="ms-auto"> 0.00</h2>
    </div>



    <div class="container">
        <div class="accordion accordion-flush" id="accordionFlushExample">
            <div class="accordion-item">
              <h2 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                  Accordion Item #1
                </button>
              </h2>
              <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="flush-headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                  Accordion Item #2
                </button>
              </h2>
              <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="flush-headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                  Accordion Item #3
                </button>
              </h2>
              <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
              </div>
            </div>
          </div>
    </div>


    
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



<script src="js/main.js">

</script>



</body>
</html>