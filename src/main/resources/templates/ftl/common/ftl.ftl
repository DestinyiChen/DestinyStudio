<#macro head>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="/static/img/destinystudio/destinystudio.png"/>

    <script src="//msite.baidu.com/sdk/c.js?appid=1607555818012515"></script>

    <meta name="viewport" content="width=480">

    <script src="/static/plugin/jquery/jquery-3.3.1.js"></script>
    <script src="/static/plugin/jquery/jquery-validation-1.17.0/dist/jquery.validate.js"></script>

    <script src="/static/plugin/layer/layer.js"></script>

    <link href="/static/plugin/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <script src="/static/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <link href="/static/css/destinystudio.css" rel="stylesheet"/>

    <#if dev?? && !dev>
        <script src="http://push.zhanzhang.baidu.com/push.js"></script>
        <script>
            (function (e) {
                function t(e) {
                    var t = location.href, n = t.split("").reverse(), r = e.split(""), i = [];
                    for (var s = 0, o = 16; s < o; s++) i.push(r[s] + (n[s] || ""));
                    return i.join("")
                }

                var n = /([http|https]:\/\/[a-zA-Z0-9\_\.]+\.so\.com)/gi, r = e.location.href;
                if (r && !n.test(r) && window.navigator.appName) {
                    var i = "//s.360.cn/so/zz.gif", o = '4fa07aa68b83750165673987e0f9552b', u = t(o), a = new Image;
                    r && (i += "?url=" + encodeURIComponent(r)), o && (i += "&sid=" + o), u && (i += "&token=" + u), o && (a.src = i)
                }
            })(window);
        </script>
    </#if>
    <#nested>
</head>
</#macro>

<#macro body>
<body>
    <#nested>
</body>
</html>
</#macro>

<#macro bg_canvas>
<canvas id="bg_canvas"></canvas>
<script src="/static/js/bg_01.js"></script>
</#macro>

<#macro top_panel_div>
<div class="ml0 mr0 min_w100 container">
    <div class="row">
        <div class="tal col-xs-4 col-sm-4">
            <img class="ds_icon" src="/static/img/destinystudio/destinystudio.png">
            <#--<span class="ds_span nowrap">Destiny Studio</span>-->
        </div>
        <div class="tar col-xs-8 col-sm-8 padding_15px font_family_wryh">
            &nbsp;
            <a class="a_light nowrap" href="/"><span class="span_icon glyphicon glyphicon-home"></span>首页</a>
            &nbsp;
            <a class="a_light nowrap" href="javascript:donate()">
                <span class="span_icon glyphicon glyphicon-usd"></span>捐赠
            </a>
            &nbsp;
            <script>
                function donate() {
                    var width, height, title;

                    console.log('window.innerWidth:' + window.innerWidth);
                    console.log('window.innerHeight:' + window.innerHeight);

                    if (window.innerWidth >= window.innerHeight) {
                        width = '800px';
                        height = '600px';
                        title = false;
                    } else {
                        width = '400px';
                        height = '600px';
                        title = '捐赠';
                    }

                    layer.open({
                        type: 2,
                        title: title,
                        area: [width, height],
                        content: '/donate'
                    });
                }

                function logout() {
                    layer.confirm(
                            '确定要退出登录吗？',
                            {title: '提示', btn: ['确定', '取消']},
                            function (index) {
                                $.ajax({
                                    type: "post",
                                    url: "/logout",
                                    success: function () {
                                        layer.close(index);
                                        location.href = '/logout';
                                    }
                                });
                            }
                    );
                }
            </script>
        </div>
    </div>
</div>
</#macro>

<#macro friendLinks>
    <#if flList?? && (flList?size > 0)>
    <div class="div_fl">
        <span class="span_fl">友情链接：</span>
        <#list flList as item>
            <span class="span_fl"><a class="a_light nowrap" href="${item.link}">${item.linkName}</a></span>
        </#list>
    </div>
    </#if>
</#macro>

<#macro index_bottom>
<div class="div_miitbeian">
    <span class="span_miitbeian">ICP主体备案号：<a href="http://www.miitbeian.gov.cn/">津ICP备18004720号</a></span>
    <span class="span_miitbeian">网站备案号：<a href="http://www.miitbeian.gov.cn/">津ICP备18004720号-1</a></span>
</div>
<#--<div class="div_verify">-->
    <#--<a href="http://webscan.360.cn/index/checkwebsite/url/destinystudio.cn">-->
        <#--<img border="0" src="http://webscan.360.cn/status/pai/hash/7faafc6d113365c4c924713a1fc4329a"/>-->
    <#--</a>-->
<#--</div>-->
<div style="background-color: white; padding-left: 17px; padding-right: 17px;">
    <script>cambrian.render('body')</script>
</div>
</#macro>