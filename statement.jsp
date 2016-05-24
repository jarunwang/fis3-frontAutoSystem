<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<c:set var="basePath" value="${pageContext.request.contextPath}/"></c:set>

<%
    //第三方lib版本号
    String VERSION_TYPE_BASE = "1.3";
    String VERSION_TYPE_MUI = "1.2";
    String VERSION_TYPE_COMMON = "1.7";

    //本系统版本号
    String VERSION_TYPE_BAITIANOA = "2016041401";


    /* =================== for test 发版需注释掉 =================== */

/*    long times = (new Date()).getTime();

    String VERSION_TYPE_BAITIANOA = times + "";*/

    /* =================== for test =================== */


%>

<input type="hidden" type="text/javascript" id="version" value="/static/js/projects/login.js?=@varsion"/>
<script type="text/javascript">
    var muiVersion = "<%= VERSION_TYPE_MUI %>";
    var baseVersion = "<%= VERSION_TYPE_BAITIANOA %>";
    var commonVersion = document.getElementById("version").value.split("?=")[1];
</script>

