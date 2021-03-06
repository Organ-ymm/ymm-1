<%--
  Created by IntelliJ IDEA.
  User: 金城武
  Date: 2018/3/19
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加订单-后台管理系统-Admin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../static/css/font.css">
    <link rel="stylesheet" href="../../static/css/weadmin.css">
    <script src="../../lib/layui/layui.js" charset="utf-8"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="weadmin-body">
    <form class="layui-form" id="addBrand">
        <div class="layui-form-item">
            <label for="brand_id" class="layui-form-label">
                <span class="we-red">*</span>品牌编号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="brand_id" name="brand_id" required="" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="brand_name" class="layui-form-label">
                <span class="we-red">*</span>品牌名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="brand_name" name="brand_name" required="" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="we-red">*</span>分类</label>
            <div class="layui-input-inline">
                <select name="category" id="category" required="" lay-verify="required" lay-filter="category">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>


        <div class="layui-form-item">
            <label for="country" class="layui-form-label">
                <span class="we-red">*</span>品牌归属地
            </label>
            <div class="layui-input-inline">
                <input type="text" id="country" name="country" required="" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="brand_desc" class="layui-form-label">
                <span class="we-red">*</span>品牌描述
            </label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" id="brand_desc" name="desc" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="status" class="layui-form-label">
                商品状态
            </label>
            <div class="layui-input-inline" id="status">
                <input type="radio" name="status" value="1" title="上架" checked>
                <input type="radio" name="status" value="2" title="下架" >
            </div>
        </div>

        <div class="layui-form-item">

            <button class="layui-btn" lay-filter="edit" lay-submit="">确定</button>
        </div>

    </form>
</div>
<script>
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['form', 'admin', 'jquery', 'table', 'layer'], function() {
        var form = layui.form,
            admin = layui.admin,
            $ = layui.jquery,
            table = layui.table,
            layer = layui.layer;
        loadCategory();
        //失去焦点时判断值为空不验证，一旦填写必须验证
        $('input[name="brand_name"]').blur(function(){
            //这里是失去焦点时的事件
            if($('input[name="brand_name"]').val()){
                //console.log($('input[name="email"]').val());
                $('input[name="brand_name"]').attr('lay-verify','brand_name');
            }else{
                $('input[name="brand_name"]').removeAttr('lay-verify');
            }
        });
        function loadCategory() {
            //去后台查询所有的分类信息
            $.ajax({
                data: {'value': 12},
                dataType: "json",
                type: "GET",
                url: "${pageContext.request.contextPath}/category/categorySelect",
                success: function (data) {

                    var category = document.getElementById("category");
                    for (var i = 0; i < data.length; i++) {
                        //将后台返回的json格式的分类信息,逐个添加到select中option
                        var option = document.createElement("option");
                        option.setAttribute("value", data[i].cat_id);
                        option.innerText = data[i].cat_name;
                        category.appendChild(option);
                        form.render('select');
                    }
                }
            });
        }


        //监听提交
        form.on('submit(edit)', function(data) {
            $.ajax({
                data:$("#editbrand").serialize(),
                dataType:"text",
                type:"post",
                url:"${pageContext.request.contextPath}/brand_edit",
                success:function (res) {
                    if (res>0) {
                        layer.alert("修改成功", {icon: 6}, function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }else{
                        layer.alert("修改失败", {icon: 5}, function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }

                }
            });
            return false;

        });

    });
</script>
</body>

</html>