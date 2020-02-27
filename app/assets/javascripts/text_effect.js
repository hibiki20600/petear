$( function(){
  $(".toppage__text").textillate({
    in:{
      effect: 'bounceIn',
      sequence: true
    }
  });

  $(".header__right__li").textillate({
    in:{
      effect: 'fadeInLeftBig',
      delay: 50,
      reverse: true
    }
  });

  $(".header__title").textillate({
    in:{
      effect: 'rotateInUpRight',
      delay: 100,
      reverse: true
    }
  });

  $(".chat_header__left__title").textillate({
    in:{
      effect: 'bounceIn',
      delay: 50,
      sequence: true
    }
  });

  $(".show_group__header__left__title").textillate({
    in:{
      effect: 'bounceIn',
      delay: 50,
      sequence: true
    }
  });

  $(".owner").textillate({
    in:{
      effect: 'swing',
      delay: 30,
      sequence: true
    }
  });
  $(".member").textillate({
    in:{
      effect: 'swing',
      delay: 40,
      sequence: true
    }
  });
  // mypage 
  $(".my_page_header__right__list").textillate({
    in:{
      effect: 'fadeInLeft',
      sequence: true
    }
  });
  $(".user_introduce__box__name_box").textillate({
    in:{
      effect: 'fadeInLeft',
      sequence: true
    }
  });
  $(".user_introduce__box__comment_box").textillate({
    initialDelay: 700,
    in:{
      effect: 'fadeInLeft',
      sequence: true
    }
  });
  $(".group").textillate({
    loop: true,
    initialDelay: 700,
    in:{
      effect: 'fadeInLeft',
      sequence: true
    },
    out:{
      effect: 'hinge',
      sequence: true
    }
  });
  $(".header__title").textillate({
    in:{
      effect: 'rotateInUpRight',
      delay: 100,
      reverse: true
    }
  });
  $(".chat_header__right__li").textillate({
    in:{
      effect: 'bounceIn',
      sequence: true
    }
  });

  $(".belongs_to_group__box__text__title_name").textillate({
    initialDelay: 5000,
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
  
})
