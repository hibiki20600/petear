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
  
  // $(function() {
  //   $('#view').tridView({useMouse: true});
  //   $('#box').trid({z:-1000});
  //   $('#box1').trid({rx:90,y:-600});
  //   $('#box2').trid({rx:-90,y:600});
  //   $('#box3').trid({ry:90,x:600});
  //   $('#box4').trid({ry:-90,x:-600});
  //   $('#box5').trid({rz:180,z:-600});
  //   $('#box6').trid({rz:0,z:600});
  //   a = 0;
  //   window.setInterval(function() {
  //     $('#box').trid({rz:a+=0.1,rx:a*0.77,ry:a*1.13});
  //     $.tridTick();
  //   },1);
  // });

    
})