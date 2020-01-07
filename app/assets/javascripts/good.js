$( function() {

  $(".link_good").on('click', function(){
    $(this).toggleClass('link_good_r');
    $(this).toggleClass('link_good');
    $(this).children('i').toggleClass('fa fa-heart heart_icon');
    $(this).children('i').toggleClass('fa fa-heart heart_icon_red');
    // var num = $(this).parent().find('.text_box__good_sum').text();
    // var num = num - 1;
    // $(this).parent().find('.text_box__good_sum').text(num);
  })

  // $(".link_good").on('click', function(){
  //   $(this).toggleClass('link_good');
  //   $(this).toggleClass('link_good_r');
  //   $(this).children('i').toggleClass('fa fa-heart heart_icon');
  //   $(this).children('i').toggleClass('fa fa-heart heart_icon_red');
  //   var num1 = $(this).parent().find('.text_box__good_sum').attr("value");
  //   var num1 = num1 + 1;
  //   $(this).parent().find('.text_box__good_sum').text(num1);
  // })
})