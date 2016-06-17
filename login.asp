<!-- #include file="access.asp" -->
<%
dim strcmd
strcmd=request.querystring("mod")
if strcmd="homeworkuploader" then
'打开数据库判断用户是否存在,info为表名,username为字段名
set rsc=server.createobject("adodb.recordset")
sqlc="select * from info where username='"&request.Form("username")&"' and password='"&request.Form("password")&"'"
rsc.open sqlc,conn,1,1
session("username")=rsc("username")
session("password")=rsc("password")
session.Timeout=10
set rsc=nothing
response.Redirect("change.asp")
'如果用户不存在,session("username")为空
elseif strcmd="parsingAuth" then
set rsc=server.createobject("adodb.recordset")
sqlc="select * from info where username='"&request.Form("username")&"' and password='"&request.Form("password")&"'"
rsc.open sqlc,conn,1,1
session("username")=rsc("username")
session("password")=rsc("password")
session.Timeout=10
set rsc=nothing
response.Redirect("parsing.asp")
elseif strcmd="privateSoftware" then
set rsc=server.createobject("adodb.recordset")
sqlc="select * from info where username='"&request.Form("username")&"' and password='"&request.Form("password")&"'"
rsc.open sqlc,conn,1,1
session("username")=rsc("username")
session("password")=rsc("password")
session.Timeout=10
set rsc=nothing
response.Redirect("privateSoftware.asp")
elseif strcmd="downloaderAuth" then
set rsc=server.createobject("adodb.recordset")
sqlc="select * from info where username='"&request.Form("username")&"' and password='"&request.Form("password")&"'"
rsc.open sqlc,conn,1,1
session("username")=rsc("username")
session("password")=rsc("password")
session.Timeout=10
set rsc=nothing
response.Redirect("download.asp")
else
response.write "<script language=javascript>alert('亲，调用参数非法！请联系此站点管理员解决此问题。管理员QQ:954759397');history.go(-1)</script>"
end if
%>
