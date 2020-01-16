$( function(){

  function AddUser(image, name, id) {
    var html = `
      <div class="search-center--user__box__li">
        <a href = "/users/${id}" >
          <img alt="image" class="search-center--user__box__li__image" src=${image} width="100" height="100"></img>
          <p class="search-center--user__box__li__text">${name}</p>
        </a>
      </div>
    `
    $(".search-center--user__box").append(html);

  }

  function AddGroup(image, name, id) {
    var html = `
      <div class="search-center--group__box__li">
        <a href = "/groups/${id}/messages" >
          <img alt="image" class="search-center--group__box__li__image" src=${image} width="240" height="150"></img>
          <p class="search-center--group__box__li__text">${name}</p>
        </a>
      </div>
    `
    $(".search-center--group__box").append(html);

  }

  function AddMessage(image, message, id) {
    var html = `
      <div class="search-center--message__box__li">
        <a href = "/groups/${id}/messages" >
          <img alt="image" class="search-center--message__box__li__image" src=${image} width="240" height="150"></img>
          <p search-center--message__box__li__text>${message}</p>
        </a>
      </div>
    `
    $(".search-center--message__box").append(html);

  }



  $(".user-btn").on("click", function(){
    $(".search-center").addClass("hidden");
    $(".search-center--group").addClass("hidden");
    $(".search-center--message").addClass("hidden");
    $(".search-center--user").removeClass("hidden");
    $(".user-btn").addClass("keyframe3");
    $(".group-btn").removeClass("keyframe3");
    $(".message-btn").removeClass("keyframe3");
  })

  $(".group-btn").on("click", function(){
    $(".search-center").addClass("hidden");
    $(".search-center--user").addClass("hidden");
    $(".search-center--message").addClass("hidden");
    $(".search-center--group").removeClass("hidden");
    $(".group-btn").addClass("keyframe3");
    $(".message-btn").removeClass("keyframe3");
    $(".user-btn").removeClass("keyframe3");
  })

  $(".message-btn").on("click", function(){
    $(".search-center").addClass("hidden");
    $(".search-center--group").addClass("hidden");
    $(".search-center--user").addClass("hidden");
    $(".search-center--message").removeClass("hidden");
    $(".message-btn").addClass("keyframe3");
    $(".user-btn").removeClass("keyframe3");
    $(".group-btn").removeClass("keyframe3");
  })

  $(".search-text-box__user").on("keyup", function(e){
    e.preventDefault();
    var keyword = $(this).val();

    $.ajax({
      type: "GET",
      url: "/toppages/search",
      data: { user_keyword: keyword },
      dataType: 'json'
    })
    .done(function(users) {
      $(".search-center--user__box__li").remove();
      users.forEach(function(user){
        AddUser(user.image, user.name, user.id );
      })
    })

    .fail(function() {
      console.log("sorry");
    })
  })


  // グループのやつ
  $(".search-text-box__group").on("keyup", function(e){
    e.preventDefault();
    var keyword = $(this).val();

    $.ajax({
      type: "GET",
      url: "/toppages/search1",
      data: { group_keyword: keyword },
      dataType: 'json'
    })
    .done(function(groups) {
      $(".search-center--group__box__li").remove();
      groups.forEach(function(group){
        AddGroup(group.image, group.name, group.id );
      })
    })

    .fail(function() {
      console.log("sorry");
    })
  })

  //messageのやつ
  $(".search-text-box__message").on("keyup", function(e){
    e.preventDefault();
    var keyword = $(this).val();
    $.ajax({
      type: "GET",
      url: "/toppages/search2",
      data: { message_keyword: keyword },
      dataType: 'json'
    })
    .done(function(messages) {
      $(".search-center--message__box__li").remove();
      messages.forEach(function(message){
        AddMessage(message.image, message.message, message.id );
      })
    })
    .fail(function() {
      console.log("sorry");
    })
  })

})