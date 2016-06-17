<!-- #include file="access.asp" -->

<%

set rsc=server.createobject("adodb.recordset")
sqlc="select * from info where username='"&session("username")&"' and password='"&session("password")&"'"
rsc.open sqlc,conn,1,1
nr=rsc("password")
username=rsc("username")
password=rsc("password")
sex=rsc("sex")
qq=rsc("qq")
mail=rsc("mail")
add=rsc("add")
personalinfo=rsc("personalinfo")
vv=rsc("ntime")
set rsc=nothing
if nr="" then
response.Redirect("index.asp?from=privateSoftware&info=未授权的用户名或密码")
end if
if strcomp(nr,request.Form("password"))=0 then
response.Write("欢迎你！"&request.Form("username"))
session("username")=request.Form("username")
end if
if session("username")="" then
response.Redirect("index.asp?from=privateSoftware&info=未授权的用户名或密码")
end if
%>

<% if strcomp(request.QueryString("se"),"y")=0 then
session("username")=""
response.Redirect("index.asp?from=privateSoftware&info=您已成功登出")
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>小丁工作室-网页缓存系统-内测版</title>
<style type="text/css">
.colorred {
	color: #F00;
}
.color {
	color: #F00;
	font-size: 18px;
}
.blueStyle {
	color: #00F;
	font-weight: bold;
}
</style>
<script type="text/javascript">
function MM_popupMsg(msg) { //v1.0
  alert(msg);
}
</script>
</head>

<body>
<center>
  <p class="colorred">
    <strong>小丁工作室-私人软件中心-V1.0-内测版-ASP自开发版本</strong>
  </p>
  <p class="colorred">XiaodingStudio-Private-Software-Center-V1.0-Alpha-ASP-Self-Development-Version</p>
</center>
<p>
  <p1><center>
    <a href="ftp://20152707:954759397@ftp.sxschool.com/software" target="_blank">打开文件管理列表
    </a>
  </center></p1>
</p>
<p>
  <center>
Powered By <a href="#showdialog" onClick="MM_popupMsg('亲，本系统由“15电脑高工1班-丁鼎”开发！本系统已屏蔽所有网络游戏入口，珍惜时间，请勿虚度年华哟。（作者是个从来不打游戏的人）')">Xiaoding Studio Alpha</a> QQ:954759397
<a href="privateSoftware.asp?se=y" target="_self">退出系统</a>
</center>
</p>
</body>
</html>
