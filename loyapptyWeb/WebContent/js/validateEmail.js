var counter = 0;
var interval;
var TimeInterval=5;

function countDown(){
	counter = 0;
	interval = setInterval(function() {
	    counter++;
	    if(counter == TimeInterval){
	    	clearInterval(interval);
			document.location='./main.jsp';
	    }else if (counter % 1 == 0) {
	        $( '#text' ).remove();
	        $( '#validateEmailMiddle' ).append('<span id="text">'+(TimeInterval - counter)+'</span>');
	    } 
	}, 1000);
}

$($.post('jsp/validateEmailPageLogic.jsp',{id:id,
	challenge:challenge},
	function(msg){
	if(msg.result === 'OK'){
		$( '#emailIsValidMsg').fadeIn();
		countDown();
	}else if(msg.result === 'NO'){
		$( '#emailIsNotValidMsg' ).fadeIn();
		countDown();
	}
},"json"));