<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/resources/inc/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function(){
		$("#selectAll").click(function(){
			$(".checkBoxList:checkbox").attr("checked",true);
		});
	});
	
	$(function(){
		$("#unSelect").click(function(){
			$(".checkBoxList:checkbox").attr("checked",false);
		});
	});
	
	function fx(){
		$(".checkBoxList").each(function(){
			$(this).prop("checked",!$(this).prop("checked"))
		})
	}
	
	//批量删除
	function toAllDel() {
		var ids="";
		$(".checkBoxList:checked").each(function(){
			ids+=","+$(this).val();
		});
		if(ids.length>0){
			ids=ids.substring(1);
			if(confirm("确认要删除id为"+ids+"的数据")){
				$.post('deleteAll',{ids:ids},function(obj){
					if(obj>0){
						alert("删除成功");
						location="list";
					}else{
						alert("删除失败");
					}	
				});
				}
		}else{
			alert("至少选择一条数据");
		}
	}
	
	function toadd(){
		location="toadd";
	}
	
	function fenye(page){
		$("[name=page]").val(page);
		$("#myform").submit();
	}
</script>
<body>
		<form action="list" method="post" id="myform">
			<input type="hidden" name="page">
			<input name="start" value="${param.start}">
			<input name="end" value="${param.end}">
			<input type = "text" name="lname" value="${param.lname }">
			<input type = "submit" value="查询">
		</form>
	<table class="table table-bordered table-hover table-stripe table-condensed">
		<tr>
			<td></td>
			<td>编号</td>
			<td>书名</td>
			<td>价格</td>
			<td>作者</td>
			<td>照片</td>
			<td>出版时间</td>
			<td>出版社</td>
			<td>
				<input type= "button" onclick="toadd()" value="天牛啊">
			</td>
		</tr>
		<c:forEach items="${blist }" var="b">
			<tr>
				<td><input type = "checkbox" class="checkBoxList"></td>
				<td>${b.id }</td>
				<td>${b.bname }</td>
				<td>${b.price }</td>
				<td>${b.author }</td>
				<td>
					<img  src="<%=basePath%>/resources/upload/${b.photo}" width="70px" height="70px">
				</td>
				<td>${b.createtime }</td>
				<td>${b.press.pname}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="10">
				当前${pageUtil.currentPage }/${pageUtil.lastPage }共${pageUtil.count }记录
				<input type = "button" onclick="fenye(1)" value="首页">
				<input type = "button" onclick="fenye(${pageUtil.prevPage })" value="上一页">
				<input type = "button" onclick="fenye(${pageUtil.nextPage })" value="下一页">
				<input type = "button" onclick="fenye(${pageUtil.lastPage })" value="尾页">
			</td>
		</tr>
		
		<tr align="center">
			<td colspan="10">
				<input type = "button" id="selectAll" value="全选">
				<input type = "button" id="unSelect" value="全不选">
				<input type = "button" onclick="fx()" value="反选">
				<input type="button" value="批量删除"  onclick="toAllDel()">
			</td>
		</tr>
	</table>
</body>
</html>