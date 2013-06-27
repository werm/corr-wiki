$(function() {
  $(document).on('ready page:load', function() {
    var sidebar_pages = $.getJSON('/sidebar/pages', function(page){
    var latest_titles = [];
    $.each(page.pages, function(key, val) {
      latest_titles.push('<li>'
        +'<a href="/pages/'+val.id+'">'+val.title+'</a></li>');
    });
    $('<ul/>', {
      'class': 'side-nav',
      html: latest_titles.join('')
    }).appendTo('#latest');
    });
    $('#infoToggle').click(function(e){
      e.preventDefault()
      $('.meta-info ul').slideToggle('fast');
      $(this).text($(this).text() == '+ Page Info' ? '- Page Info' : '+ Page Info');
    })
    $('textarea').autogrow()
    $(document).foundation();
  });
});