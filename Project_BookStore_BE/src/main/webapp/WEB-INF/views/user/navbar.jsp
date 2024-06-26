<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Trang chủ</title>
				<link rel="icon" type="images/x-icon" href="https://www.w3docs.com/favicon.ico" />
			</head>

			<body>
				<!-- Topbar Start -->
				<div class="container-fluid">



					<div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
						<div class="col-lg-4 d-flex " style="    font-family: 'DM Sans';">
							<span>
								<img style="margin-bottom: 2px;" width="40"
									src="https://websitedemos.net/plant-store-02/wp-content/uploads/sites/410/2020/06/plants-store-logo-green.svg"
									alt="">

							</span>
							<a href="/index" class="text-decoration-none" style="font-family: 'Roboto';">

								<span class=" h2 text-uppercase text-dark  pl-1">BOOK</span>
								<span style="color: orange;" class=" h2 text-uppercase ">STORE</span>

							</a>
						</div>
						<div class="col-lg-4 col-6 text-left">
							<!-- <form action="">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Tìm kiếm">
									<div class="input-group-append">
										<button class="input-group-text bg-transparent ">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</form> -->
						</div>
						<div class="col-lg-4 col-6 text-right">
							<p class="m-0">Dịch Vụ Tư Vấn</p>
							<h5 class="m-0">0814528145</h5>
						</div>
					</div>
				</div>
				<!-- Topbar End -->


				<!-- Navbar Start -->
				<div class="container-fluid bg-dark mb-30">
					<div class="row px-xl-5">
						<div class="">
							<a class="btn d-flex align-items-center justify-content-between bg-warning w-100"
								data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
								<h6 class="text-white m-0">
									<i class=""></i>Danh Sách
								</h6> <i class=""></i>
							</a>
							<nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
								id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
								<div class="navbar-nav w-100">
									<c:forEach var="item" items="${procate}">
										<a href="" class="nav-item nav-link">${item.group.name}</a>
									</c:forEach>
								</div>
							</nav>
						</div>
						<div class="col-lg-9">
							<nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
								<a href="" class="text-decoration-none d-block d-lg-none"> <span
										class="h1 text-uppercase text-dark bg-light px-2">Book</span> <span
										class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
								</a>
								<button type="button" class="navbar-toggler" data-toggle="collapse"
									data-target="#navbarCollapse">
									<span class="navbar-toggler-icon"></span>
								</button>
								<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
									<div class="navbar-nav mr-auto py-0">
										<a href="/index" class="nav-item nav-link active text-warning">Trang chủ</a>
										<a href="/404page" class="nav-item nav-link">Blogs</a> <a href="/404page"
											class="nav-item nav-link">Liên hệ</a>
										<%-- <c:if test="${empty sessionScope.username}">

											</c:if> --%>
											<%-- <c:if test="${not empty sessionScope.username}">

												</c:if> --%>
												<security:authorize access="!isAuthenticated()">
													<div class="nav-item dropdown">
														<a href="#" class="nav-link dropdown-toggle"
															data-toggle="dropdown">Tài khoản <i
																class="fa fa-angle-down mt-1"></i></a>
														<div class="dropdown-menu bg-warning rounded-0 border-0 m-0">
															<a href="/login" class="dropdown-item ">Đăng nhập</a> <a
																href="/register" class="dropdown-item ">Đăng ký</a>
														</div>
													</div>
												</security:authorize>
												<security:authorize access="isAuthenticated()">
													<div class="nav-item dropdown">
														<a href="#" class="nav-link dropdown-toggle"
															data-toggle="dropdown">Tài khoản <i
																class="fa fa-angle-down mt-1"></i></a>
														<div
															class="dropdown-menu bg-warning text-white rounded-0 border-0 m-0">
															<a href="/shop/profile/user"
																class="dropdown-item bg-warning text-white ">Thông
																tin</a> <a href="/logout"
																class="dropdown-item bg-warning text-white">Đăng
																xuất</a>
														</div>
													</div>
												</security:authorize>

												<security:authorize access="hasRole('ROLE_ADMIN')">
													<a href="http://localhost:8081/manager/dashboard"
														class="nav-item nav-link">Quản lý</a>
												</security:authorize>
									</div>

									<div class="navbar-nav ml-auto py-0 d-none d-lg-block">
										<a href="/shop/profile/favorite" class="btn px-0"> <i
												class="fas fa-heart text-warning"></i> <span
												class="badge text-secondary border border-secondary rounded-circle"
												style="padding-bottom: 2px;">${sessionScope.countFavorite}
												${sessionScope.countFavorite==null?'0':''}</span>
										</a> <a href="/shop/cart" class="btn px-0 ml-3"> <i
												class="fas fa-shopping-cart text-warning"></i> <span
												class="badge text-secondary border border-secondary rounded-circle"
												style="padding-bottom: 2px;">${sessionScope.countProduct}
												${sessionScope.countProduct==null?'0':''}</span>
										</a>
									</div>
								</div>
							</nav>
						</div>
					</div>
				</div>
				<!-- Navbar End -->
			</body>

			</html>