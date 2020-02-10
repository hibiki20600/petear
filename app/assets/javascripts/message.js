$( function(){

  function AddMessage(message) {
    var image = message.image ? `<img alt="image" class="chat_contents__left_petear__image" src=${message.image} width="400" height="250"></img>` : "";
    var video = message.video ? `<video loop="loop" controls="controls" id="mv" width="400" height="250" src=${message.video}></video>` : "";
    var html = `
    <div class="chat_contents__left_petear">
      <div class="chat_contents__left_petear__user">
        <img alt="image" class="chat_contents__left_petear__user__icon" src=${message.icon} width="30" height="30"></img>
        <a class="chat_contents__right_petear__user__name" href="/users/${message.user_id}">
          ${message.user_name}
        </a>
      </div>
      <a class="chat_contents__right_petear__image" href=${message.image}>
        ${image}
      </a>
      ${video}
      <div class="text_box">
        <div class="text_box__text">
          ${message.message}
        </div>
        <div class="text_box__icon">
          <a class="link_good" data-remote="true" href="/groups/${message.group_id}/messages/${message.id}/goods">
            <i class="fa fa-heart heart_icon"></i>
          </a>
          <div class="text_box__good_sum"> 
            <p>0</p> 
          </div>
        </div>
      </div>
    </div>`
    return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
      .done( function(message){
        console.log(message);
        var html = AddMessage(message);
        $('.chat_contents').append(html);
        $('#new_message')[0].reset();
        $('.chat_form__box__submit').prop('disabled', false);
        $(".chat_contents__center_petear__form").css({
          display: "none"
        })
        $('.chat_contents').animate({scrollTop:$('.chat_contents')[0].scrollHeight});
      })
      .fail(function(){
        alert('error');
      })
  })

  $('ul.group_messages li')
    .css({
        top   : '30px',
        right : '30px',
        opacity: 0
    })
    .each(function(i){
        $(this).delay(200 * i)
            .animate({
                left : '0',
                opacity: 1
            }, 700);
  });


  //message送信時
  $(".chat_form__box__input__message").on("keyup", function(){
    $(".chat_contents__center_petear__form").css({
      display: "block"
    })
    $('.chat_contents').animate({scrollTop:$('.chat_contents')[0].scrollHeight});
    var keyword = $(this).val();
    if(keyword){
      $(".text_box__text__form ").html(keyword);
      $(".text_box__text__form ").css({
        color: "black"
      })
    }else{
      $(".text_box__text__form ").html("message");
      $(".text_box__text__form ").css({
        color: "gray"
      })
    }
  })
  $('.hidden-image').on('change', function(e){
    $(".chat_contents__center_petear__form").css({
      display: "block"
    })
    $('.chat_contents').animate({scrollTop:$('.chat_contents')[0].scrollHeight});
    var file = e.target.files[0];
    var Url = window.URL.createObjectURL(file);
    $('.field-image__user_icon').remove();
    var html =
      `<img alt="image" class="chat_contents__center_petear__form--iv" src=${Url} width="400" height="250"></img>`
    $(".chat_contents__center_petear__form--iv").remove();
    $(".chat_contents__center_petear__form--box").append(html);
    $(".chat_contents__center_petear__form--box").css({
      border: "none"
    })
  })
  $('.hidden-video').on('change', function(e){
    $(".chat_contents__center_petear__form").css({
      display: "block"
    })
    $('.chat_contents').animate({scrollTop:$('.chat_contents')[0].scrollHeight});
    var file = e.target.files[0];
    var Url = window.URL.createObjectURL(file);
    $('.field-image__user_icon').remove();
    var html =
      `<img alt="image" class="chat_contents__center_petear__form--iv" src=${Url} width="400" height="250"></img>`
    $(".chat_contents__center_petear__form--iv").remove();
    $(".chat_contents__center_petear__form--box").append(html);
    $(".chat_contents__center_petear__form--box").css({
      border: "none"
    })
  })
})