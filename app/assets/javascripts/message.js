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
        $(this).delay(300 * i)
            .animate({
                left : '0',
                opacity: 1
            }, 700);
  });
})