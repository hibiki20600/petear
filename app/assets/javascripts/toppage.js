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
  
 
})