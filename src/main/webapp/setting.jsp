<%@ page contentType="text/html;charset=UTF-8"%> 
<%@ page import="BusanCommunityPack.MemberBean"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
	
	Vector<MemberBean> vlist = sMgr.selectMobile(id);
	
%>

<!DOCTYPE html>
<html lang="ko">

<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>잘놀다갑니다</title>
 <link rel="stylesheet" href="./css/setting.css" >
 <link rel="stylesheet" href="./css/common.css">
 <link rel="stylesheet" href="./css/modal_inquiry.css">
 <link rel="stylesheet" href="./css/modal_changeNum.css">
 <link rel="stylesheet" href="./css/modal_changePhone.css">
 <link rel="stylesheet" href="./css/modal_signOut.css">
 <link rel="stylesheet" href="./css/modal_easyLogin.css">
 <link rel="icon" href="./images/favicon.ico" type="image/x-icon" sizes="16x16">
</head>

<body>
  <!-- 헤더 -->
  <header>
    <div class="header">
      <a href="#" class="header-logo">
        <img src="./images/seagull.png">
        <div>잘놀다갑니다</div>
      </a>
      <ul class="header-menu">
        <li><a href="./busanIntroduce.jsp">부산소개</a></li>
        <li><a href="./community.jsp">커뮤니티</a></li>
        <li><a href="javascript:void(0)">소식</a></li>
        <li><a href="javascript:void(0)">포토</a></li>
      </ul>
      <div class="header-login">
        <% if(id != null) { %>
          <b class="login"><%=id %> 님이 로그인 했습니다.</b>
          <a href="setting.jsp">설정</a>
          <input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
        <% } else { %>
          <a href="login.jsp">로그인</a>
          <a href="signup.jsp">회원가입</a>
        <% } %>
      </div>
    </div>
  </header>



  <!-- 메인 -->
  <main>
    <div class="main">
	    <div class="leftSide">
	      <div class="l-sidebar">
	        <div class="l-menu">
	          <a href="./notice.jsp">공지사항</a><i class="fa-solid fa-bullhorn"></i>
	        </div>
	        <div class="l-menu">
	          <a href="./help.jsp">도움말</a><i class="fa-solid fa-circle-question"></i>
	        </div>
	        <div class="l-menu inquiry">
	          <a href="">문의하기</a><i class="fa-solid fa-person-circle-question"></i>
	        </div>
	        <div class="l-menu">
	          <a href="#">설정</a><i class="fa-solid fa-gear"></i>
	        </div>
	      </div>
	    </div>

	<%
		String mobile1 = null;
		String mobile2 = null;
		String mobile3 = null;
		
		for(int i = 0; i < vlist.size(); ++i) {
			
			MemberBean bean = vlist.get(i);			
			
			String mobile = bean.getMobile();
			mobile1 = mobile.substring(0, 3);
			mobile2 = mobile.substring(3, 7);
			mobile3 = mobile.substring(7, 11);
		
		}
	%>

	    <div class="noti-container">
	      <div class="noti-main">
	        <div class="noti-title">설정&nbsp&nbsp<i class="fa-solid fa-gear"></i></div>
	      </div>
	      <ul class="noti-ul">
	        <li>
	          <label  class="noti-list changeNum" for="">
	            <div>비밀번호 변경</div>
	            <i class="fa-solid fa-lock"></i>
	          </label>
	        </li>
	        
	        <li>
	          <label  class="noti-list changePhone" for="">
	            <div>휴대폰 번호 변경</div>
	            <div><%=mobile1%>-<%=mobile2%>-<%=mobile3%></div>
	            <i class="fa-solid fa-phone"></i>
	            </label>
	        </li>
	        
	        <li>
	          <label class="noti-list easyLogin" for="">
	            <div>간편 로그인 설정</div>
	            <div>네이버</div>
	            <i class="fa-solid fa-arrow-right-to-bracket"></i>
	            </label>
	        </li>
	        
	        <li>
	          <label class="noti-list signOut" for="">
	            <div>회원 탈퇴</div>
	            <i class="fa-solid fa-arrow-right-from-bracket"></i>
	          </label>
	        </li>
	        
	      </ul>
	    </div>

  </main>
  
   <footer>
    <div class="footer">
      <div class="footer-information">
        팀장 : 박휘원 | 전화번호 : 010-4623-0195 <br><br>
        팀원 : 송민영 | 전화번호 : 010-8800-3995 <br><br>
        팀원 : 최낙원 | 전화번호 : 010-9753-0266 <br><br>
        팀원 : 최영수 | 전화번호 : 010-6356-2213 <br><br>
      </div>
    </div>
  </footer>

  <!-- 문의모달 -->
  <div class="modal-background inactive">
	<div class="modal-container">
	    <div>
	      
	        <p class="modal-title">문의하기</p>
	        <div class="modal-input">
	          <input type="text" class="modal-email" placeholder="이메일을 입력하세요"></input>
	        </div>
	        <div class="modal-text">
	          <textarea name="" id="" rows="5" maxlength="1000" placeholder="문의 내용을 입력하세요"></textarea>
	        </div>
	        <div class="modal-screen">
	          <p>스크린샷</p>
	          <div class="fileUploadSize">
	            <label class="fileUpload" for="imgFile">
	              <i class="fa-solid fa-folder-open"></i>
	              <input type="file" accept="image/*" id="imgFile">
	              <span style="margin-left: 10px;">파일 추가</span>
	            </label>
	          </div>
	        </div>
	        <div class="modal-bnt">
	          <button class="modal-send-bnt" type="submit">보내기</button>
	          <button class="modal-close">취소</button>
	        </div>
	    
	    </div>
	</div>
  </div>


