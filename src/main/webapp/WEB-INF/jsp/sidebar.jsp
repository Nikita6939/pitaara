<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="col-md-3 col-lg-2 bg-dark sidebar p-0" style="background:#291a6a!important">
                <div class="d-flex flex-column sticky-top vh-100">
                    <div class="sidebar-header p-3 text-white">
                        <h3 class="fs-4 text-center">
                            <img src="images/logo.png" style="height:100px;background:white">
                        </h3>
                        <hr>
                    </div>
                    <ul class="nav nav-pills flex-column mb-auto">
                       
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white" data-bs-toggle="tab" data-bs-target="#artists">
                                <i class="bi bi-people me-2"></i>
                                Dashboard
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white" data-bs-toggle="tab" data-bs-target="#settings">
                                <i class="bi bi-gear me-2"></i>
                                Settings
                            </a>
                        </li>
                    </ul>
                    <div class="sidebar-footer p-3 mt-auto border-top border-secondary">
                        <div class="d-flex align-items-center">
                            <div class="small text-white">
                                <span>Logged in as:</span><br>
                                <strong>Admin User</strong>
                            </div>
                            <div class="ms-auto">
                               
                                <a href="login"class="btn btn-sm btn-outline-danger" title="Logout">
                                    <i class="bi bi-box-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>