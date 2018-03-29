<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo_icon.png" type="image/x-icon" />
    <title>ymm商城注册</title>
    <script src="${pageContext.request.contextPath}/userStatic/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/userStatic/css/regester/regester.css"/>
</head>
<body>
<header>
    <a href="#" class="logo">
        <img style="width: 100%;height: 100%" src="${pageContext.request.contextPath}//images/logo/logo.png">
    </a>
    <div class="desc">欢迎注册</div>
</header>
<section>
    <form action="">
        <div class="register-box">
            <label  class="username_label">用 户 名
                <input id="username" maxlength="20" type="text" placeholder="您的用户名和登录名"/>
            </label>
            <div class="tips">

            </div>
        </div>
        <div class="register-box">
            <label class="other_label">设 置 密 码
                <input id="password" maxlength="20" type="password" placeholder="建议至少使用两种字符组合"/>
            </label>
            <div class="tips">

            </div>
        </div>
        <div class="register-box">
            <label  class="other_label">确 认 密 码
                <input maxlength="20" type="password" placeholder="请再次输入密码"/>
            </label>
            <div class="tips">

            </div>
        </div>
        <div class="register-box">
            <label  class="other_label">
                <span>手 机 号</span>
                <input id="mobile_phone" class="phone" maxlength="20" type="text" placeholder="建议使用常用手机"/>
            </label>
            <div class="tips">

            </div>
        </div>
        <div class="register-box">
            <label  class="other_label">验 证 码
                <input maxlength="20" type="text" placeholder="请输入验证码"/>
            </label>
            <span id="code"></span>
            <div class="tips">

            </div>
        </div>
        <div class="arguement">
            <input type="checkbox" id="xieyi"/>
            阅读并同意
            <a href="#">《羊咩咩用户注册协议》</a>
            <a href="#">《隐私政策》</a>
            <div class="tips">

            </div>
        </div>
        <div class="submit_btn">
            <button type="submit" id="submit_btn">立 即 注 册</button>
        </div>
    </form>
</section>

<script src="${pageContext.request.contextPath}/userStatic/js/regester/regester.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>


