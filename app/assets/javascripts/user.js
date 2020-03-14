$( function() {
  $(".my_page_header__title").textillate({
    in: {
      effect: 'RotateOutUpRight',
      sequence: true
    }
  });
  //ユーザのimage編集
  function AddUserImage(Url){
    var html = 
      `<img alt="image" class="field-image__user_icon" src=${Url} width="100" height="100">`
      $('.field-image').append(html);
  }

  $('.hidden-account-image').on('change', function(e){
    var file = e.target.files[0];
    var Url = window.URL.createObjectURL(file);
    $('.field-image__user_icon').remove();
    AddUserImage(Url);
  })

})
