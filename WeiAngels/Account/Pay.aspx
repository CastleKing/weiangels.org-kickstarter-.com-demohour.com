<%@ page language="C#" autoeventwireup="true" inherits="Account_Pay, App_Web_pay.aspx.dae9cef9" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>正在跳转到支付平台 - 微天使</title>
</head>
<body>
    <form id="payform" action="<%=Configs.Gateway %>" method="post">
    <input type="hidden" name="inputCharset" id="inputCharset" value="<%=ReqOrder.getInputCharset()%>" />
    <input type="hidden" name="pickupUrl" id="serverUrl" value="<%=ReqOrder.getPickupUrl()%>" />
    <input type="hidden" name="receiveUrl" id="receiveUrl" value="<%=ReqOrder.getReceiveUrl()%>" />
    <input type="hidden" name="version" id="version" value="<%=ReqOrder.getVersion() %>" />
    <input type="hidden" name="language" id="language" value="<%=ReqOrder.getLanguage() %>" />
    <input type="hidden" name="signType" id="signType" value="<%=ReqOrder.getSignType()%>" />
    <input type="hidden" name="merchantId" id="merchantId" value="<%=ReqOrder.getMerchantId()%>" />
    <input type="hidden" name="payerName" id="payerName" value="<%=ReqOrder.getPayerName()%>" />
    <input type="hidden" name="payerEmail" id="payerEmail" value="<%=ReqOrder.getPayerEmail()%>" />
    <input type="hidden" name="payerTelephone" id="payerTelephone" value="<%=ReqOrder.getPayerTelephone() %>" />
    <input type="hidden" name="pid" id="pid" value="<%=ReqOrder.getPid() %>" />
    <input type="hidden" name="orderNo" id="orderNo" value="<%=ReqOrder.getOrderNo() %>" />
    <input type="hidden" name="orderAmount" id="orderAmount" value="<%=ReqOrder.getOrderAmount() %>" />
    <input type="hidden" name="orderCurrency" id="orderCurrency" value="<%=ReqOrder.getOrderCurrency() %>" />
    <input type="hidden" name="orderDatetime" id="orderDatetime" value="<%=ReqOrder.getOrderDatetime() %>" />
    <input type="hidden" name="orderExpireDatetime" id="orderExpireDatetime" value="<%=ReqOrder.getOrderExpireDatetime() %>" />
    <input type="hidden" name="productName" id="productName" value="<%=ReqOrder.getProductName() %>" />
    <input type="hidden" name="productPrice" id="productPrice" value="<%=ReqOrder.getProductPrice() %>" />
    <input type="hidden" name="productNum" id="productNum" value="<%=ReqOrder.getProductNum() %>" />
    <input type="hidden" name="productId" id="productId" value="<%=ReqOrder.getProductId() %>" />
    <input type="hidden" name="productDescription" id="productDescription" value="<%=ReqOrder.getProductDescription() %>" />
    <input type="hidden" name="ext1" id="ext1" value="<%=ReqOrder.getExt1() %>" />
    <input type="hidden" name="ext2" id="ext2" value="<%=ReqOrder.getExt2() %>" />
    <input type="hidden" name="payType" id="payType" value="<%=ReqOrder.getPayType() %>" />
    <input type="hidden" name="issuerId" id="issuerId" value="<%=ReqOrder.getIssuerId() %>" />
    <input type="hidden" name="srcMsg" id="srcMsg" value="<%=ReqOrder.getSrc() %>" />
    <input type="hidden" name="signMsg" id="signMsg" value="<%=ReqOrder.doSign()%>" />
    </form>
    <script type="text/javascript">
        document.getElementById("payform").submit();
    </script>
</body>
</html>