<!-- 비밀번호 변경 모달 -->
<div class="modal-changeNum-background inactive">
	<div class="modal-changeNum-container">
	  <div>
	    <form name="settingFrm" method="post" action="resetPwProc.jsp">
	      <p class="modal-changeNum-title">비밀번호 변경</p>
	      <div class="modal-changeNum-input">
	        <input type="password" class="" placeholder="변경 할 비밀번호" name="pw"></input>
	      </div>
	      <div class="modal-changeNum-input">
	        <input type="password" class="" placeholder="변경 할 비밀번호 확인"></input>
	      </div>
	      <div class="modal-changeNum-bnt">
	        <button class="modal-changeNum-send-bnt" type="submit">보내기</button>
	        <button class="modal-changeNum-close">취소</button>
	      </div>
	    </form>
	  </div>
	</div>
</div>

<!-- 휴대폰 번호 변경 모달 -->
<div class="modal-changePhone-background inactive">
  <div class="modal-changePhone-container">
	  <div>
	    <form name="settingFrm" method="post" action="resetMobileProc.jsp">
	      <p class="modal-changePhone-title">비밀번호 변경</p>
	      <div class="modal-changePhone-origin">
	        <p>기존 휴대폰 번호</p>
	       <p><%=mobile1%>-<%=mobile2%>-<%=mobile3%></p>
	      </div>
	      <div class="modal-changePhone-input">
	        <input type="text" class="" placeholder="변경 할 휴대폰 번호" name="mobile"></input>
	      </div>
	      <div class="modal-changePhone-bnt">
	        <button class="modal-changePhone-send-bnt" type="submit">보내기</button>
	        <button class="modal-changePhone-close">취소</button>
	      </div>
	    </form>
	  </div>
	</div>
</div>

<!-- 간편로그인 모달 -->
<div class="modal-easyLogin-background inactive">
  <div class="modal-easyLogin-container">
  <div>
    <form action="">
      <p class="modal-easyLogin-title">간편로그인</p>
        <div class="modal-easyLogin-msg">
        <p>현재 연동된 로그인</p>
        </div>
      <div class="modal-easyLogin-input">
        <p>네이버</p>
      </div>
      <div class="modal-easyLogin-bnt">
        <button class="modal-easyLogin-send-bnt" type="submit">연동해제</button>
        <button class="modal-easyLogin-close">취소</button>
      </div>
    </form>
  </div>
</div>
</div>

<!-- 회원탈퇴 모달 -->
<div class="modal-signOut-background inactive">
   <div class="modal-signOut-container">
	  <div>
	    <form name="settingFrm" method="post" action="deleteMemberProc.jsp">
	      <p class="modal-signOut-title">회원 탈퇴</p>
	        <div class="modal-signOut-msg">
	        <p>회원 탈퇴하면 모든 데이터가 삭제됩니다<br>계속 하시겠습니까?</p>
	        </div>
	      <div class="modal-signOut-input">
	        <input type="password" class="" placeholder="비밀번호 입력" name="pw"></input>
	      </div>
	      <div class="modal-signOut-bnt">
	        <button class="modal-signOut-send-bnt" type="submit">보내기</button>
	        <button class="modal-signOut-close">취소</button>
	      </div>
	    </form>
	  </div>
   </div>
</div>

<script src="./js/modal_changeNum.js"></script>
<script src="./js/modal_changePhone.js"></script>
<script src="./js/modal_inquiry.js"></script>
<script src="./js/modal_signOut.js"></script>
<script src="./js/modal-easyLogin.js"></script>

<script src="https://kit.fontawesome.com/536e37fbfc.js" crossorigin="anonymous"></script>

</body>
</html>