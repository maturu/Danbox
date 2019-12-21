$(document).on('turbolinks:load', function() {
  function readURL(input) {
    if(input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $("#post-prev").css('display', 'block');
        $("#post-caption").css('display', 'inline');
        $("#post-caption-count").css('display', 'inline');
        $("#post-img-prev").css('display', 'inline');
        $("#post-img-prev").attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#post-img").change(function() {
    readURL(this);
  });

  $("#post-toggle").on('click', function() {
    var position = $('#post-toggle').offset();
    console.log(position.left)
    $('.post-form').css('left', position.left-160);
    $(".post-form").slideToggle(function() {
      $("#post-prev").css('display', 'none');
      $("#post-img-prev").css('display', 'none');
      $("#post-caption").css('display', 'none');
      $("#post-caption-count").css('display', 'none');
      $("#post-img-prev").attr('src', "#");
      $("#post-img").val('');
    });
    $(".post-form").toggleClass("active");
  });

  $("#post-caption").keyup(function() {
    var count = $(this).val().length;
    $("#post-caption-count").text(count+"/140");
    if(count == 0){ $("#post-caption-count").text("0/140"); }
  });

  $(document).on("click", ".post-content", function() {
    $("body").css('overflow', 'hidden');
  });

  $(document).on("input", "#comment_content", function() {
    var count = $(this).val().length;
    if(count > 0) {
      $(".submit-comment").css("pointer-events", "auto");
      $(".submit-comment").css("opacity", "1");
    } else {
      $(".submit-comment").css("pointer-events", "none");
      $(".submit-comment").css("opacity", "0.3");
    }
  });

  $(document).click(function(event) {
    if(!$(event.target).closest('.modal-item').length) {
      $("body").css('overflow', 'scroll');
      $('#modal-window').remove();
    }
  });

  $(document).on('click', "a", function(event) {
    $('#modal-window').remove();
  });
});


