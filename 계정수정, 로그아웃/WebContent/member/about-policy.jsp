<!-- jsp에 들어가는 인코딩 문장 language(사용 스타일) 
contentType(클라이언트에 자원을 보낼때 타입을 전송 , char(클라우저가 받을 타입)) 
page(jsp 작성 타입) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 받는 정보는 "UTF-8"로 인코딩 한다 -->
<% request.setCharacterEncoding("UTF-8"); %>
<%
	// 세션에 저장된 내용은 FrontControoler.servlet/login.do에서 "id"와 "name"만 저장했다
	// 세션에 저장된 데이터를 꺼낸다(getAttribute)
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html lang="ko">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>착한가격업소 - 업소</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
    <!-- 로고 css -->
    <link rel="stylesheet" href="css/logo.css">
    <!-- 상단 메뉴 링크 js -->
    <script src="js/topmenu.js"></script>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="#" onclick="index()">착한가격업소</a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="#" onclick="map()">Map</a></li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">About</a>
                            <ul class="dropdown-menu">
                                <li><a href="#" onclick="consumer()">Consumer</a></li>
                                <li><a href="#" onclick="policy()">Policy</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Community</a>
                            <ul class="dropdown-menu">
                                <li><a href="#" onclick="Notice()">Notice</a></li>
                                <li><a href="#" onclick="contact_us()">Contact Us</a></li>
                                <li><a href="#" onclick="iyonghugi()">Iyonghugi</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#" onclick="gallery()">Gallery</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <li class="search"><a href="#" onclick="store()"><i class="fa fa-search"></i></a></li>
                       	<% if (name == null || name.equals("")) {%>
                        <li class="side-menu">
							<a href="#"  onclick="checkout()">
								로그인
							</a>
						</li>
						<%} else {%>
						<li class="side-menu">
							<a href="#"  onclick="account()">
								<%=name %>님
							</a>
						</li>
                        <% } %>
                    </ul>
                </div>
                <!-- End Atribute Navigation -->
            </div>
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>ABOUT POLICY</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">ABOUT Policy</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start About Page  -->
    <div class="about-box-main">
        <div class="container">
            <div class="row">
				<div class="col-lg-12">
                    <div class="banner-frame"> <img class="img-fluid" src="images/benefits.jpg" alt="" />
                    </div>
                </div>
                <div class="col-lg-12">
                    <h2 class="noo-sh-title-top">소비자에게 만족을 드리는 ‘착한가격업소’ 입니다.</h2>
                    <p>착한가격업소의 확대를 통해 소비자물가 안정에 기여하며 개인 서비스 업소의 매출 증대를 통해 서민경제 살리기에 기여하고 있습니다. <br>
                        2011년 물가안정을 위해 전국에서 저렴한 가격과 위생적인 서비스를 제공하는 2,497개 업소를 착한가격업소로 지정했으며, 2021년 6월 30일 기준 5,866개의 업소(외식업, 이미용업, 세탁업 등)를 착한가격업소로 지정하여 지원하고 있습니다.</p>
					<a class="btn hvr-hover" href="#">Read More</a>
                </div>
            </div>
            <div class="row my-5">
                <div class="col-sm-6 col-lg-4">
                    <div class="service-block-inner">
                        <h3>착한가격업소 안내</h3>
                        <p>착한가격업소는, 정부와 지방자치단체가 지정한 물가안정 모범업소 입니다. 효율적인 경영을 통하여 소비자에게 렴한 가격으로 양질의 서비스를 제공하는 정부와 지방자치단체가 지정, 관리하는 업소를 말합니다</p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="service-block-inner">
                        <h3>지정기준</h3>
                        <p>착한 가격과 깨끗하고 위생적인 환경, 친절한 서비스를 통해 소비자들이 다시 찾고 싶어하는 업소입니다. <br>
                            저렴한 가격으로 깨끗한 시설에서 믿을 수 있는 재료를 사용하고 친절한 서비스를 제공하는 업소는 착한 가격업소로 지정받을 수 있습니다.</p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="service-block-inner">
                        <h3>지정절차</h3>
                        <p>영업자가 직접 신청을 하거나, 읍면동장/소비자단체 등의 추천을 받아야 합니다.<br>
                            직접 신청 및 추천을 받은 업소를 시장/군수/구청장의 현지실사/평가 및 심사를 거친 후 지정 됩니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End About Page -->

    <!-- Start Footer  -->
    <footer>
        <div class="footer-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-widget">
                            <h4>About 착한가격업소</h4>
                            <p>착한 가격, 청결한 가게운영, 기분좋은 서비스 제공으로 소비자에게 만족을 드리기 위해 정부와 지방자치단체가 선정한 우수업소가 바로 ‘착한가격업소’ 입니다.</p>
                            <p>우리 동네에 있는 착한가격업소를 찾아보시고 안심하고 즐겁게 이용해 주세요.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>Information</h4>
                            <ul>
                                <li><a href="#">개발자 소개</a></li>
                                <li><a href="#">고객 서비스</a></li>
                                <li><a href="#">이용약관</a></li>
                                <li><a href="#">개인 정보 정책</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link-contact">
                            <h4>Contact Us</h4>
                            <ul>
                                <li>
                                    <p><i class="fas fa-map-marker-alt"></i>Address:서울 마포구 신촌로 176(대흥동 12-20)  <br>중앙정보처리학원<br> (04104) </p>
                                </li>
                                <li>
                                    <p><i class="fas fa-phone-square"></i>Phone: <a href="tel:+82-01033953788">+82-010 3395 3788</a></p>
                                </li>
                                <li>
                                    <p><i class="fas fa-envelope"></i>Email: <a href="mailto:cjavasw@naver.com">javasw@naver.com</a></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer  -->

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/bootsnav.js."></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>