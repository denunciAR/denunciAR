on_load = ->

  $('.endorse').click ->
    id = $(this).data('index')
    url = "/complaints/" + id + "/endorse"
    element = $(this)
    $.ajax(
      type: "POST",
      url: url,
      dataType: "text",
      async: true
    ).done (json) ->
      info = JSON.parse(json)
      element.next().text(info['rating'])
      element.attr("disabled","disabled");
      

$(document).ready on_load