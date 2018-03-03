#= require active_admin/base

$ ->
 $('.avatar-select').change ->
  full_path = window.URL.createObjectURL(this.files.item(0))
  $('.dog-image').attr('src', full_path )
  $('#animal_photo_url').val(full_path)