<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         <c:set var="contextPath" value="${pageContext.request.contextPath}" />
         <c:set var="result" value="${param.result }" />
         <% request.setCharacterEncoding("UTF-8"); %>
            <!DOCTYPE html>
            <html>

            <head>
               <meta charset="UTF-8">
               <title>로그인창</title>
               <c:choose>
                  <c:when test="${result=='loginFailed' }">
                     <script>
                        window.onload = function () {
                           alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
                        }
                     </script>
                  </c:when>
               </c:choose>
               <style>
                  .login1 {
                     border: 1px solid #99e6ff;
                     border-collapse: collapse;
                     border-style: hidden;
                     box-shadow: 0 0 0 1px #99e6ff;
                     border-spacing: 0;
                     border-radius: 15px;
                  }

                  .login2 {
                     font-family: 'Cafe24Supermagic-Bold-v1.0';
                     border: 1px solid #99e6ff;
                     padding: 10px;
                     font-size: 20px;
                     border-radius: 5px;
                  }

                  .login3 {
                     width: 100px;
                     height: 30px;
                     background-color: #99e6ff;
                     color: #0066cc;
                     border: none;
                     border-radius: 5px;
                     font-family: 'Cafe24Supermagic-Bold-v1.0';
                     font-size: 20px;
                  }

                  .login4 {
                     border: 1px solid #99e6ff;
                     width: 150px;
                     height: 30px;
                     border-radius: 5px;

                  }

                  .login5 {
                     font-family: 'Cafe24Supermagic-Bold-v1.0';
                     border: 1px solid #99e6ff;
                     padding: 10px;
                     font-size: 20px;
                     border-radius: 15px 0px 0px 0px;
                     background-color: #b3ecff;
                  }

                  .login6 {
                     font-family: 'Cafe24Supermagic-Bold-v1.0';
                     border: 1px solid #99e6ff;
                     padding: 10px;
                     font-size: 20px;
                     border-radius: 0px 15px 0px 0px;
                     background-color: #b3ecff;
                  }

                  .login7 {
                     font-family: 'Cafe24Supermagic-Bold-v1.0';
                     text-decoration: none;
                     color: #0066cc;
                     text-align: center;
                     font-size: 20px;
                  }

                  @font-face {
                     font-family: 'Cafe24Supermagic-Bold-v1.0';
                     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/Cafe24Supermagic-Bold-v1.0.woff2') format('woff2');
                     font-weight: 700;
                     font-style: normal;
                  }
               </style>
            </head>

            <body>
               <br><br><br><br>
               <form name="frmLogin" method="post" action="${contextPath}/member/login.do">
                  <table class="login1" width="80%" align="center">
                     <tr class="login2" align="center">
                        <td class="login5">아이디</td>
                        <td class="login6">비밀번호</td>
                     </tr>
                     <tr class="login2" align="center">
                        <td class="login2"><input class="login4" type="text" name="id" value="" size="20"></td>
                        <td class="login2"><input class="login4" type="password" name="pwd" value="" size="20"></td>
                     </tr>
                     <tr class="login2" align="center">
                        <td class="login2" colspan="2">
                           <input class="login3" type="submit" value="로그인"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <input class="login3" type="reset" value="다시입력">
                        </td>
                     </tr>
                  </table><br>
                  <a class="login7" href="${contextPath}/member/memberForm.do">회원가입하기</a>
               </form>
            </body>

            </html>