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
		<div class="container">
				<a href="${pageContext.request.contextPath}/home/index.htm"><img
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
                    <button > <a href="${pageContext.request.contextPath}/home/login.htm"> ????ng nh???p</a> </button>
                    <button > <a href="${pageContext.request.contextPath}/home/sign-up.htm"> ????ng k??</a> </button>
                </div>
            </div>
        </div>
	</header>
    <div class="container-list-produce">
        <div class="right-content">
            <div class="sort-filter">
                <select id="filter_price" class="filter_price">
                    <option value="none">B??? l???c</option>

                    <option data-text="D?????i 300.000 VND" value="(price:product<=300000)">
                        D?????i 300.000 VND
                    </option>

                    <option data-text="300 - 500.000 VND" value="(price:product>300000)&amp;&amp;(price:product<500000)">
                        300 - 500.000 VND
                    </option>

                    <option data-text="500 - 1.000.000 VND" value="(price:product>=500000)&amp;&amp;(price:product<1000000)">
                        500 - 1.000.000 VND
                    </option>
                    <option data-text="Tr??n 1.000.000 VND" value="(price:product>=1000000)">
                        Tr??n 1.000.000 VND
                    </option>
            </select>
                <select name="SortBy" class="sort-by" id="SortBy">
                <option value="manual">S???p x???p:</option>
                <option value="quantity-descending" data-filter="(quantity:product=desc)">T???n Kho: Gi???m d???n</option>
                <option value="price-ascending" data-filter="(price:product=asc)">Gi??: T??ng d???n</option>
                <option value="price-descending" data-filter="(price:product=desc)">Gi??: Gi???m d???n</option>
                <option value="title-ascending" data-filter="(title:product=asc)">T??n: A-Z</option>
                <option value="title-descending" data-filter="(title:product=desc)">T??n: Z-A</option>
                <option value="created-ascending" data-filter="(updated_at:product=asc)">C?? nh???t</option>
                <option value="created-descending" data-filter="(updated_at:product=desc)">M???i nh???t</option>
                <option value="best-selling" data-filter="(sold_quantity:product=desc)">B??n ch???y nh???t</option>
            </select>
            </div>
            <div class="size-content ">
                <h3>SIZE</h3>
                <ul id="sort_size" class="list-size list-fm">
                    <li class="advanced-filter" data-text="24">
                        <label>
							<span data-value="(variantonhand:product**24)">24</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="25">
                        <label>
							<span data-value="(variantonhand:product**25)">25</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="26">
                        <label>
							<span data-value="(variantonhand:product**26)">26</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="27">
                        <label>
							<span data-value="(variantonhand:product**27)">27</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="28">
                        <label>
							<span data-value="(variantonhand:product**28)">28</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="29">
                        <label>
							<span data-value="(variantonhand:product**29)">29</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="30">
                        <label>
							<span data-value="(variantonhand:product**30)">30</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="31">
                        <label>
							<span data-value="(variantonhand:product**31)">31</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="32">
                        <label>
							<span data-value="(variantonhand:product**32)">32</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="33">
                        <label>
							<span data-value="(variantonhand:product**33)">33</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="34">
                        <label>
							<span data-value="(variantonhand:product**34)">34</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="35">
                        <label>
							<span data-value="(variantonhand:product**35)">35</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="36">
                        <label>
							<span data-value="(variantonhand:product**36)">36</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="37">
                        <label>
							<span data-value="(variantonhand:product**37)">37</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="38">
                        <label>
							<span data-value="(variantonhand:product**38)">38</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="39">
                        <label>
							<span data-value="(variantonhand:product**39)">39</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="40">
                        <label>
							<span data-value="(variantonhand:product**40)">40</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="41">
                        <label>
							<span data-value="(variantonhand:product**41)">41</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="42">
                        <label>
							<span data-value="(variantonhand:product**42)">42</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="43">
                        <label>
							<span data-value="(variantonhand:product**43)">43</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="44">
                        <label>
							<span data-value="(variantonhand:product**44)">44</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="45">
                        <label>
							<span data-value="(variantonhand:product**45)">45</span>
						</label>
                    </li>
                </ul>
            </div>
            <div class="coler-content list-fm">
                <h3>M??U S???C</h3>
                <ul id="color" class="list-color list-fm">
                    <li class="advanced-filter" data-text="Cam">
                        <label>
							<span data-value="(variantonhand:product**Cam)" class="catalog_color cam" style="background-color:#ff6600" title="Cam">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="??en">
                        <label>
							<span data-value="(variantonhand:product**??en)" class="catalog_color den" style="background-color:#000000" title="??en">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="????? ?????m">
                        <label>
							<span data-value="(variantonhand:product**????? ?????m)" class="catalog_color do-dam" style="background-color:#cc0000" title="????? ?????m">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="?????">
                        <label>
							<span data-value="(variantonhand:product**?????)" class="catalog_color do" style="background-color:#ff0000" title="?????">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="N??u ?????t">
                        <label>
							<span data-value="(variantonhand:product**N??u ?????t)" class="catalog_color nau-dat" style="background-color:#974706" title="N??u ?????t">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="N??u">
                        <label>
							<span data-value="(variantonhand:product**N??u)" class="catalog_color nau" style="background-color:#9e4b07" title="N??u">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="R??u">
                        <label>
							<span data-value="(variantonhand:product**R??u)" class="catalog_color reu" style="background-color:#76933c" title="R??u">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Tr???ng">
                        <label>
							<span data-value="(variantonhand:product**Tr???ng)" class="catalog_color trang" style="background-color:#f9f9f9" title="Tr???ng">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="V??ng">
                        <label>
							<span data-value="(variantonhand:product**V??ng)" class="catalog_color vang" style="background-color:#ffff00" title="V??ng">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="X??m">
                        <label>
							<span data-value="(variantonhand:product**X??m)" class="catalog_color xam" style="background-color:#a6a6a6" title="X??m">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xanh D????ng ?????m">
                        <label>
							<span data-value="(variantonhand:product**Xanh D????ng ?????m)" class="catalog_color xanh-duong-dam" style="background-color:#000099" title="Xanh D????ng ?????m">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xanh D????ng">
                        <label>
							<span data-value="(variantonhand:product**Xanh D????ng)" class="catalog_color xanh-duong" style="background-color:#0000ff" title="Xanh D????ng">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xanh D????ng L???t">
                        <label>
							<span data-value="(variantonhand:product**Xanh D????ng L???t)" class="catalog_color xanh-duong-lot" style="background-color:#3399ff" title="Xanh D????ng L???t">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xanh Mi N??">
                        <label>
							<span data-value="(variantonhand:product**Xanh Mi N??)" class="catalog_color xanh-mi-no" style="background-color:#99ff33" title="Xanh Mi N??">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xanh">
                        <label>
							<span data-value="(variantonhand:product**Xanh)" class="catalog_color xanh" style="background-color:#003399" title="Xanh">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xanh Nh???t">
                        <label>
							<span data-value="(variantonhand:product**Xanh Nh???t)" class="catalog_color xanh-nhot" style="background-color:#003399" title="Xanh Nh???t">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="H???ng">
                        <label>
							<span data-value="(variantonhand:product**H???ng)" class="catalog_color hong" style="background-color:#ff00cc" title="H???ng">&nbsp;</span>
						</label>
                    </li>
                </ul>
            </div>
        </div>
        <div class="left-content">
			<br>
            <div class="content-pro">
            	<c:forEach var="pn" items="${item}">
				<div class="item-pro">
	                <div class="sale">
	                    <a href="${pageContext.request.contextPath}/detail/${pn.id}.htm"><img src="${pageContext.request.contextPath}/resources/img/pro/${pn.img1}" alt=""></a>
	                    <c:if test="${pn.sale!=0}">
	                    	<h1>-${pn.sale}%</h1>
	                    </c:if>
	                </div>
	                <a href="">${pn.name}</a>
	                <h3>${pn.coler}</h3>
                <div style="margin-top: 5px" class="price">
                    <c:if test="${pn.sale==0}">
                    	<h3><fmt:formatNumber pattern="###,### VND" value="${pn.price}" type="currency" /></h3>
                    </c:if>
                    <c:if test="${pn.sale!=0}">
                    	<del><h3><fmt:formatNumber pattern="###,###" value="${pn.price}" type="currency" /> </h3></del>
                    	<h3><fmt:formatNumber pattern="###,### VND" value="${pn.price - (pn.price*pn.sale)/100}" type="currency" /></h3>
                    </c:if>
                </div>
	                <div class="bt-ab">
	                    <a class="bt-mua" href="${pageContext.request.contextPath}/home/shopping-now.htm?id=${pn.id }&name=${pn.name }&coler=${pn.coler}&gia=${pn.price }&image=${pn.img1}">Mua ngay</a>
	                    <a href="${pageContext.request.contextPath}/home/shopping-list.htm?id=${pn.id }&name=${pn.name }&coler=${pn.coler}&gia=${pn.price }&image=${pn.img1}">Th??m</a>
	                </div>
            	</div>
            	</c:forEach>
            </div>
        </div>
    </div>
       <div class="cart-left1">
        <button onclick="document.getElementById('cart1').style.display='block'">
            <span>${dem}</span>
            <i class="fas fa-shopping-cart"></i>
        </button>
    </div>
    <div id="cart1" class="cart-cont1">
        <span onclick="document.getElementById( 'cart1').style.display='none' " class="close " title="Close Modal ">&times;</span>
        <h1>Gi??? H??ng</h1>
			<c:forEach var="a" items="${cart}">
				 <div class="item-cart ">
		            <img src="${pageContext.request.contextPath}/resources/img/pro/${a.image}" alt=" ">
		            <div class="item-cart1 ">
		                <a href=" ">${a.tenSanPham} - ${a.idSanPham}</a>
		                <div class="sl-tt ">
		                    <h4><fmt:formatNumber pattern="###,### VND" value="${a.giaSanPham}" type="currency" /></h4>
		                    <h4>SL : ${a.getSoLuong()}</h4>
		                    <a href="${pageContext.request.contextPath}/home/deletecart-list.htm?idSanPham=${a.idSanPham}" class="del"><i class="far fa-times-circle "></i></a>
		                </div>
		                
		            </div>
        		</div>
			</c:forEach>
        <div class="sum ">
            <div class="s-t ">
                <h4>Th??nh Ti???n</h4>
                <h4><fmt:formatNumber pattern="###,### VND" value="${tongTien}" type="currency" /></h4>
            </div>
            <a class="bt-tt " href="${pageContext.request.contextPath}/home/order.htm">Thanh To??n</a>
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
        modalus.style.display = "none ";
    }
}
var modallg = document.getElementById('login');
window.onclick = function(event) {
    if (event.target == modallg) {
        modallg.style.display = "none ";
    }
}
var modalsu = document.getElementById('sign-up');
window.onclick = function(event) {
    if (event.target == modalsu) {
        modalsu.style.display = "none ";
    }
}
var modalsu = document.getElementById('cart1');
window.onclick = function(event) {
    if (event.target == modalsu) {
        modalsu.style.display = "none ";
    }
}
</script>
</html>