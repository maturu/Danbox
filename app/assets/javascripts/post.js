$(function() {
  function buildPOSTS(post) {
    var posts = $('#post-view').prepend(
      '<div class="col-sm-4 post-content" data-id='+post.id+'>'+
        '<div class="post-content-img">'+
          '<image src='+post.content.url+'>'+
        '</div>'+
      '</div>'
    );
  }
  $(function() {
    setInterval(update, 10000);
  });

  function update() {
    if($('.post-content')[0]) {
      var post_id = $('.post-content:first').data('id');
    } else {
      var post_id = 0;
    }
    $.ajax({
      url: location.href,
      type: 'GET',
      data: {
        id: post_id
      },
      dataType: 'json'
    })
    .done(function(data) {
      $.each(data, function(i, data) {
        buildPOSTS(data);
      });
    })
    .fail(function() {
      console.log("失敗しました")
    });
  }
});
