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

  $(".post-content").click(function() {
    $("#modal-window").css('display', 'flex');
    $("body").css('overflow', 'hidden');
    $("#modal-window .modal-item-action").css('display', 'inline');
    $("#modal-window").html($(this).prop('outerHTML'));
    $("#modal-window").fadeIn(200);
  });
});

$(document).click(function(event) {
  if(!$(event.target).closest('.modal-item').length) {
    $("body").css('overflow', 'scroll');
    $("#modal-window").fadeOut(200);
  }
});
