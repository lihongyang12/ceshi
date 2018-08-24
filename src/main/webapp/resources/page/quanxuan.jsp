<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
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
		</script>
		
		<td><input type = "checkbox" class="checkBoxList"></td>
		
		<tr align="center">
			<td colspan="10">
				<input type = "button" id="selectAll" value="全选">
				<input type = "button" id="unSelect" value="全不选">
				<input type = "button" onclick="fx()" value="反选">
			</td>
		</tr>
</body>
</html>