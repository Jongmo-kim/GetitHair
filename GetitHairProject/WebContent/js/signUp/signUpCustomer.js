 var isDebugMode = true;
    $(function () {
        $('.form-textbox').on('focus',formTextboxFocusEvent);
        $('.form-textbox').on('blur',formTextboxBlurEvent);
        $('.dateOfBirth').on('focus click',dateOfBirthFunc);
     $('.form-label').on('click',function(e){
            if(isDebugMode){
                console.log('.inputBox click event');
            }
            var inputTag = $(this).prev();
            $(inputTag).focus();
            return false;
        });
    });
    function formTextboxFocusEvent(e){
        if(isDebugMode){
                console.log('formTextboxFocusEvent is called');
        }
        var nextSpan = $(this).next();
        var inputVal = $(this).val();
        toggleNextSpan(nextSpan,inputVal);
     
    }
    
    function formTextboxBlurEvent(e){
        if(isDebugMode){
                console.log('formTextboxBlurEvent is called');
        }
        var nextSpan = $(this).next();
        var inputVal = $(this).val();
        toggleNextSpan(nextSpan,inputVal);
    }
    function toggleNextSpan(nextSpan,inputVal){
        if ($(nextSpan).is('.label-focused')) {
            if (inputVal == "") {
                $(nextSpan).removeClass('label-focused');
            }
        } else{
            $(nextSpan).addClass('label-focused');
        }
    }
    function dateOfBirthFunc(e){
        if(isDebugMode){
                console.log('dateOfBirthFunc event');
            }
        var inputVal = $(this).val();
        var inputTag = $(this);
        var startpos = this.selectionStart;
        $(this)[0].setSelectionRange(0,0);
        
        if(inputVal == ""){
            $(inputTag).val("yyyy년 mm월 dd일");
            $(inputTag)[0].setSelectionRange(0, 0);
        }
        return false;
    }
    function dateOfBirthFocusOutFunc(){
        var inputVal = $(this).val();
        var inputTag = $(this);
        if(inputVal == "yyyy년 mm월 dd일"){
            $(inputTag).val("");
        }
    }
    function dateOfBirthKeyFunc(e){
        var inputTag = $(this);
        var inputVal = $(this).val();
        var currCursorPosition = this.selectionStart;
        var keycode = e.keyCode;
        if(isDebugMode){
            console.log("currCursorPosition :%d",currCursorPosition);
            console.log("inputVal :%s",inputVal);
            console.log("keyCode :%d",keycode);
        }
        return false;
    }
    $.fn.setCursorPosition = function( pos )
    {
        this.each( function( index, elem ) {
          if( elem.setSelectionRange ) {
            elem.setSelectionRange(pos, pos);
            } else if( elem.createTextRange ) {
               var range = elem.createTextRange();
                range.collapse(true);
                range.moveEnd('character', pos);
                range.moveStart('character', pos);
                range.select();
    }
    });

    return this;
    };