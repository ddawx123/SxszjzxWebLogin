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
response.Redirect("index.asp?from=downloaderAuth&info=未授权的用户名或密码")
end if
if strcomp(nr,request.Form("password"))=0 then
response.Write("欢迎你！"&request.Form("username"))
session("username")=request.Form("username")
end if
if session("username")="" then
response.Redirect("index.asp?from=downloaderAuth&info=未授权的用户名或密码")
end if
%>

<% if strcomp(request.QueryString("se"),"y")=0 then
session("username")=""
response.Redirect("index.asp?from=downloaderAuth&info=您已成功登出")
end if
%>

<%
dim act, fileUrl, fileName 
act=request.QueryString("act") 
if(act="do") then  
 fileUrl=request.Form("fileUrl") 
 if(fileUrl="") then
 response.write("Can't download this file,Please check this url again.")
 else
 fileName=mid(fileUrl,instrrev(fileUrl,"/")+1) 
 extPos=instrrev(fileName,"?") 
 if(extPos>0) then 
  fileName=left(fileName,extPos-1) 
 end if 
 call SaveRemoteFile(fileUrl, fileName) 
 end if
end if 

Function SaveRemoteFile(RemoteFileUrl, LocalFileName)
SaveRemoteFile=True
  dim Ads,Retrieval,GetRemoteData
  Set Retrieval = Server.CreateObject("Microsoft.XMLHTTP")
  With Retrieval
    .Open "Get", RemoteFileUrl, False, "", ""
    .Send
If .Readystate<>4 then
SaveRemoteFile=False
Exit Function
End If
    GetRemoteData = .ResponseBody
  End With
  Set Retrieval = Nothing
  Set Ads = Server.CreateObject("Adodb.Stream")
  With Ads
    .Type = 1
    .Open
    .Write GetRemoteData
    .SaveToFile server.MapPath(LocalFileName),2
    .Cancel()
    .Close()
  End With
  Set Ads=nothing
end Function
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>内网文件离线下载程序</title>
<script type="text/javascript">
function logoff(){
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
</script>
</head>

<body>
<form name="form1" method="post" action="?act=do"> 
  <p align="center"><strong>内网文件离线下载程序_v1.0_Internal Development Version</strong></p>
  <p align="center">键入要保存的远程目标文件URL：
    <input name="fileUrl" type="text" size="70"> 
  </p>
  <p align="center">温馨提示：本系统下载文件时会将目标对象直接下载到本程序所在目录。</p>
  <p align="center">下载过程中由于本人flash技术原因，无法实现进度条动态呈现，所以下载时，本程序会发生假死。下载完毕后本程序会自动刷新页面！</p>
  <p align="center">本程序由小丁工作室开发，内部使用版本。</p> 
  <p align="center"> 
    <input type="submit" name="Submit" value="提交下载请求"> 
    <input type="reset" name="Submit2" value="重新填写">
    <input type="button" name="button" id="button" value="退出系统" onClick="window.location.href='download.asp?se=y';">
  </p> 
</form> 
</body>
</html>
