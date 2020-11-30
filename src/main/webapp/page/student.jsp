<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/17
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="">
    <table border="1" cellpadding="0" cellspacing="0" width="60%">
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>系院专业</th>
            <th>入学时间</th>
            <th>学历</th>
        </tr>
        <c:forEach items="${students }" var="student">
            <tr>
                <td>${student.id }</td>
                <td>${student.sname }</td>
                <td>${student.sex }</td>
                <td>${student.department_major }</td>
                <td>${student.eneter_time }</td>
                <td>${student.education }</td>
                <td><a href="updateServlet?id=${employee.id }">修改</a><a href="deleteServlet?id=${employee.id }">删除</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="3">
                <a href="showServlet?page=1">首页</a>&nbsp;
                <a href="showServlet?page=${currentPage-1 }">上一页</a>&nbsp;
                <a href="showServlet?page=${currentPage+1 }">下一页</a>&nbsp;
                <a href="showServlet?page=${totalPage }">末页</a>&nbsp;
            </td>
        </tr>
    </table>
</form>
</center>
</body>
</html>
