 var isDebugMode = false;
    $(function () {
		$('#nameInput').on('blur',nameInputRegFunc);
		$('#dateInput').on('blur',dateInputRegFunc);
		$('#phoneInput').on('blur',phoneInputRegFunc);
		$('#idInput').on('blur',idInputRegFunc);
		$('#pwInput').on('blur',pwInputRegFunc);
		$('#emailInput').on('blur',emailInputRegFunc);
    });
	function nameInputRegFunc(){
		var Regexp = /^[가-힣]{2,4}$/i;
		var inputVal = $('#nameInput').val();
		if(Regexp.test(inputVal)){
			$('#nameInput').removeClass('form-textbox-wrong');
		 }else {
			$('#nameInput').addClass('form-textbox-wrong');
		}
		
	};
	function dateInputRegFunc(){
		var inputVal = $('#dateInput').val();
		console.log(inputVal);
		var Regexp = /^\d{4}년\s\d{2}월\s\d{2}일$/g;
		if(Regexp.test(inputVal)){
			if(isModernDate(inputVal)){
				$('#dateInput').removeClass('form-textbox-wrong');
			} else {
				$('#dateInput').addClass('form-textbox-wrong');				
			}
		} else{
			console.log(1);
			$('#dateInput').addClass('form-textbox-wrong');
		}
	}
	function isModernDate(inputVal){
		var maxDate = "2020년 12월 31일";
		var minDate = "1850년 01월 01일";
		var maxInt = moment(maxDate, 'YYYY년 MM월 DD일').toDate().getTime();
		var minInt = moment(minDate, 'YYYY년 MM월 DD일').toDate().getTime();
		var inputInt = moment(inputVal, 'YYYY년 MM월 DD일').toDate().getTime();
		// minInt<inputInt <maxInt
		return (minInt < inputInt && inputInt < maxInt);
	}
	function phoneInputRegFunc(){
		
	}
	function idInputRegFunc(){
		
	}
	function pwInputRegFunc(){
		
	}
	function emailInputRegFunc(){
		
	}