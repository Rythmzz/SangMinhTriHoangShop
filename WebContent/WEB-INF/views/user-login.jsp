<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SANG MINH TRI HOANG</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">
<script src="https://www.google.com/recaptcha/api.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/slider.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/sub.js"></script>
<base href="${pageContext.servletContext.contextPath }" />
<style>
<%@ include file="/resources/css/reset.css"%>
<%@ include file="/resources/css/index.css"%>
<%@ include file="/resources/css/user-login.css"%>
*[id$=errors]{
	color:red;
	font-style: italic;
}
</style>
</head>
<body>
	<header>
		<div class="container">
				<a href=""><img
					src=" ${pageContext.request.contextPath}/resources/img/logo/smthtech-update.png" alt=""></a>
			</div>
			<div class="container">
			<div class="contener1">
					<ul class="navbar">
						<c:forEach var="menu1" items="${menu}">
							<c:if test="${menu1.parentid==null}">
								<li>
									<a href="${pageContext.request.contextPath}/${menu1.link}">${menu1.name}</a>
									<div class="sub-menu">
										<div class="sub-menu1">
											<ul>
												<c:forEach var="menu2" items="${menu}">
													<c:if test="${menu2.parentid==menu1.id}">
														<li><a href="${pageContext.request.contextPath}/list/${menu2.link}.htm">${menu2.name }</a></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
                <div class="navbar-right">
                    <div class="search">
                        <input class="ip-search" />
                        <button><i class="fas fa-search icon-search"></i></button>
                    </div>
                    <button><i class="fas fa-shopping-cart"></i></button>
                    <button onclick="document.getElementById('user').style.display='block'"><i class="fas fa-user"></i></button>
                </div>
			</div>
		</div>
		        <div id="user" class="user-box">
            <span onclick="document.getElementById('user').style.display='none'" class="close" title="Close Modal">&times;</span>
            <div class="user-content">
                <div class="content-top">
                    <i class="fas fa-user-circle"></i>
                    <a href="">${username}</a>
                </div>
                <div class="content-bottom">
                    <button > <a href="3D_SHOP/home/login.htm"> ????ng nh???p</a> </button>
                    <button > <a href="3D_SHOP/home/sign-up.htm"> ????ng k??</a> </button>
                    <button > <a href="3D_SHOP/admin/login_admin.htm"> Admin</a> </button>
                </div>
            </div>
        </div>
	</header>
	<div class="login-container">
        <div id="login" class="login-box">
            <div class="login-content">
                <img src="/img/AN.png" alt="">
                <h2>${tb}</h2>
                <h1>????ng Nh???p</h1>
                <form class="login-form"  action="${pageContext.request.contextPath}/home/login.htm" method="post">
                    <div class="usern">
                        <label for="uname"><b>T??i kho???n</b></label>
                        <input type="text" placeholder="Nh???p t??i kho???n" name="user" required>
                    </div>
                    <div class="usern">
                        <label for="psw"><b>M???t kh???u</b></label>
                        <input type="password" placeholder="Nh???p m???t kh???u" name="pass" required>
                    </div>
                    <div class="g-recaptcha input-group"
							data-sitekey="6LdO2lwjAAAAAHv-cges_Ow5UpDoDqAO4hqeV08e"></div>
                    <button >X??c nh???n</button>
                </form>
                <div class="login-bottom">
                    <span class="psw">Qu??n m???t kh???u? <a href="#">L???y l???i m???t kh???u</a></span>
                    <button><a  href="${pageContext.request.contextPath}/home/sign-up.htm"> ????ng k?? t??i kho???n th??nh vi??n</a></button>
                </div>
            </div>
        </div>
	</div>
  <footer>
        <div class="footer-cont">
            <container><img src="${pageContext.request.contextPath}/resources/img/logo/gaming_room.png" width ="280" height ="280" alt=""> </container>
            <ul>
                S???n ph???m
                <li><a href="">Ph??? ki???n ??i???n t???</a></li>
                <li><a href="">Ph??? ki???n gia d???ng</a></li>
                <li><a href="">Th????ng hi???u</a></li>
                <li><a href="">Sale-off</a></li>
            </ul>
            <ul>
                Li??n h???
                <li><a href="">Email : trantuminh968@gmail.com</a></li>
                <li><a href="">Hotline : 0365304510</a></li>
            </ul>
            <ul>
                H??? Tr???
                <li><a href="">FAQs</a></li>
                <li><a href="">Ch??nh s??ch chung</a></li>
                <li><a href="">Tra c???u ????n h??ng</a></li>
            </ul>
            
        </div>
        <h1>Copyright ?? 2022 SANG MINH TRI HOANG SHOP. All rights reserved.</h1>
    </footer>
</body>
<script>
    // Get the modal
    var modalus = document.getElementById('user');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modalus) {
            modalus.style.display = "none";
        }
    }
    var modalsu = document.getElementById('cart');
    window.onclick = function(event) {
        if (event.target == modalsu) {
            modalsu.style.display = "none";
        }
    }
</script>
</html>