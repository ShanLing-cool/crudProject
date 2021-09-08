<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/loginCss.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
</head>
<body>
<div class="container right-panel-active">
    <!-- Sign Up -->
    <div class="container__form container--signup">
        <form action="${pageContext.request.contextPath}/user/login" class="form" id="form1" method="post">
            <h2 class="form__title">Sign Up</h2>
            <span class="warning_words">${param.warning}</span>
            <input type="text" placeholder="User" class="input" name="username"/>
            <input type="password" placeholder="Password" class="input" name="password"/>
            <button class="btn" type="submit">Sign Up</button>
        </form>
    </div>

    <!-- Sign In -->
    <div class="container__form container--signin">
        <form action="${pageContext.request.contextPath}/user/saveUser" class="form" id="form2">
            <h2 class="form__title">Sign In</h2>
            <input type="text" placeholder="Username" class="input" name="usernameIn"/>
            <input type="password" placeholder="Password" class="input" name="passwordIn"/>
            <button class="btn" type="submit" id="form2btn">Sign In</button>
        </form>
    </div>

    <!-- Overlay -->
    <div class="container__overlay">
        <div class="overlay">
            <div class="overlay__panel overlay--left">
                <button class="btn" id="signIn">Sign In</button>
            </div>
            <div class="overlay__panel overlay--right">
                <button class="btn" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $.get({
            url: "${pageContext.request.contextPath}/user/getImage",
            success: function (data) {
                $("body").css("background-image", "url('" + data + "')");
                $("body").css("background-size", "cover");
            }
        });
        const signInBtn = document.getElementById("signIn");
        const signUpBtn = document.getElementById("signUp");
        const container = document.querySelector(".container");

        signInBtn.addEventListener("click", () => {
            container.classList.remove("right-panel-active");
        });

        signUpBtn.addEventListener("click", () => {
            container.classList.add("right-panel-active");
        });

        layui.use('layer', function () {
            var layer = layui.layer;

            success = function () {
                layer.alert('注册成功！', {icon: 1});
            }
        });
    })
</script>
</body>
</html>
