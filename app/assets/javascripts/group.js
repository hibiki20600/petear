$( function() {
  //グループのimage編集
  function AddImage(Url){
    var html = 
      `<img alt="image" class="group_image_field__label__image" src=${Url} width="360" height="225">`
      
    $('.group_image_field__label').append(html);
  }
  
  $('.hidden-image').on('change', function(e){

    var file = e.target.files[0];
    var Url = window.URL.createObjectURL(file);
    
    $('.group_image_field__label__image').remove();
    AddImage(Url);
  })

  $('delete_group').on('click', function(e){
    e.preventDefault();
    var resalt = confirm('解散してよろしいですか?');
    if (resalt) {
      console.log('解散されました');
    }
  })
  
})