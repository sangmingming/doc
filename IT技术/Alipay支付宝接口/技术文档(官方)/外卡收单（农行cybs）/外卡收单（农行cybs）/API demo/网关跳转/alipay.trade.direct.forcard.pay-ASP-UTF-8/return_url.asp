<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=utf-8">
<%
' 功能：支付宝页面跳转同步通知页面
' 版本：3.3
' 日期：2012-07-17
' 说明：
' 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
' 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
	
' //////////////页面功能说明//////////////
' 该页面可在本机电脑测试
' 可放入HTML等美化页面的代码、商户业务逻辑程序代码
' 该页面可以使用ASP开发工具调试，也可以使用写文本函数LogResult进行调试，该函数已被默认关闭，见alipay_notify.asp中的函数VerifyReturn
' （该接口的注意事项，如果没有那么该行删除）。
'////////////////////////////////////////
%>

<!--#include file="class/alipay_notify.asp"-->

<%
'计算得出通知验证结果
Set objNotify = New AlipayNotify
sVerifyResult = objNotify.VerifyReturn()

If sVerifyResult Then	'验证成功
	'*********************************************************************
	'请在这里加上商户的业务逻辑程序代码
	
	'——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
    '获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表

	'商户网站唯一订单号
	out_trade_no = Request.QueryString("out_trade_no")
	'对应商户网站的订单系统中的唯一订单号

	'交易状态
	trade_status = Request.QueryString("trade_status")
	'交易目前所处的状态(例如：TRADE_SUCCESS)

	
	'判断是否在商户网站中已经做过了这次通知返回的处理
		'如果没有做过处理，那么执行商户的业务程序
		'如果有做过处理，那么不执行商户的业务程序

	response.Write "验证成功<br>"

	'——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
	
	'*********************************************************************
else '验证失败
    '如要调试，请看alipay_notify.asp页面的VerifyReturn函数，比对sign和mysign的值是否相等，或者检查responseTxt有没有返回true
    response.Write "验证失败"
end if
%>
<title>支付宝国际卡网关支付接口</title>
</head>
<body>
</body>
</html>
