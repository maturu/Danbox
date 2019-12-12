$(document).on('turbolinks:load', function() {
  function readURL(input) {
    if(input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $("#post-prev").css('display', 'block');
        $("#post-img-prev").css('display', 'initial');
        $("#post-img-prev").attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#post-img").change(function() {
    readURL(this);
  });

  $("#post-toggle").on('click', function() {
    $(".post-form").toggle(function() {
      $("#post-prev").css('display', 'none');
      $("#post-img-prev").css('display', 'none');
      $("#post-img-prev").attr('src', "#");
      $("#post-img").val('');
    });
  });
});
