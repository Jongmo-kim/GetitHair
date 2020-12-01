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
		var Regexp = /^[가-힣]{2,4}+$/;
		var inputVal = $('#nameInput').val();
		if(Regexp.test(inputVal)){
			$('#nameInput').addClass('form-textbox-wrong');
		}
	};
	function dateInputRegFunc(){
		var inputVal = $('#dataInput').val();
		$('#nameInput').addClass('form-textbox-wrong');
		//YYYY'년'MM'월'DD'일'
	}