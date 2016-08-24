# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 
jQuery ->
  $(".update").click ->
  	_this = $(this)
  	$('#editPostFormModal').modal('show')
  	$('#editPostTitle').val(_this.attr('data-title'))
  	$('#editPostText').val(_this.attr('data-text'))
  	$('#editPostForm').attr('action', '/posts/' + _this.attr('data-id'))




  $("#editPostForm")
    .on "ajax:success", (e, data, status, xhr) ->
     #alert(data.text)
     $('#editPostFormModal').modal('hide')
     $('#post-header'+data.id).html(data.title)
     $('#post-content'+data.id).html(data.text)
    
    
    

   