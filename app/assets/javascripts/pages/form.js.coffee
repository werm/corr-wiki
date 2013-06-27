//= require syntax
//= require showdown
//= require wmd

$(document).on('ready page:load', function(){
  preview_size()

  $("#page_title").keyup(function(){
    var title_text = $(this).val()
    $(".new_page_title").text(title_text)
  })

  $("#highlightCode").click(function(){
    $.SyntaxHighlighter.init({
      lineNumbers: false,
      debug: true
    });
  })

  $('#page_body').keyup(function(){
    preview_size()
  })

  new WMD("page_body", "toolbar",
    preview: "preview"
  )

  $('.wmd-strong').append('<i class="icon-bold"></i>')
  $('.wmd-em').append('<i class="icon-italic"></i>')
  $('.wmd-a').append('<i class="icon-link"></i>')
  $('.wmd-img').append('<i class="icon-picture"></i>')
  $('.wmd-code').append('<i class="icon-code"></i>')
  $('.wmd-ul').append('<i class="icon-list-ul"></i>')
  $('.wmd-ol').append('<i class="icon-list-ol"></i>')
})
preview_size = function(){
  ta_width = $("#page_body").outerWidth()
  ta_height = $("#page_body").outerHeight()
  console.log("w: " + ta_width + " h: " + ta_height)
  $("#preview").css("width", ta_width).css("height", ta_height)
}