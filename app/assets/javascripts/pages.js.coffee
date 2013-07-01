//= require showdown
//= require rainbow

$(window).load ->
  page_id = $('#page_id').text()
  converter = new Showdown.converter();

  $.getJSON "/pages/"+page_id+".json", (data) ->
    latest = converter.makeHtml(data.version.body[1]);
    prev = converter.makeHtml(data.version.body[0]);
    $('#latest_text').append(latest)
    $('#previous_text').append(prev)
    
    $('#diffs').prettyTextDiff();

  Rainbow.color ->
    console.log('the new blocks are now highlighted!');