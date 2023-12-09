<%--
  Created by IntelliJ IDEA.
  User: gudtj
  Date: 2023-12-03
  Time: 오전 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>검색 폼 예시</title>
</head>
<body>

<div class="txt_view actionTxtType3">
  <div class="view_tit">Basic Python</div>
  <div class="line_bg"></div>
  <div class="view_txt">OTT 추천 알고리즘<br />
    어떤 OTT를 사용할지 고민하지 마세요!<br />
    인원수와 제목을 검색하시면 저희 알고리즘이
    <br />여러분들에게 OTT를 추천해 드립니다.</div>
</div>

<a href="javascript:;" class="actionBtn6" onclick="performSearch()">
    <span class="hover">
        <span class="txt">검색하기</span>
    </span>
</a>

<script>
  function performSearch() {
    // 검색어 입력 필드의 값을 가져옵니다.
    var query = document.querySelector('input[name="query"]').value;

    // 시청 인원 수를 가져옵니다.
    var numberOfMembers = document.getElementById('numberOfMembers').value;

    // 검색 URL을 구성합니다.
    var searchUrl = "${pageContext.request.contextPath}/search?query=" + encodeURIComponent(query) + "&numberOfMembers=" + numberOfMembers;

    // 검색 URL로 이동합니다.
    window.location.href = searchUrl;
  }
</script>

<form action="${pageContext.request.contextPath}/search" method="get">
  <label>
    <input type="text" name="query" placeholder="검색어 입력">
  </label>

  <label for="numberOfMembers">시청 인원 수:</label>
  <select id="numberOfMembers" name="numberOfMembers">
    <option value="1">1명</option>
    <option value="2">2명</option>
    <option value="3">3명</option>
    <option value="4">4명</option>
  </select>
</form>

<a class="actionBtn3" href="javascript:;" onclick="redirectToHelloServlet()">
  <span class="back">팀원 소개</span>
  <span class="front">팀원 소개</span>
</a>

<script>
  function redirectToHelloServlet() {
    // 파라미터 값을 URL로 인코딩합니다.
    var query = encodeURIComponent("팀 Basic Python 팀원 소개");

    // "helloServlet" 페이지로 이동하고 query 파라미터를 전달합니다.
    window.location.href = "helloServlet";
  }
</script>

</body>

