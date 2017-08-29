/**
 * 
 */
// input 태그들의 값이 비어있으면 false를 반환한다.
// 해당 input태그가 비었다면 형제 .error를 화면에 나타나도록 처리한다.
function checkInputEmpty($obj){
	var count = 0;	
	$obj.each(function(i, element) {// i : index, element : object
		if($(element).val() ==""){						
			var $next = $(element).next(".error");
			$next.css("display","inline");
			count++;
		}		
	});
	if(count > 0)
		return false;
	return true;
}
