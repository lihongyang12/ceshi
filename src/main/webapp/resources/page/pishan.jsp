<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 批量删除 -->
	<delete id="deleteAll">
		delete from t_watch where sid in (${ids})
	</delete>
	
		int deleteAll(@Param("ids") String ids);
		
	@RequestMapping("deleteAll")
	@ResponseBody
	public boolean deleteAll(String ids){
			watchMapper.deleteAll(ids);
				return true;
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
</body>
</html>