<style>
  .txt_view {
    overflow:hidden;
    position:relative;
    width:978px;
    height:300px;
    border:1px solid #444;
    background-color:#fff;
    box-sizing:border-box;
    -webkit-box-sizing:border-box;
    -moz-box-sizing:border-box;
  }
  .actionTxtType3 {
    padding:76px 0;
    text-align:center;
  }
  .actionTxtType3 .view_tit{
    padding-bottom:15px;
    font-size:35px;
    line-height:35px;
    text-transform:uppercase;
    font-weight:700;
    text-shadow:1px 1px 10px rgba(68,68,68,0.4);
    opacity:0;
    transform:translateY(30%);
    -webkit-transform:translateY(30%);
    -moz-transform:translateY(30%);
    -ms-transform:translateY(30%);
    transition:all .35s;
    -webkit-transition:all .35s;
    -moz-transition:all .35s;
  }
  .actionTxtType3 .line_bg {
    width:16%;
    height:5px;
    background-color:#e09738;
    margin:0 auto;
    margin-bottom:20px;
    opacity:0;
    transform:scaleX(0);
    -webkit-transform:scaleX(0);
    -moz-transform:scaleX(0);
    -ms-transform:scaleX(0);
    transition:transform .25s .35s,opacity .2s;
    -webkit-transition:-webkit-transform .25s .35s,opacity .2s;
    -moz-transition:-moz-transform .25s .35s,opacity .2s;
  }
  .actionTxtType3 .view_txt {
    opacity:0;
    transform:translateY(30%);
    -webkit-transform:translateY(30%);
    -moz-transform:translateY(30%);
    transition:all .35s .6s;
    -webkit-transition:all .35s .6s;
    -moz-transition:all .35s .6s;
  }
  .actionTxtType3:hover .view_tit{
    opacity:1;
    transform:translateY(0);
    -webkit-transform:translateY(0);
    -moz-transform:translateY(0);
    -ms-transform:translateY(0);
  }
  .actionTxtType3:hover .line_bg{
    opacity:1;
    transform:scaleX(1);
    -webkit-transform:scaleX(1);
    -moz-transform:scaleX(1);
    -ms-transform:scaleX(1);
  }
  .actionTxtType3:hover .view_txt{
    opacity:1;
    transform:translateY(0);
    -webkit-transform:translateY(0);
    -moz-transform:translateY(0);
    -ms-transform:translateY(0);
  }


  .actionBtn6 {
    position: relative;
    display: block;
    width: 166px;
    height: 40px;
    margin: 3cm auto 0; /* 3cm 아래로 이동 */
    margin-left: 20cm; /* 왼쪽으로 3cm 이동 */
    text-decoration: none;
  }

  /* 나머지 스타일 유지 */
  .actionBtn6 .hover .txt {
    display: block;
    width: 160px;
    color: #fff;
    background-color: #4c4c4d;
    text-align: center;
    margin: 0 auto;
    line-height: 34px;
    font-size: 14px;
    font-family: oswald;
    text-transform: uppercase;
  }

  .actionBtn6 .hover:after {
    display: block;
    position: absolute;
    top: -5px;
    left: -2px;
    content: "";
    width: 100%;
    height: 40px;
    border: 2px solid #4c4c4d;
    transition: transform 0.2s;
    -webkit-transition: -webkit-transform 0.2s;
    -moz-transition: -moz-transform 0.2s;
  }

  .actionBtn6:hover .hover:after {
    transform: scale(1.06, 1.25);
    -webkit-transform: scale(1.06, 1.25);
    -moz-transform: scale(1.06, 1.25);
  }



  .actionBtn3 {
    display:block;
    width:166px;
    height:38px;
    margin:auto;
    text-align:center;
    -webkit-transition:all .3s ease;
    -moz-transition:all .3s ease;
    transform-style:preserve-3d;
    margin-left: 20cm; /* 왼쪽으로 3cm 이동 */
    -webkit-transform-style:preserve-3d;
  }
  .actionBtn3 .front,.actionBtn3 .back {
    position:absolute;
    display:block;
    width:166px;
    height:38px;
    border:1px solid #4c4c4d;
    line-height:40px;
    transition:all .5s;
    -webkit-transition:-webkit-transform .5s;
    -moz-transition:-moz-transform .5s;
    color:#4c4c4d;
    font-size:14px;
    font-family:oswald;
    text-decoration:none;
    text-transform:uppercase;
  }
  .actionBtn3 .front {
    background-color:#fff;
    transform:translateZ(19px);
    -webkit-transform:translateZ(19px);
    -moz-transform:translateZ(19px);
  }
  .actionBtn3 .back {
    background-color:#4c4c4d;
    color:#fff;
    transform:rotateX(-90deg) translateZ(19px);
    -webkit-transform:rotateX(-90deg) translateZ(19px);
    -moz-transform:rotateX(-90deg) translateZ(19px);
  }
  .actionBtn3:hover {
    transform:rotateX(90deg);
    -webkit-transform:rotateX(90deg);
    -moz-transform:rotateX(90deg);
  }


  /* 검색어 입력 필드 스타일 */
  input[type="text"] {
    width: 8cm;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    background-color: #fff;
    color: #333;
    top: -1.5cm; /* 위로 1cm 이동 (음수 값으로 조정) */
  }

  /* label 스타일 */
  label {
    display: inline-block;
    width: 6cm;
    margin-top: 1cm;
    text-align: right;
    padding-right: 1em;
    font-size: 16px;
  }

  /* select 스타일 */
  #numberOfMembers {
    width: 10%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    background-color: #fff;
    color: #333;
  }

  /* select 요소에서 option 스타일 */
  #numberOfMembers option {
    padding: 5px;
    font-size: 16px;
  }

  /* select 요소에서 선택된 option 스타일 */
  #numberOfMembers option:checked {
    background-color: #007bff;
    color: #fff;
  }

  /* 미디어 쿼리: 화면 너비가 768px 미만인 경우 */
  @media (max-width: 767px) {
    /* 검색어 입력 필드 스타일 수정 */
    input[type="text"] {
      width: 100%; /* 너비를 100%로 설정하여 가로 폭을 꽉 채웁니다. */
      top: 0; /* 이동값 제거 */
    }

    /* label 스타일 수정 */
    label {
      width: 100%; /* 너비를 100%로 설정하여 가로 폭을 꽉 채웁니다. */
      text-align: left; /* 텍스트를 왼쪽으로 정렬합니다. */
      margin-top: 0; /* 이동값 제거 */
      padding-right: 0; /* 오른쪽 여백 제거 */
    }

    /* select 스타일 수정 */
    #numberOfMembers {
      width: 100%; /* 너비를 100%로 설정하여 가로 폭을 꽉 채웁니다. */
    }
  }

</style>
</html>

