

function sort_click(btn){
 	//获取点击按钮的内容
 	var value = btn.value;
 	//获取分类输入框	
 	var sort = document.getElementById("sort");
 	//设置分类值
 	sort.value=value;
 	var sort_btns=document.getElementsByClassName("sort-btn");
 	for(var i=0;i<sort_btns.length;i++)
 		{
 		sort_btns[i].style.background="#ffffff";
 		sort_btns[i].style.color="#000000";
 		}
 	btn.style.background="#337ab7";
 	btn.style.color="#ffffff";

 }
 function tags_click(btn){	
	//获取点击按钮的内容
	var value = btn.value;
	//获取标签输入框	
	var tags = document.getElementById("tags");
	//获取标签已有的值	
	var tags_value = tags.value;
	//判断是否已经包含
	if(tags_value.indexOf(value) > -1)return ;
	// 
	//var split;
	//if(tags_value.length() != 0){
	//split = ",";
	//}
	//新增新的值
	tags.value = tags_value+" "+value;
	
 }

