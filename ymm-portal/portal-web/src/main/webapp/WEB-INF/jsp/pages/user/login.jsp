<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo_icon.png" type="image/x-icon" />
    <title>羊咩咩商城登陆 </title>

</head>
<body>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/userStatic/css/login/style.css"/>
<style type="text/css">
    .btn_tab_login {
        float: right;
        margin-top: 48px;
    }

    .btn_tab_login li {
        display: inline-block;
        margin-left: 30px;
        font-size: 14px;
    }

    .btn_tab_login li.cur a {
        color: #d00;
    }
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/userStatic/js/jquery-1.9.1.js"></script>

<div id="header">
    <%--<jsp:include page="top.jsp"/>--%>
    <a href="${pageContext.request.contextPath}/index" class="logo">
        <img  style="width: 160px;height: 60px;" src="${pageContext.request.contextPath}/images/logo/logo.png">
    </a>
</div>

<style type="text/css">
    #weixin_login_container iframe {
        width: 158px;
        height: 158px;
    }
</style>
<div class="login-wrap">
    <div class="wrap clearfix" style="background-image: url('${pageContext.request.contextPath}/userStatic/images/login/background-image.jpg')">

        <div class="form-box fr loginV2" style="display:block;">
            <ul class="form-tab clearfix">
                <li class="tab-li"><a href="javascript:;" tjjj="passport.login_type.wixin_qrcode">微信登录<i
                        class="icon"></i></a></li>
                <li class="tab-li cur"><a href="javascript:;" tjjj="passport.login_type.login_name">账号登录</a></li>
            </ul>
            <div class="form-con">
                <div class="weixin-login" style="display:none;">
                    <div class="wx-box clearfix">
                        <a href="javascript:;" class="wx-img-box">
                            <img class="wx-qrCode" src="${pageContext.request.contextPath}/userStatic/images/login/ming.png"
                                 id="qrCodeImg">
                            <img class="wx-qrCode-logo" src="${pageContext.request.contextPath}/userStatic/images/login/ming.png"
                                 id="qrCodeLogo">
                            <img class="statusImg" src="${pageContext.request.contextPath}/userStatic/images/login/wx-confirm.png"
                                 id="statusImg">
                            <div id="weixin_login_container" style="display:none;"></div>
                        </a>
                        <img src="${pageContext.request.contextPath}/userStatic/images/login/wx-image.png" class="wx-image">
                    </div>
                    <p class="wx-text">微信扫一扫 快速登录</p>
                    <p class="wx-help"><a href="javascript:;" class="help-a">如何使用？</a></p>
                </div>
                <div class="login-normal" style="display:block;">
                    <form id="nameLoginForm" method="post" autocomplete="off" onsubmit="return nameLoginCheck();">
                        <div class="form-error" style=""><i></i><label class="text"></label></div>
                        <dl class="clearfix">
                            <dt>账户名：</dt>
                            <dd><input type="text" value="" name="username" id="normalUser" class="input-text" placeholder="用户名/邮箱/手机号"
                                       autocomplete="off" /><%--<span class="placeholder" >用户名/邮箱/手机号</span>--%></dd>
                        </dl>
                        <dl class="top1 clearfix">
                            <dt>密<em></em>码：</dt>
                            <dd><input type="password" name="password" id="normalPassword" class="input-text" placeholder="请输入密码"><%--<span
                                    placeholder="请输入密码"></span>--%></dd>
                        </dl>

                        <%--<div class="form-remember">

                            <input name="rememberName" type="checkbox" id="remUser" class="rem-check"
                                   style="display:none;" checked="checked">
                        </div>--%>
                        <div class="btn-box clearfix">
                            <input id="normalSubmit" class="btn-settlement" type=submit value="登    录"
                                   tjjj="passport.button.login">

                        </div>
                        <div class="link-box clearfix">
                            <a href="${pageContext.request.contextPath}/pages/user/register" class="register" tjjj="passport.login.fstreg">新用户注册</a>
                            <a href="javascript:;" class="forget-pass" tjjj="passport.forget.password">忘记密码？</a>
                        </div>
                    </form>
                    <div class="login-short clearfix">
                        <div class="short-left">
                            <h3>使用合作账号登录：</h3>
                            <ul class="clearfix">
                                <li class="qq"><a a href="javascript:;" tjjj="passport.login.thd.login.qq"></a></li>
                                <li class="sina"><a href="javascript:;" tjjj="passport.login.thd.login.sina"></a></li>
                                <li class="weixin"><a href="javascript:;" tjjj="passport.login.thd.login.weixin"></a>
                                </li>
                            </ul>
                        </div>
                        <div class="short-right">
                            <h3>您还可以选择：</h3>
                            <p class="phone-short clearfix">
                                <i class="phone"></i>
                                <a href="javascript:;" tjjj="" class="txt phoneLogin">手机快捷登录</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- -快捷登录 -->
        <div class="form-box fr shortLogin" style="display:none;">
            <h5 class="title">快捷登录</h5>
            <div class="form-con">
                <form id="mobileLoginForm" method="post" onsubmit="return mobileLoginCheck();">
                    <div class="form-error" style=""><i></i><label class="text"></label></div>
                    <dl class="clearfix">
                        <dt>手机号：</dt>
                        <dd><input name="mobile" type="text" id="partnerPhone" autocomplete="off"
                                   class="input-text mobile" maxlength="11" onblur="mobileCheck(this);"><span
                                class="placeholder">请输入手机号</span></dd>
                    </dl>
                    <dl class="top2 clearfix">
                        <dt>校验码：</dt>
                        <dd>
                            <input name="code" type="text" id="partnerJym" class="input-jym" maxlength="6"
                                   autocomplete="off"/>
                            <a id="smsSendButton" href="javascript:sendSms(this);" class="span-jym disabled"
                               tjjj="passport.send.msg">发送短信校验码</a>
                        </dd>
                    </dl>
                    <div class="btn-box clearfix">
                        <input id="partnerSubmit" class="btn-settlement" type="submit" value="登    录"
                               tjjj="passport.quick.button.login">

                    </div>
                    <div class="link-box clearfix">
                        <a href="javascript:;" class="backLogin">返回账号登录>></a>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>


