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



  $("#editProductForm")
    .on "ajax:success", (e, data, status, xhr) ->
      alert("走过");
      $('#post-header').html(  data['title'] )
      $('#post-content').html(  data['text'] )


   