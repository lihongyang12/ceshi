<script type="text/javascript">
	$(function(){
		
		$.post(
			'arelist',
			function(obj){
				for(var i in obj){
					$("#arid").append("<option value='"+obj[i].area_id+"'>"+obj[i].aname+"</option>")
				}
			},"json"
			
		)
			
		
	});
	
	function arelist(){
		//清空下拉
		$("[name=did]").empty();
		var id=$("#arid").val();
		$.post(
			"address",
			{id:id},
			function(obj){
				for(var i in obj){
					$("[name=did]").append("<option value='"+obj[i].did+"'>"+obj[i].address+"</option>")
				}
			},"json"
		)
	}
</script>

<tr>
				<td>
					所在区域:<select id="arid" onchange="arelist()">
							
							</select>
				</td>
			</tr>
			
			<tr>
				<td>
					所在地址:<select name="did">
								
							</select> 
				</td>
			</tr>