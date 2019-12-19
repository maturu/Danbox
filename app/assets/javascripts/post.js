$(function() {
  function buildPOSTS(post) {
    var posts = $('#post-view').prepend(
      '<div class="col-sm-4 post-content" data-id='+post.id+'>'+
        '<div class="post-content-img">'+
          '<form class="button_to" method="post" action="/modal?id='+post.id+'" data-remote="true">'+
            '<button type="submit">'+
              '<image src='+post.content.url+'>'+
            '</button>'+
          '</form>'+
        '</div>'+
      '</div>'
    );
  }

  function buildComment(comment, user) {
    var comments = $('.other-comment').prepend(
      '<div class="post-comment-item" data-id='+comment.id+' data-post_id='+comment.post_id+'>'+
        '<a href="/show?id='+comment.user_id+'">'+
          '<img class="post-user-avatar" src="'+user.avatar.url+'">'+
        '</a>'+
        '<div class="user-txt">'+
          '<a class="post-user-name" href="/show?id='+comment.user_id+'">'+user.username+'</a>'+
          '<p>'+comment.content+'</p>'+
        '</div>'+
      '</div>'
    );
  }

  function ajaxConnectionComment(comment_id, comment_post_id) {
    $.ajax({
      url: location.href,
      type: 'GET',
      data: {
        comment_id: comment_id,
        post_id: comment_post_id
      },
      dataType: 'json'
    })
    .done(function(data) {
      var comment = data.comment;
      var user = data.user
      $.each(comment, function(i, data) {
        buildComment(comment[i], user[i]);
      });
    })
    .fail(function() {
      console.log("失敗しました")
    });
  }

  function ajaxConnectionPost(post_id) {
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

  $(function() {
    setInterval(update, 10000);
  });

  function update() {
    if($('.post-content')[0]) {
      var post_id = $('.post-content:first').data('id');
      ajaxConnectionPost(post_id);
    } else {
      var post_id = 0;
      ajaxConnectionPost(post_id);
    }
    if($('.post-comment-item')[0]) {
      var comment_id = $('.post-comment-item:first').data('id');
      var comment_post_id = $('.post-comment-item:first').data('post_id');
      ajaxConnectionComment(comment_id, comment_post_id);
    } else {
      var comment_id = 0;
      var comment_post_id = post_id;
      ajaxConnectionComment(comment_id, comment_post_id);
    }
  }
});
