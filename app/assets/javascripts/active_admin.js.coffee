#= require active_admin/base

$ ->
	$(document).on 'change', '.avatar-select', ->
		full_path = window.URL.createObjectURL(this.files.item(0))
		$(this).siblings().attr('src', full_path)
	$(document).on 'click', '.button.has_many_add', ->
		$('.has_many_remove').closest('.has_many_fields').find('.avatar-select').removeClass('hidden')
