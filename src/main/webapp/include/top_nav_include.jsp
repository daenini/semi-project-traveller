<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">Team3_traveller</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Home</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">국내여행</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="p_list.jsp">국내 패키지 상품</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="p_category_list.jsp?p_category=서울">서울</a></li>
                                <li><a class="dropdown-item" href="p_category_list.jsp?p_category=경기">경기</a></li>
                                <li><a class="dropdown-item" href="p_category_list.jsp?p_category=충청도">충청도</a></li>
                                <li><a class="dropdown-item" href="p_category_list.jsp?p_category=강원도">강원도</a></li>
                                <li><a class="dropdown-item" href="p_category_list.jsp?p_category=경상도">경상도</a></li>
                                <li><a class="dropdown-item" href="p_category_list.jsp?p_category=전라도">전라도</a></li>
                                <li><a class="dropdown-item" href="p_category_list.jsp?p_category=제주도">제주도</a></li>
                            </ul>
                        </li>
                     </ul>
                 </div>
                 <div class="collapse navbar-collapse" id="navbarSupportedContent" style="flex-grow: 0;">
                     <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <%
                        	String sUserId = (String)session.getAttribute("sUserId");
                        	if(sUserId == null){
                        %>
                        <li class="nav-item"><a class="nav-link" href="q_board.jsp">고객센터</a></li>
                        <li class="nav-item"><a class="nav-link" href="f_board_list.jsp">FAQ</a></li>
                        <li class="nav-item"><a class="nav-link" href="member_login_form.jsp"><img src="images/menu.png" style="width: 25px; height: 25px;"></a></li>
                        <%
                        	} else {
                        %>
                        <li class="nav-item"><a class="nav-link" href="cart_view.jsp">장바구니</a></li>
                        <li class="nav-item"><a class="nav-link" href="q_board.jsp">고객센터</a></li>
                        <li class="nav-item"><a class="nav-link" href="f_board_list.jsp">FAQ</a></li>
                        <li class="nav-item dropdown">
                       	<!-- 사람모양 메뉴 -->
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><img src="images/menu.png" style="width: 25px; height: 25px;"></a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="r_view.jsp">예약내역</a></li>
                            <li><a class="dropdown-item" href="member_view_myinfo.jsp">내정보</a></li>
                       		<li class="nav-item"><a class="dropdown-item" href="member_logout_action.jsp">로그아웃</a></li>
                        </ul>
                       </li>
                        <%
                        	}
                        %>
                    </ul>
                </div>
            </div>
        </nav>