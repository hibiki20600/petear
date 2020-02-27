$( function() {
  //最初の
  var first = function(){
      $('.toppage').addClass('fadeout');
    };
    setTimeout(first, 2800);
  //スクロールvertical
  function showElementAnimation() {
  
    var element = document.getElementsByClassName('js-animation');
    if(!element) return; 
  

    var showTiming = window.innerHeight > 768 ? 150 : 40; 
    var scrollY = window.pageYOffset;
    var windowH = window.innerHeight;
  

    for(var i=0;i<element.length;i++) { 
      var elemClientRect = element[i].getBoundingClientRect(); 
      var elemY = scrollY + elemClientRect.top;
      if(scrollY + windowH - showTiming > elemY) {
        element[i].classList.add('is-show');
        
      } else if(scrollY + windowH < elemY) {
        // 上にスクロールして再度非表示にする
        element[i].classList.remove('is-show');
      }
    }

  }

  //実装
  showElementAnimation();
  window.addEventListener('scroll', showElementAnimation);

  $('.contents__tag_box__group_box').hover(
    function() {
      $(this).addClass('js-border');
    }, function(){
      $(this).removeClass('js-border');
    });
  
    // 画像表示
    //$(".photo").hover(function(){
    //  $(this).attr("id", "photo");
    //}, function(){
    //  $(this).attr("id", "nil");
    //})
    //function photoFade() {
    //  $('#photo li:first').clone(true).appendTo('#photo');
    //  $('#photo li:last').css({ opacity:'0'})
    //  $('#photo li:last').animate({ opacity:'1' },{ duration:1500, complete:function(){
    //  $('#photo li:first').remove()
    //  }
    //  });
    // }
    //setInterval(function(){
    //  photoFade();
    //}, 3000);
  
    // テキスト
    $(".contents__tag_box__group_box__text__title_name").textillate({
      initialDelay: 4000,
      loop: true,
      in:{
        effect: 'swing',
        sequence: true
      },
      out:{
        effect: 'swing',
        reverse: true
      }
    });

  $(".tag").on("click", function(e){
    e.preventDefault();
    $(".vibration-stop").toggleClass("vibration");
    $(this).toggleClass("tag-stop");
    $(".u_tag_update").animate({ top:'300px' },{ duration:300 } )
    $(".new-tag-box").css({
      display:"block"
    })
    $(".no_u_tags__title").css({
      display:"none"
   })
  })

  $(".tag-stop").on("click", function(e){
    e.preventDefault();
    $(".vabration").toggleClass("vibration-stop");
    $(this).toggleClass("tag");
    $(".new-tag-box").css({
       display:"hidden"
    })
  })


  


})