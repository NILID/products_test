$ ->
  last_valid_selection = null
  $('#product_user_ids').change (event) ->
    if $(this).val().length > 3
      $(this).val last_valid_selection
    else
      last_valid_selection = $(this).val()