<div id="jia_footer">
    <div class="jia_foot_info">
        <div class="jia_foot_con">
            <p class="jia_foot_link">
                <a href="#" rel="nofollow" target="_blank">关于我们</a><span class="jia_split">|</span> <a href="#"
                                                                                                       target="_blank"
                                                                                                       rel="nofollow">联系我们</a><span
                    class="jia_split">|</span> <a href="javascript" target="_blank" rel="nofollow">媒体报道</a><span
                    class="jia_split">|</span> <a href="javascript" target="_blank" rel="nofollow">法律声明</a><span
                    class="jia_split">|</span> <a href="javascript" target="_blank"
                                                  rel="nofollow">企业文化</a><span class="jia_split">|</span> <a
                    href="#" target="_blank" rel="nofollow">友情链接</a><span
                    class="jia_split">|</span> <a href="javascript" target="_blank" rel="nofollow">加盟齐家</a><span
                    class="jia_split">|</span> <a href="javascript" tjjj="sjrz.2" target="_blank"
                                                  rel="nofollow">入驻齐家</a><span class="jia_split">|</span> <a
                    href="#" target="_blank" rel="nofollow">诚聘英才</a><span
                    class="jia_split">|</span> <a href="javascript" target="_blank">网站地图</a><span
                    class="jia_split">|</span> <a href="javascript" rel="nofollow" target="_blank">手机齐家</a><span
                    class="jia_split">|</span> <a href="javascript" target="_blank" rel="nofollow">钱包</a><span class="jia_split">|</span>
                <a href="javascript" tjjj="bottom.link.help">帮助中心</a><span class="jia_split">|</span> <a
                    href="javascript" class="jia_foot_open">更多<i></i></a>
            </p>
            <p class="jia_foot_link footnone">
                <a href="javascript" target="_blank" tjjj="footer.bottom.1">找装修公司</a><span class="jia_split">|</span> <a href="#"
                                                                                                                target="_blank"
                                                                                                                tjjj="footer.bottom.2">买建材家居</a>
            </p>
        </div>
        <p>
            版权所有Copyright ? 2005-2016 www.17sucai.com All rights reserved
        </p>
        <p>
            沪ICP备xxxxxx号 沪B2-xxxx 组织机构代码证：xxxxx—1
        </p>
        <p>
            中国互联网协会信用评价中心网信认证 网信编码:xxxxxx1
        </p>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    var _wx_server_qr_code_count = 0;
    var _wx_server_qr_code_loaded = false;
    var _qr_code_limited = '';
    var _qr_code_wait_time = 20;
    var flashQrCodeWaitingTimer = null;
    var getQrCodeStatusTimer = null;
    var getQrCodeTimer = null;

    function nameLoginCheck() {
        var loginName = $("#nameLoginForm").find("#normalUser").eq(0).val();
        var password = $("#nameLoginForm").find("#normalPassword").eq(0).val();
        /*if ($(".tips ").is(":visible")) {
            return false;
        }*/
        if (loginName == null || loginName == "") {
            showError("请输入用户名");
            return false;
        }
        if (password == null || password == "") {
            showError("请输入密码");
            return false;
        }
        $.ajax({
            type: 'post',
            url: '../../checkLogin',
            data:{"username":$("#normalUser").val(),"password":$("#normalPassword").val()},
            dataType: 'text',
            success: function (rec) {
                if (rec == "0") {
                    showError("用户名或密码错误");
                } else {
                    window.location.href="${pageContext.request.contextPath}/index";
                }
            }
        });
        return false;
    }

    //手机登陆验证
    function mobileLoginCheck() {
        var mobile = $("#mobileLoginForm").find("#partnerPhone").eq(0).val();
        var captch = $("#mobileLoginForm").find("#partnerYzm").eq(0).val();
        if (mobile == null || mobile == '' || !(_mobile_reg).test(mobile)) {
            showError("请填写正确的手机号");
            return false;
        }
        if (captch == null || captch == "" || captch == undefined) {
            showError("请填写验证码");
            return false;
        }
        $("#nameLoginForm").submit();
        return true;
    }

    function mobileCheck(obj) {
        if (!(_mobile_reg).test($("#partnerPhone").val())) {
            showError("请填写正确的手机号");
            return;
        } else {
            closeError();
        }
    }

    //发送短信
    function sendSms(obj) {
        alert("信息已发送  www.ymm.com");
    }

    function captchCheck(obj) {
        if (!(_mobile_reg).test($("#partnerPhone").val())) {
            showError("请填写正确的手机号");
            return;
        }
        var captch = $(obj).val();
        if (captch == '' || captch == null) {
            showError("请填写验证码");
        } else {
            checkCaptch(captch,
                function () {
                    if (!$("#smsSendButton").hasClass("sending")) {
                        $("#smsSendButton").removeClass("disabled");
                    }
                    closeError();
                }, function () {
                    showError("验证码错误");
                    $("#smsSendButton").addClass("disabled");
                }
            );
        }
    }

    $(function () {
        $(".form-tab li").on("click", function () {
            var index = $(this).index();
            $(this).addClass("cur").siblings().removeClass("cur");
            $(".form-con>div").hide().eq(index).show();
            if (index == 0) {
                $(".form-foot").hide();
            } else {
                $(".form-foot").show();
            }
            $(".form-error").hide();
        });
        $(".weixin-login .help-a").hover(
            function () {
                $(".wx-img-box,.wx-image").stop();
                $(this).parents(".weixin-login").find(".wx-img-box").animate({"marginLeft": "15px"}, 300, function () {
                    $(this).parents(".weixin-login").find(".wx-image").animate({"opacity": 1}, 300);
                });
            },
            function () {
                $(".wx-img-box,.wx-image").stop();
                $(this).parents(".weixin-login").find(".wx-image").stop().animate({"opacity": 0}, 300, function () {
                    $(this).parents(".weixin-login").find(".wx-img-box").animate({"marginLeft": "110px"}, 300);
                });
            }
        );


    });

    $('.jia_foot_open').click(function () {
        $('.footnone').slideToggle();
        $(this).find('i').toggleClass('footnow');
    });
    $('.phoneLogin').click(function () {
        $('.loginV2').hide();
        $('.shortLogin').show();
        $('.form-error').hide();
    });
    $('.backLogin').click(function () {
        $('.login-normal').show();
        $('.loginV2').show();
        $('.shortLogin').hide();
        $('.form-error').hide();
    });

    //开启错误提示
    function showError(error) {
        $(".form-error").find("label").html(error);
        $(".form-error").show();
    }
</script>
