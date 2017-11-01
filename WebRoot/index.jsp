<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>完整demo</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>
<body>
<div>
	<form action="servlet/UeditorServlet" method="post" target="_black">
	    <h1>完整demo</h1>
	    <script id="editor" type="text/plain" style="width:1024px;height:300px;" name="myContent">
		</script>
	    <button type="submit">提交</button>
	</form>
</div>
<!--<div id="btns">
	<button onclick="getContent()">获得内容</button>
</div>
-->
<div>
    <h2 style="color:red;">将输入内容保存成json文件</h2>
    <input type="button" style="color:red;font-size:30px;" value="保存">
    <!-- <form action="index.php" method="post">
        <span>姓名:</span><input type="text" name="username"><br />
        <span>密码:</span><input type="password" name="password"><br />
        <input type="submit">
    </form> -->
</div>
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
    
    /*将输入框的内容保存成json文件*/
    var eleButton = document.querySelector('input[type="button"]');

        // 下载文件方法
        var funDownload = function (content, filename) {
            var eleLink = document.createElement('a');
            eleLink.download = filename;
            eleLink.style.display = 'none';
            // 字符内容转变成blob地址
            var blob = new Blob([content]);
            eleLink.href = URL.createObjectURL(blob);
            // 触发点击
            document.body.appendChild(eleLink);
            eleLink.click();
            // 然后移除
            document.body.removeChild(eleLink);
        };

        if ('download' in document.createElement('a')) {
            // 作为test.html文件下载
            eleButton.addEventListener('click', function () {
                funDownload(UE.getEditor('editor').execCommand( "getlocaldata" ), 'test.json');    
            });
        } else {
            eleButton.onclick = function () {
                alert('浏览器不支持');    
            };
        }
 
</script>

</script>
<!--  <script type="text/javascript">
	function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(ue.getContent());
        alert(arr.join("\n"));
    }
</script>-->
</body>
</html> 