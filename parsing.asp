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
response.Redirect("index.asp?from=parsingAuth&info=未授权的用户名或密码")
end if
if strcomp(nr,request.Form("password"))=0 then
response.Write("欢迎你！"&request.Form("username"))
session("username")=request.Form("username")
end if
if session("username")="" then
response.Redirect("index.asp?from=parsingAuth&info=未授权的用户名或密码")
end if
%>

<% if strcomp(request.QueryString("se"),"y")=0 then
session("username")=""
response.Redirect("index.asp?from=parsingAuth&info=您已成功登出")
end if
%>

<%
Function GetHttpPage(HttpUrl)
If IsNull(HttpUrl)=True Or Len(HttpUrl)<18 Or HttpUrl="$False$" Then
GetHttpPage="$False$"
Exit Function
End If
Dim Http
Set Http=server.createobject("MSXML2.XMLHTTP")
Http.open "GET",HttpUrl,False
Http.Send()
If Http.Readystate<>4 then
Set Http=Nothing
GetHttpPage="$False$"
Exit function
End if
GetHTTPPage=bytesToBSTR(Http.responseBody,"utf-8")
Set Http=Nothing
If Err.number<>0 then
Err.Clear
End If
End Function
%>

<%
On Error Resume Next
Server.ScriptTimeOut=9999999
Function getHTTPPage(Path)
t = GetBody(Path)
getHTTPPage=BytesToBstr(t,"GB2312")
End function
Function Newstring(wstr,strng)
Newstring=Instr(lcase(wstr),lcase(strng))
if Newstring<=0 then Newstring=Len(wstr)
End Function
Function BytesToBstr(body,Cset)
dim objstream
set objstream = Server.CreateObject("adodb.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write body
objstream.Position = 0
objstream.Type = 2
objstream.Charset = Cset
BytesToBstr = objstream.ReadText
objstream.Close
set objstream = nothing
End Function
Function GetBody(url)
on error resume next
Set Retrieval = CreateObject("Microsoft.XMLHTTP")
With Retrieval
.Open "Get", url, False, "", ""
.Send
GetBody = .ResponseBody
End With
Set Retrieval = Nothing
End Function
%>

<%
dim websource
websource=GetHttpPage(request.querystring("site"))
%>

<%
response.write ""&websource&""
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
    <strong>小丁工作室-网页缓存系统-V1.0-内测版-ASP自开发版本</strong>
  </p>
  <p class="colorred">XiaodingStudio-WebSite-Cache-System-V1.0-Alpha-ASP-Self-Development-Version</p>
</center>
<p>
  <p1>使用方法说明：</p1>
</p>
<p>1、首先说明一下：由于某些区域没有外网信号，而内网服务器却可以连接外网，所以本人特开发了本套系统！注意：请勿用于其他用途，本系统仅支持文本内容的显示！！ </p>
<p>2、使用时，请按以下格式进行外部网络解析访问。<br>
<strong>格式：这里我以解析百度首页为例，“http://x.x.x.x/xxx/parsing.asp?site=https://www.baidu.com”。</strong><br>
其中，x.x.x.x为你的内网服务器IP地址或域名，xxx为具体存放本程序的路径，parsing为本程序的主程序目录，site=后的内容为您要解析的网址！<br>
<span class="blueStyle">说明：由于某些技术原因，部分页面无法正常解析！诸如腾讯QQ的登录页面、网银登录界面、淘宝网购页面等涉及资产安全的网页！</span><br>
切记，您必须确认您的内网服务器已可以正常连接外网，否则本程序将<span class="colorred"><strong>无法正常工作</strong></span>。</p>
<p>
<center>
Powered By <a href="#showdialog" onClick="MM_popupMsg('亲，本系统由“15电脑高工1班-丁鼎”开发！本系统已屏蔽所有网络游戏入口，珍惜时间，请勿虚度年华哟。（作者是个从来不打游戏的人）')">Xiaoding Studio Alpha</a> QQ:954759397
<a href="parsing.asp?se=y" target="_self">退出系统</a>
</center>
</p>
</body>
</html>
