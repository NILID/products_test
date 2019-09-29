$ ->
  last_valid_selection = null
  $('#product_user_ids').change (event) ->
    if $(this).val().length > 3
      $(this).val last_valid_selection
    else
      last_valid_selection = $(this).val()

  check_to_hide_or_show_add_link = ->
    if $('#help-blocks .nested-fields').length == 4
      $('.add_fields').hide()
    else
      $('.add_fields').show()

  $('#help-blocks').on 'cocoon:after-insert', ->
    check_to_hide_or_show_add_link()
  $('#help-blocks').on 'cocoon:after-remove', ->
    check_to_hide_or_show_add_link()
  check_to_hide_or_show_add_link()