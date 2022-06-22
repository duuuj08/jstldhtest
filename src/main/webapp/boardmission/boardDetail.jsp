<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
request.setCharacterEncoding("utf-8");

String bno=request.getParameter("c");

%>

<% 
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
	
Class.forName (driver);
Connection conn=DriverManager.getConnection(url,user,pw);
//접속성공
//String sql ="select * from notices where seq="+seq;
String sql ="select * from board where bno=?";

//Statement st=conn.createStatement();
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, bno);

//ResultSet rs=st.executeQuery(sql);//stmt형식 실행 select 실행
ResultSet rs=pstmt.executeQuery();//pstmt형식 실행
rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDetail.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<h3>boardDetail.jsp</h3>

<table class="twidth">
	<colgroup>
		<col width="15%"/>
		<col width="20%"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<caption>Detail</caption>
	<tbody>
		<tr>
			<th class="left">글번호</th>
			<td><%=rs.getString("bno") %></td>
			<th class="left">조회수</th>
			<td><%=rs.getInt("bcnt") %></td>
		</tr>
		<tr>
			<th class="left">제목</th>
			<td colspan="3" id="bsubj">
				<%=rs.getString("bsubj") %>
			</td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td colspan="2" id="cccc"><%=rs.getString("bwriter") %></td>
			<th class="left">작성시간</th>
			<td colspan="2" id="cccc"><%=rs.getDate("bdate") %></td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="5" id="content" name="bmemo">
			<%=rs.getString("bmemo") %></td>
		</tr>
	</tbody>



</table>

<div>
<a href="boardEdit.jsp?c=<%=rs.getString("bno") %>">수정</a>
<a href="boardDelProc.jsp?c=<%=rs.getString("bno") %>">삭제</a>
<a href="board.jsp">목록</a>
</div>


</body>
</html>

<%
rs.close();
//st.close();
pstmt.close();

conn.close();
%>
