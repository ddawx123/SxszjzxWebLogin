<!-- #include file="access.asp" -->
<%
dim titlename
dim strcmd
dim loginmod
dim aspinfo
strcmd=request.querystring("from")
aspinfo=request.querystring("info")
if strcmd="parsingAuth" then
titlename="上网认证平台-Internet Authentication Platform"
loginmod="login.asp?mod=parsingAuth"
elseif strcmd="homeworkuploader" then
titlename="作业管理系统"
loginmod="login.asp?mod=homeworkuploader"
elseif strcmd="privateSoftware" then
titlename="私人专用软件访问授权系统"
loginmod="login.asp?mod=privateSoftware"
elseif strcmd="downloaderAuth" then
titlename="离线下载内部认证系统"
loginmod="login.asp?mod=downloaderAuth"
else
response.write "<script language=javascript>alert('亲，调用参数非法！请联系此站点管理员解决此问题。管理员QQ:954759397');history.go(-1)</script>"
end if
%>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小丁工作室-网页认证通用接口</title>

<style type="text/css">
<!--
body,td,th {
font-family: 宋体;
font-size: 14px;
}
    #username
    {
        width: 205px;
        background-color: #99FF99;
    }
    #password
    {
        width: 205px;
        background-color: #99FF99;
    }
    .style1
    {
	font-size: large;
	font-weight: bold;
    }
    .style2
    {
        width: 27%;
    }
    .style3
    {
        text-align: right;
    }
    .style4
    {
        color: #FF0000;
    }
	.style5
    {
	font-size: large;
	font-weight: bold;
	color: #F00;
    }
-->
</style>
<script type="text/javascript">
function MM_popupMsg(msg) { //v1.0
  alert(msg);
}
</script>
</head>
<body>
<center>
<p class="style1"><%response.Write(titlename)%></p>
<p class="style5"><%response.Write(aspinfo)%></p>
<form name="form1" method="post" action=<%response.Write(loginmod)%>>
<table border="0" style="width: 33%">
<tr>
<td height="30" class="style2">用户名:</td>
<td width="67%" height="30"><input name="username" type="text" id="username" size="15"></td>
</tr>
<tr>
<td height="30" class="style2">密 码:</td>
<td height="30"><input name="password" type="password" id="password" size="15"></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" name="Submit" value="登录">
  <input type="reset" name="Submit2" value="重置">
  <input name="btnregsiter" type="button" id="btnregsiter" onClick="MM_popupMsg('亲，本站点注册功能已被管理员禁用并采用了人工审核注册机制！要注册，请联系作者QQ：954759397。')" value="注册"></td>
</tr>
<tr>
</tr>
</table>
<br /></form>
    <p>打开本页面时的系统时间： <%=now()%></p>
    <p><span class="style4">本程序由15电脑高工1班-丁鼎（<a href="http://user.qzone.qq.com/954759397">小丁工作室-Xiaoding.Studio</a>）开发，版权所有，侵权必究！版本号：V2.0-内部测试版本 </span></p>
</center>
</body>

</html>
