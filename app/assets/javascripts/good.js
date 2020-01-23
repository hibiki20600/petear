$( function() {
  var num = 0;
  var num1 = 0;
  $(".link_good_r").on('click', function(){
    $(this).children('i').toggleClass('fa fa-heart heart_icon');
    $(this).children('i').toggleClass('fa fa-heart heart_icon_red');
    var good = $(this).parent().find('.text_box__good_sum').attr("value");
    var good = Number(good);
    $(this).data("click", ++num);
    var click = $(this).data("click")%2;
    if(click == 0){
      $(this).parent().find('.text_box__good_sum').text(good);
    }else{
      var good = good - 1;
      $(this).parent().find('.text_box__good_sum').text(good);
    }

  })

  $(".link_good").on('click', function(){
  $(this).children('i').toggleClass('fa fa-heart heart_icon');
  $(this).children('i').toggleClass('fa fa-heart heart_icon_red');
  var good2 = $(this).parent().find('.text_box__good_sum').attr("value");
  var good2 = Number(good2);
  $(this).data("click", ++num1);
  var click = $(this).data("click") % 2;
  if(click == 0){
    $(this).parent().find('.text_box__good_sum').text(good2);
  }else{
    var good2 = good2 + 1;
    $(this).parent().find('.text_box__good_sum').text(good2);
  }
  })
})