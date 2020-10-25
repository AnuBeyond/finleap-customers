$ ->
  _init_customer_table()

_init_customer_table = () ->
  table = $('#customer-datatable').DataTable
    processing: true
    serverSide: true
    order: [0, 'asc']
    ajax:
      url: $('#customer-datatable').data('url')
      data: (d) ->
        d.distance = $('#distance-dropdown').val()
        return

  $("#customer-datatable_filter").prepend('<span class="mr-5">Distance <select id="distance-dropdown"></select></span>')

  distance_values = {
    '100Km': 100,
    '90Km': 90,
    '80Km': 80,
    '70Km': 80,
    '60Km': 80,
    '50Km': 50
  }

  $.each distance_values, (key, value) ->
    $("#distance-dropdown").append(new Option(key, value))
    return

  $(document).on("change", "#distance-dropdown", (e)->
    table.draw()
    e.preventDefault()
    false
  )
