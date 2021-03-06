$(document).ready(function() {

  NProgress.start();
  NProgress.done();

  $(document).on('page:fetch',   function() { NProgress.start(); });
  $(document).on('page:change',  function() { NProgress.done(); });
  $(document).on('page:restore', function() { NProgress.remove(); });
 
  $("#pictures").owlCarousel({
    autoPlay: 4000,
    slideSpeed: 600,
    paginationSpeed: 800,
    singleItem: true,
    transitionStyle: "fade"
  });

    $("#gallery-slides").owlCarousel({
        items : 4,
        lazyLoad : true,
        navigation : true
    });

    //for video upload
    var submit_button = $('#submit_pre_upload_form');
    var video_upload = $('#video_upload');
    submit_button.click(function () {
        $.ajax({
            type: 'POST',
            url: '<%= get_upload_token_path %>',
            data: $('#video_pre_upload').serialize(),
            dataType: 'json',
            success: function(response) {
                video_upload.find('#token').val(response.token);
                video_upload.attr('action', response.url.replace(/^http:/i, window.location.protocol)).submit();
                submit_button.unbind('click').hide();
                $('.preloader').css('display', 'block');
            }
        });
    });
});

$('#nav-links li a').click(function() {
   $('#nav-links li').removeClass();
   $($(this).attr('href')).addClass('active');
});

