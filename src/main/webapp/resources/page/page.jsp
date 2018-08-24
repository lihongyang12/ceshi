<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<tr>
			<td colspan="10">
				当前${pageUtil.currentPage }/${pageUtil.lastPage }共${pageUtil.count }记录
				<input type = "button" onclick="fenye(1)" value="首页">
				<input type = "button" onclick="fenye(${pageUtil.prevPage })" value="上一页">
				<input type = "button" onclick="fenye(${pageUtil.nextPage })" value="下一页">
				<input type = "button" onclick="fenye(${pageUtil.lastPage })" value="尾页">
			</td>
		</tr>
		
		function fenye(page){
		$("[name=page]").val(page);
		$("#myform").submit();
	}
<form action="list" method="post" id="myform">
			<input type="hidden" name="page">
			<input name="start" value="${param.start}">
			<input name="end" value="${param.end}">
			<input type = "text" name="lname" value="${param.lname }">
			<input type = "submit" value="查询">
		</form>

//导出所有数据
	   function exportExcel(){
		   $.post('./exceportExcle',function(data){
			   if(data>0){
				   alert("导出成功！");
			   }
		   });
	   }

@RequestMapping("exceportExcle")
	@ResponseBody
	public int exceportExcle(){
		String [] headersName={"编号","名称","上架时间","商品描述","商品价格"};
		String [] headersId = {"sid","sname","createtime","miao","price"};
		List<Shop> dtoList = iShopService.elist();
		ExportExcel<Shop> export = new ExportExcel<Shop>();
		int i = export.exportExcel("信息", headersName, headersId, dtoList, "E://用户.xls");
		return i; 
	}

</body>
</html>