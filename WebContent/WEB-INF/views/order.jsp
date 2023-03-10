<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>XOP3D</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/slider.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/sub.js"></script>
<base href="${pageContext.servletContext.contextPath }" />
<style>
<%@ include file="/resources/css/reset.css"%>
<%@ include file="/resources/css/index.css"%>
<%@ include file="/resources/css/home.css"%>
<%@ include file="/resources/css/list-pro.css"%>
<%@ include file="/resources/css/pro-del.css"%>
<%@ include file="/resources/css/checkout.css"%>
</style>
</head>
<body>
	<header>
		<div class="container" >
				<a href=""><img
					src=" ${pageContext.request.contextPath}/resources/img/logo/smthtech-update.png" alt=""></a>
			</div>
			<div class="container" >
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
                    <button> <a href="3D_SHOP/home/login.htm"> ????ng nh???p</a> </button>
                    <button> <a href="3D_SHOP/home/sign-up.htm"> ????ng k??</a> </button>
                </div>
            </div>
        </div>
	</header>
	<h1 style="text-align: center; margin: 10px 0px;  " >${message}</h1>
    <form:form action="${pageContext.request.contextPath}/home/order.htm" >
        <div class="container-checkout">
        
            <div class="left">
                <div class="left-cont">
                    <h1>Th??ng tin giao h??ng</h1>
                    <input  name="name" placeholder="H??? v?? t??n"/>
                    <input name="phone" placeholder="S??? ??i???n tho???i"/>
                    <input name="email" placeholder="Email"/>
                    <input name="address" placeholder="?????a ch??? nh???n h??ng"/>
                    <input name="code" placeholder="M?? gi???m gi??"/>
                    <div class="cod">
                        <h1>Ph?? giao h??ng</h1>
                        <h1>30.000 ??</h1>
                    </div>
                    <div class="cod">
                        <h1>T???ng</h1>
                        <h1><fmt:formatNumber pattern="###,### VND" value="${tongTien}" type="currency" /></h1> 
                    </div>
                    <div class="cod">
                        <h1>S??? ti???n ph???i thanh to??n</h1>
                        <h1><fmt:formatNumber pattern="###,### VND" value="${tongTien +30000}" type="currency" /></h1> 
                    </div>
                    <button style="width: 100%;height: 40px;margin: 10px 0px;background-color: red;color: white;font-size: 18px;"><a >?????t h??ng</a></button>
                </div>
            </div>
            <div class="right">
                <div class="right-cont">
                	<h1>${tbb}</h1>
                    <h1>Gi??? H??ng</h1>
					<c:forEach var="a" items="${cart}">
					<div class="item-cart ">
                        <img src="${pageContext.request.contextPath}/resources/img/pro/${a.image}" alt=" ">
                        <div class="item-cart1 ">
                            <a class="pr"  href=" ">${a.tenSanPham}</a>
                            <div class="sl-tt ">
                                <select   name="size${a.idSanPham}" id="size" class="size">
		                        <c:forEach var="sz" items="${prode}">
		                       		<c:if test="${sz.product.id==a.idSanPham}">
		                       		<c:choose>
		                       			<c:when test="${a.size==sz.size}">
		                       				<option selected="selected" value="${sz.size}">${sz.size}(${sz.quanlity})</option>
		                       			</c:when>
		                       			<c:otherwise><option value="${sz.size}">${sz.size}(${sz.quanlity})</option></c:otherwise>
		                       		</c:choose>
		                       		</c:if>
		                       </c:forEach>   
                                </select >
                                <c:forEach var="sz" items="${prode}">
                                	<c:if test="${sz.product.id==a.idSanPham && sz.size == a.size}">
                                		<input type="number" name="sl${a.idSanPham}" min="0" max="${sz.quanlity}" value="${a.soLuong}" >
                                	</c:if>
                                </c:forEach>
                                <h4><fmt:formatNumber pattern="###,### VND" value="${a.giaSanPham*a.soLuong}" type="currency" /></h4>                     
                            </div>
                            <a class="del" href="${pageContext.request.contextPath}/home/deletecart-od.htm?idSanPham=${a.idSanPham}"><i class="far fa-times-circle "></i></a>
                        </div>
                    </div>
					</c:forEach>
                    <div class="sum ">
                        <div class="s-t ">
                            <h4>Th??nh Ti???n</h4>
                            <h4><fmt:formatNumber pattern="###,### VND" value="${tongTien}" type="currency" /></h4> 
                        </div>
                    </div>
                    <input style="width: 100%;height: 40px;margin: 10px 0px;background-color: red;color: white;font-size: 18px;" type="submit" formaction="${pageContext.request.contextPath}/home/order-pr.htm" value="C???p nh???t gi??? h??ng">
                </div>
            </div>
        </div>
    </form:form>
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
    var modallg = document.getElementById('login');
    window.onclick = function(event) {
        if (event.target == modallg) {
            modallg.style.display = "none";
        }
		
    }
    var modalsu = document.getElementById('sign-up');
    window.onclick = function(event) {
        if (event.target == modalsu) {
            modalsu.style.display = "none";
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