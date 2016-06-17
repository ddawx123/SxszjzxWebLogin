# SxszjzxWebLogin
web认证与外网伪翻墙模块

具体功能说明：

access.asp-用于连接数据库，关于数据库，后面有额外的说明。

change.asp-已注册用户的信息修改，包括密码修改等。

download.asp-离线下载模块，用于操纵有外网访问权限的目标服务器下载指定的文件。（已加入认证）

index.asp-用户登录主界面（已做多参数调用，详细请查看源代码。如果不添加多参数，会提示必须添加）

login.asp-用于接受用户登陆主界面传递参数后取得输入的用户名和密码，并进行认证信息合法性校对。如果校对通过，则授予合法的session并根据来源参数跳转到指定页面！（同上，已加参数调用机制）

parsing.asp-网页离线转发模块，用于解析指定的html外网网页。参数site，即parsing.asp?site=https://www.baidu.com，即显示百度。（已加入认证）

privateSoftware.asp-用于私人软件下载区域的认证，由于该区域本人在校内ftp服务器通过web.config进行了防盗链配置，拒绝非法用户随意下载此asp所在目录下的文件！


注：Access数据库uinfo.mdb由于国内网速原因，尚未上传。所以会发生无法正常登录的现象！
如果需要数据库，请联系本源码作者，本人邮箱：ddawx123@outlook.com，QQ：954759397，新浪微博：http://weibo.com/ddawx123

2016.6.17-更新源码 小丁工作室出品
