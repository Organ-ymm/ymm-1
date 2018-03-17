layui.extend({
    admin: '{/}../../static/js/admin'
});
layui.use(['table','form', 'jquery', 'admin'], function () {
    var table = layui.table,
        $ = layui.jquery,
        form = layui.form,
        admin = layui.admin;

    table.render({
        elem: '#goodsList', //指定元素
        cellMinWidth: 80,
        cols: [
            [{
                type: 'checkbox'
            }, {
                field: 'goods_id', title: '编号', width:60, align :'center'
            }, {
                field: 'goods_name', title: '商品名称', width:90, align :'center'
            }, {
                field: 'cat_name', title: '分类名称', width:90, align :'center'
            }, {
                field: 'goods_sn', title: '商品货号', width:90, align :'center'
            }, {
                field: 'click_count', title: '点击数', align :'center'
            }, {
                field: 'brand_name', title: '品牌', width:60, align :'center'
            }, {
                field: 'goods_number', title: '库存', width:60, align :'center'
            }, {
                field: 'market_price', title: '市场售价', width:90, align :'center'
            }, {
                field: 'shop_price', title: '本店售价', width:90, align :'center'
            }, {
                field: 'promote_price', title: '促销价格', width:90, align :'center'
            }, {
                field: 'keywords', title: '关键字', align :'center'
            }, {
                field: 'goods_brief', title: '简短描述', width:90, align :'center'
            }, {
                field: 'goods_desc', title: '详细描述', width:90, align :'center'
            }, {
                field: 'goods_img', title: '实际图片', width:90, align :'center'
            }, {
                field: 'goods_thumb', title: '缩略图', align :'center'
            }, {
                field: 'add_time', title: '添加时间', width:90, align :'center'
            }, {
                field: 'is_new', title: '新品', templet: '#newTpl', unresize: true, align :'center'
            }, {
                field: 'is_hot', title: '热销', templet: '#hotTpl', unresize: true, align :'center'
            }, {
                field: 'give_integral', title: '赠送积分', width:90, align :'center'
            }, {
                field: 'status', title: '状态', unresize: true, width:60, align :'center'
            }, {
                field: 'operate', title: '操作', toolbar: '#operateTpl', unresize: true,  align :'center'
            }]
        ],
        //通过URL进行数据绑定
        url: '../../goods/goodslist',
        //是否开启分页
        page: true,
        limits: [10, 50, 100],
        done: function (res, curr, count) {
            $("#countData").text("共有数据：" + count + " 条");
            $("[data-field='status']").children().each(function () {
                //每次遍历进来得到的this就是DOM对象
                //DOM--JQ===$(this)
                //JQ--DOM===[0],get(0)
                if ($(this).text() == '1') {
                    //正常
                    $(this).text('正常');
                } else if ($(this).text() == '2') {
                    //下架
                    $(this).text('下架');
                }
            });
            // $("[data-field='is_hot']").children().each(function () {
            //     //每次遍历进来得到的this就是DOM对象
            //     //DOM--JQ===$(this)
            //     //JQ--DOM===[0],get(0)
            //     if ($(this).text() == '1') {
            //         //正常
            //         $(this).text('是');
            //     } else if ($(this).text() == '2') {
            //         //下架
            //         $(this).text('否');
            //     }
            // });
            // $("[data-field='is_new']").children().each(function () {
            //     //每次遍历进来得到的this就是DOM对象
            //     //DOM--JQ===$(this)
            //     //JQ--DOM===[0],get(0)
            //     if ($(this).text() == '1') {
            //         //正常
            //         $(this).text('是');
            //     } else if ($(this).text() == '2') {
            //         //下架
            //         $(this).text('否');
            //     }
            // });
        }
    });
    /*监听switch事件*/
    // table.on('templet(goodsList)', function (obj) {
    //     var data = obj.data //获得当前行数据
    //         , layEvent = obj.event; //获得 lay-event 对应的值
    //     if (layEvent === 'is_new') {
    //         layer.msg('test new ');
    //     } else if (layEvent === 'edit') {
    //         layer.msg('test edit ');
    //     }
    // });

    // form.on('switch(switch_new)', function (data) {
    //     layer.mag();
    // });

    var active = {
        is_new : function () {
            layer.msg("请先选择");
        },
        Recommend: function() {
            // var checkStatus = table.checkStatus('articleList'),
            //     data = checkStatus.data;
            // if(data.length > 0) {
                layer.msg("您点击了推荐操作");
            //     for(var i = 0; i < data.length; i++) {
            //         console.log("a:" + data[i].recommend);
            //         data[i].recommend = "checked";
            //         console.log("aa:" + data[i].recommend);
            //         form.render();
            //     }
            //
            // } else {
            //     console.log("b");
            //     layer.msg("请先选择");
            // }

            //$(".layui-table-body .layui-form-checked").parents('tr').children().children('input[name="zzz"]').attr("checked","checked");
        },
        getCheckData: function () { //获取选中数据
            var checkStatus = table.checkStatus('goodsList'),
                data = checkStatus.data;
            if (data.length > 0) {
                // layer.msg(data[0].goods_id);
                layer.confirm('确认要删除吗？', function (index) {
                    //在前台页面把选中数据删除：找到所有被选中的
                    $(".layui-table-body .layui-form-checked").parents('tr').remove();
                    //形成一个ID的数组
                    var ids = [];
                    for (var i = 0; i < data.length; i++) {
                        ids.push(data[i].goods_id);
                    }
                    //发出异步的请求去后台
                    //发出异步请求
                    $.post(
                        //url
                        '../../goods/batch',
                        //data
                        {'ids[]': ids}
                        //success
                        // function (data) {
                        //     console.log(data);
                        // }
                    );
                    //提示用户删除成功
                    layer.msg('删除成功', {
                        icon: 1
                    });
                    location.reload();
                });
            } else {
                layer.msg("请先选择需要删除的商品！");
            }
        }
    };

    $('.weadmin-block .layui-btn').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    // $('.layui-form-switch').on('change', function() {
    //     var type = $(this).data('type');
    //     active[type] ? active[type].call(this) : '';
    // });

    /*商品-删除*/
    window.goods_del = function (obj) {
        layer.confirm('确认要删除吗？', function (index) {
            var id = $(obj).parents("tr").children("[data-field='goods_id']").text();
            //提交ajax
            $.ajax({
                data: {'id': id},
                dataType: "text",
                type: "GET",
                url: "../../goods/goods_del",
                success: function (res) {
                    if (res>0) {
                        layer.msg('已删除!', {
                            icon: 1,
                            time: 1000
                        });
                    } else {
                        layer.msg('删除失败!', {
                            icon: 2,
                            time: 1000
                        });
                    }
                }
            });

        });
    }


});
