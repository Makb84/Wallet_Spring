<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
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


    <!-- Transact Offcanvas: pulls from the left -->
    <c:import url="components/transact_offcanvas.jsp"/>

    <!-- Add Accounts Offcanvas: pulls from the right -->
    <c:import url="components/add_account_offcanvas.jsp"/>

    <!-- Container -->
    <div class="container">

            <!-- Display Message -->
            <c:if test="${success != null}">
                <div class="alert alert-info text-center border border-info">
                    <b>${success}</b>
                </div>
            </c:if>
            <!-- End Of Display Message -->

            <!-- Display Message -->
            <c:if test="${error!= null}">
                <div class="alert alert-danger text-center border border-danger">
                    <b>${error}</b>
                </div>
            </c:if>
            <!-- End Of Display Message -->
    </div>
    <!-- End Of Container-->

    
            <!-- Display Accounts --->
            <c:import url="components/accounts_display.jsp"/>



    <!-- Footer -->
   <c:import url="components/incl/footer.jsp"/>





    

    
    