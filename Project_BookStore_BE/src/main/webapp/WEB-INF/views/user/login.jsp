<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <title>Login Form</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->

        <!-- Favicon -->
        <link href="/user/img/favicon.ico" rel="icon">

        <link rel="stylesheet" type="text/css" href="user/fonts/font-awesome-4.7.0/css/font-awesome.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="/user/lib/animate/animate.min.css" rel="stylesheet">
        <link href="/user/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="user/css/main.css">
        <link rel="stylesheet" type="text/css" href="user/css/util.css">
        <link href="/user/img/favicon.ico" rel="icon">
        <style>
          /*//////////////////////////////////////////////////////////////////
[ FONT ]*/

          @font-face {
            font-family: Poppins-Regular;
            src: url('../fonts/poppins/Poppins-Regular.ttf');
          }

          @font-face {
            font-family: Poppins-Bold;
            src: url('../fonts/poppins/Poppins-Bold.ttf');
          }

          @font-face {
            font-family: Poppins-Medium;
            src: url('../fonts/poppins/Poppins-Medium.ttf');
          }

          @font-face {
            font-family: Montserrat-Bold;
            src: url('../fonts/montserrat/Montserrat-Bold.ttf');
          }

          /*//////////////////////////////////////////////////////////////////
[ RESTYLE TAG ]*/

          * {
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
          }

          body,
          html {
            height: 100%;
            font-family: Poppins-Regular, sans-serif;
          }

          /*---------------------------------------------*/
          a {
            font-family: Poppins-Regular;
            font-size: 14px;
            line-height: 1.7;
            color: #666666;
            margin: 0px;
            transition: all 0.4s;
            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
          }

          a:focus {
            outline: none !important;
          }

          a:hover {
            text-decoration: none;
            color: #57b846;
          }

          /*---------------------------------------------*/
          h1,
          h2,
          h3,
          h4,
          h5,
          h6 {
            margin: 0px;
          }

          p {
            font-family: Poppins-Regular;
            font-size: 14px;
            line-height: 1.7;
            color: #666666;
            margin: 0px;
          }

          ul,
          li {
            margin: 0px;
            list-style-type: none;
          }


          /*---------------------------------------------*/
          input {
            outline: none;
            border: none;
          }

          textarea {
            outline: none;
            border: none;
          }

          textarea:focus,
          input:focus {
            border-color: transparent !important;
          }

          input:focus::-webkit-input-placeholder {
            color: transparent;
          }

          input:focus:-moz-placeholder {
            color: transparent;
          }

          input:focus::-moz-placeholder {
            color: transparent;
          }

          input:focus:-ms-input-placeholder {
            color: transparent;
          }

          textarea:focus::-webkit-input-placeholder {
            color: transparent;
          }

          textarea:focus:-moz-placeholder {
            color: transparent;
          }

          textarea:focus::-moz-placeholder {
            color: transparent;
          }

          textarea:focus:-ms-input-placeholder {
            color: transparent;
          }

          input::-webkit-input-placeholder {
            color: #999999;
          }

          input:-moz-placeholder {
            color: #999999;
          }

          input::-moz-placeholder {
            color: #999999;
          }

          input:-ms-input-placeholder {
            color: #999999;
          }

          textarea::-webkit-input-placeholder {
            color: #999999;
          }

          textarea:-moz-placeholder {
            color: #999999;
          }

          textarea::-moz-placeholder {
            color: #999999;
          }

          textarea:-ms-input-placeholder {
            color: #999999;
          }

          /*---------------------------------------------*/
          button {
            outline: none !important;
            border: none;
            background: transparent;
          }

          button:hover {
            cursor: pointer;
          }

          iframe {
            border: none !important;
          }


          /*//////////////////////////////////////////////////////////////////
[ Utility ]*/
          .txt1 {
            font-family: Poppins-Regular;
            font-size: 13px;
            line-height: 1.5;
            color: #999999;
          }

          .txt2 {
            font-family: Poppins-Regular;
            font-size: 14px;
            line-height: 1.5;
            color: #666666;
          }


          /*//////////////////////////////////////////////////////////////////
[ login ]*/

          .limiter {
            width: 100%;
            margin: 0 auto;
          }

          .container-login100 {
            width: 100%;
            min-height: 100vh;
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            padding: 15px;
            background: #9053c7;
            background: -webkit-linear-gradient(-135deg, #c850c0, #4158d0);
            background: -o-linear-gradient(-135deg, #c850c0, #4158d0);
            background: -moz-linear-gradient(-135deg, #c850c0, #4158d0);
            background: linear-gradient(-135deg, #c850c0, #4158d0);
          }

          .wrap-login100 {
            width: 960px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;

            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            padding: 117px 130px 33px 115px;
          }

          /*------------------------------------------------------------------
[  ]*/
          .login100-pic {
            width: 316px;
          }

          .login100-pic img {
            max-width: 100%;
          }


          /*------------------------------------------------------------------
[  ]*/
          .login100-form {
            width: 290px;
          }

          .login100-form-title {
            font-family: Poppins-Bold;
            font-size: 24px;
            color: #333333;
            line-height: 1.2;
            text-align: center;

            width: 100%;
            display: block;
            padding-bottom: 54px;
          }


          /*---------------------------------------------*/
          .wrap-input100 {
            /* position: relative; */
            width: 100%;
            /* z-index: 1; */
            margin-bottom: 10px;
          }

          .input100 {
            font-family: Poppins-Medium;
            font-size: 15px;
            line-height: 1.5;
            color: #666666;

            display: block;
            width: 100%;
            background: #e6e6e6;
            height: 50px;
            border-radius: 25px;
            padding: 0 30px 0 68px;
          }


          /*------------------------------------------------------------------
[ Focus ]*/
          .focus-input100 {
            display: block;
            position: absolute;
            border-radius: 25px;
            bottom: 0;
            left: 0;
            z-index: -1;
            width: 100%;
            height: 100%;
            box-shadow: 0px 0px 0px 0px;
            color: rgba(87, 184, 70, 0.8);
          }

          .input100:focus+.focus-input100 {
            -webkit-animation: anim-shadow 0.5s ease-in-out forwards;
            animation: anim-shadow 0.5s ease-in-out forwards;
          }

          @-webkit-keyframes anim-shadow {
            to {
              box-shadow: 0px 0px 70px 25px;
              opacity: 0;
            }
          }

          @keyframes anim-shadow {
            to {
              box-shadow: 0px 0px 70px 25px;
              opacity: 0;
            }
          }

          .symbol-input100 {
            font-size: 15px;

            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            align-items: center;
            position: absolute;
            border-radius: 25px;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
            padding-left: 35px;
            pointer-events: none;
            color: #666666;

            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
            transition: all 0.4s;
          }

          .input100:focus+.focus-input100+.symbol-input100 {
            color: #57b846;
            padding-left: 28px;
          }

          /*------------------------------------------------------------------
[ Button ]*/
          .container-login100-form-btn {
            width: 100%;
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding-top: 20px;
          }

          .login100-form-btn {
            font-family: Montserrat-Bold;
            font-size: 15px;
            line-height: 1.5;
            color: #fff;
            text-transform: uppercase;

            width: 100%;
            height: 50px;
            border-radius: 25px;
            background: #57b846;
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 25px;

            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
            transition: all 0.4s;
          }

          .login100-form-btn:hover {
            background: #333333;
          }



          /*------------------------------------------------------------------
[ Responsive ]*/



          @media (max-width: 992px) {
            .wrap-login100 {
              padding: 177px 90px 33px 85px;
            }

            .login100-pic {
              width: 35%;
            }

            .login100-form {
              width: 50%;
            }
          }

          @media (max-width: 768px) {
            .wrap-login100 {
              padding: 100px 80px 33px 80px;
            }

            .login100-pic {
              display: none;
            }

            .login100-form {
              width: 100%;
            }
          }

          @media (max-width: 576px) {
            .wrap-login100 {
              padding: 100px 15px 33px 15px;
            }
          }


          /*------------------------------------------------------------------
[ Alert validate ]*/

          .validate-input {
            position: relative;
          }

          .alert-validate::before {
            content: attr(data-validate);
            position: absolute;
            max-width: 70%;
            background-color: white;
            border: 1px solid #c80000;
            border-radius: 13px;
            padding: 4px 25px 4px 10px;
            top: 50%;
            -webkit-transform: translateY(-50%);
            -moz-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            -o-transform: translateY(-50%);
            transform: translateY(-50%);
            right: 8px;
            pointer-events: none;

            font-family: Poppins-Medium;
            color: #c80000;
            font-size: 13px;
            line-height: 1.4;
            text-align: left;

            visibility: hidden;
            opacity: 0;

            -webkit-transition: opacity 0.4s;
            -o-transition: opacity 0.4s;
            -moz-transition: opacity 0.4s;
            transition: opacity 0.4s;
          }

          .alert-validate::after {
            content: "\f06a";
            font-family: FontAwesome;
            display: block;
            position: absolute;
            color: #c80000;
            font-size: 15px;
            top: 50%;
            -webkit-transform: translateY(-50%);
            -moz-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            -o-transform: translateY(-50%);
            transform: translateY(-50%);
            right: 13px;
          }

          .alert-validate:hover:before {
            visibility: visible;
            opacity: 1;
          }

          @media (max-width: 992px) {
            .alert-validate::before {
              visibility: visible;
              opacity: 1;
            }
          }
        </style>

        <!--===============================================================================================-->
      </head>

      <body>

        <div class="limiter">
          <div class="container-login100">
            <div class="wrap-login100">
              <div class="login100-pic mb-30" data-tilt>
                <img
                  src="https://img.freepik.com/free-vector/poster-template-with-world-book-day-conceptwatercolor-stylexa_83728-8812.jpg?w=360&t=st=1706246179~exp=1706246779~hmac=91d8f1b5667a3280f55b4309179df2388bb3ee0d9a90dcb8fdb921f4ede39851"
                  alt="IMG">
              </div>


              <form:form action="/login" modelAttribute="userLogin" method="post"
                class="user login100-form validate-form">
                <span class="login100-form-title" style="font-family: 'Roboto';">
                  Đăng Nhập
                </span>

                <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                  <form:input path="username" class="input100 form-control form-control-user"
                    cssErrorClass="input100 form-control form-control-user " id="exampleInputEmail"
                    aria-describedby="emailHelp" placeholder="Nhập địa chỉ email..." />

                  <!-- <div class="invalid-feedback text-center">Vui lòng nhập
												email!</div> -->
                  <form:errors path="username" class="invalid-feedback text-center mt-5" element="div"
                    style="margin-top:10px;margin-left: 30px; color: #c80000;" />

                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                  </span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Password is required">
                  <form:password path="password" class="input100 form-control form-control-user"
                    cssErrorClass="input100 form-control form-control-user is-invalid" id="exampleInputPassword"
                    placeholder="Nhập mật khẩu..." value="${userLogin.password}" />
                  <form:errors path="password" cssClass="invalid-feedback text-center" element="div"
                    style="margin-top:10px;margin-left: 30px; color: #c80000;" />
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                    <i class="fa fa-lock" aria-hidden="true"></i>
                  </span>
                </div>
                <div style="font-size: 14px;
					padding-left: 22px;
					padding-top: 8px;">
                  <input type="checkbox"> Nhớ tài khoản ?
                </div>

                <div class="container-login100-form-btn">
                  <button type="submit" class="login100-form-btn" style="background-color: #4158d0;">
                    Đăng nhập
                  </button>
                  <button
                    style="margin-top:20px;padding:10px;border-radius: 40px; border: solid 1px black;width: 300px;display: flex;justify-content: center;">
                    <img src="/upload/search.png" alt="">
                    <a href="/oauth2/authorization/google"
                      style="text-decoration: none;margin-left: 10px;color:#333333;font-size: 16px;">
                      Đăng nhập với Google
                    </a></button>

                </div>


                <div class="text-center p-t-12" style="text-align: center;
    font-size: 24px;
    margin-bottom: 148px; margin-top: 20px;">
                  <span class="txt1">
                    Quên
                  </span>
                  <a class="txt2" href="/forgot-password" style="text-decoration: none;">
                    Tài khoản / Mật khẩu?
                  </a>
                </div>

                <div class="text-center p-t-136" style="text-align:center;">
                  <a class="txt2" href="/register" style="text-decoration: none;">
                    Đăng ký tài khoản
                    <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                  </a>
                </div>
              </form:form>
            </div>
          </div>
        </div>




        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/tilt/tilt.jquery.min.js"></script>
        <script>
          $('.js-tilt').tilt({
            scale: 1.1
          })
        </script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

      </body>

      </html>