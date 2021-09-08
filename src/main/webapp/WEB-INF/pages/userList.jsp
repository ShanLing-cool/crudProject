<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/myScript.js"></script>
    <link href="${pageContext.request.contextPath}/static/js/layui/css/layui.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/myCss.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="header">
    <h1>SSM-CRUD项目</h1>
    <div class="search">
        <div class="layui-input-block search_user">
            <input type="text" name="selectUser"
                   placeholder="请输入你查询的用户id或者姓名" class="layui-input search_text">
            <button type="button" class="layui-btn layui-btn-warm" onclick="search()">查询</button>
        </div>
        <div class="user_button">
            <button type="button" class="layui-btn" onclick="add()">添加用户</button>
            <button type="button" class="layui-btn layui-btn-danger">删除用户</button>
        </div>
    </div>
</div>

<div class="user_table">
    <table class="layui-table user_table_main" lay-skin="line" style="background-color: rgba(0,0,0,0.1);">
        <colgroup>
            <col width="15%">
            <col width="15%">
            <col width="15%">
            <col width="20%">
            <col width="15%">
            <col width="5%">
            <col width="5%">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>
                <input type="checkbox" name="like[write]" title="写作">
            </th>
            <th>id</th>
            <th>&nbsp;&nbsp;姓名</th>
            <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话</th>
            <th>身份</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${roleList}" var="role">
            <tr>
                <td>
                    <input type="checkbox" name="like[write]" title="写作">
                </td>
                <td>${role.id}</td>
                <td>${role.roleName}</td>
                <td>${role.rolePhone}</td>
                <td>${role.roleIdentity}</td>
                <td>
                    <button class="layui-btn layui-btn-normal">编辑</button>
                </td>
                <td>
                    <button class="layui-btn layui-btn-danger" onclick="confirmRole(${role.id})">删除</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="footer">
    <div class="record">
        <span>当前第1页，共有1000页，总计20000条记录</span>
    </div>
    <div class="record_btn">
        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm">首页</button>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm"><<</button>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm">1</button>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm">2</button>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm">3</button>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm">>></button>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm">尾页</button>
    </div>
</div>
<script>
    layui.use('layer', function () {
        var layer = layui.layer;
        var form = layui.form;

        successTip = function () {
            layer.alert('添加成功', {icon: 1});
        }
        failTip = function () {
            layer.alert('添加失败', {icon: 1});
        }

        confirmRole = function (id) {
            layer.open({
                content: '你确认要删除此行记录吗？',
                btn: ['确认', '取消'],
                yes: function (index) {
                    location.href = "${pageContext.request.contextPath}/user/deleteRole?id=" + id;
                    layer.close(index);
                }
            });
        }

        add = function () {
            layer.open({
                type: 1,
                resize: false,
                area: ['630px', '360px'], //宽高
                content: '<form class="layui-form" style="margin-top:40px;\n' +
                    '            margin-left: 30px;">\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">姓名</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="roleName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input" style="width: 350px">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">电话</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="rolePhone" required  lay-verify="required|phone|number" placeholder="请输入电话" autocomplete="off" class="layui-input" style="width: 350px">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">选择框</label>\n' +
                    '        <div class="layui-input-block" style="width: 350px">\n' +
                    '            <select name="roleIdentity" lay-verify="required">\n' +
                    '                <option value=""></option>\n' +
                    '                <option value="0">买家</option>\n' +
                    '                <option value="1">骑手</option>\n' +
                    '            </select>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <button class="layui-btn" lay-submit lay-filter="formDemo">保存</button>\n' +
                    '            <button type="reset" class="layui-btn layui-btn-primary">重置</button>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '</form>\n'
            });
        }

        //监听提交
        form.on('submit(formDemo)', function (data) {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/saveRole",
                data: data.field,
                success: function () {
                    successTip();
                }
            });
            return false;
        });
    });

</script>
</body>
</html>
