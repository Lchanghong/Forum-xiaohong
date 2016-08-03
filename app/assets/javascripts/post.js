$('#new_reply_form').on('submit', function(event){
    $.ajax({url: $(this).prop('action'), dataType: 'json', /* more option */} 
    )
})