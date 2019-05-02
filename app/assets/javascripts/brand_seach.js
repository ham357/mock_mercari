$(function(){
  var preWord = "";
  

  function buildBrandSeachBox(brands,brand_search_input) {

    var brand_search_result = $(".sell__container__top__section--form--group--seach--result");

    html = `<ul class="sell__container__top__section--form--group--seach--list">`
    
    $.each( brands , function(index, brand) {
      
      html += `<li id="${ brand.id }" class="">${ brand.name }</li>`
                
    })
              
    html += `</ul>`

    brand_search_result.empty();
    brand_search_result.append(html);

  }  

  $(document).on("click", ".sell__container__top__section--form--group--seach--list", function () {

    var brand_search_input = $(".sell__container__top__section--form--group--seach--input");

        console.log($(".sell__container__top__section--form--group--seach--list"));

        console.log($(this).text());

        brand_search_input.val($(this).text());

        console.log(brand_search_input.val());


  //   var add_chat_member_element = $(".js-chat-member").parent(); 
  //   var user_id = $(this).attr("data-user-id");
  //   var user_name = $(this).attr("data-user-name");
  //   var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
  //   <input name='group[user_ids][]' type='hidden' value='${ user_id }'>
  //   <p class='chat-group-user__name'>${ user_name }</p>
  //   <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
  // </div>`

  //   add_chat_member_element.append(html);
    $(this).remove();

   });

  $(document).on('keyup', $(".sell__container__top__section--form--group--seach--input"), function (e) {
    var brand_search_input = $(".sell__container__top__section--form--group--seach--input");
    var input = brand_search_input.val();
    var Word = input;
    
    console.log(Word);
    console.log(preWord);

      if (Word !== preWord){
        $.ajax({
          type: 'GET',
          url: '/brands',
          data: { keyword: input },
          dataType: 'json'
        })
    
        .done(function(data){
          var brand_search_result = $(".sell__container__top__section--form--group--seach--result");

              console.log(data);

              if(input == ""){
                brand_search_result.empty();
              }else{
              buildBrandSeachBox(data,brand_search_input)
              }

          // search_result.empty();
          // var group_members = $('.chat-group-user__name').text();
          // if (users.length !== 0){
          //   if(input !== ""){
          //     users.forEach(function(user,index){
          //       if (group_members.indexOf(user.name) == -1){
          //         appendUser(user);
          //       }else if(index == users.length - 1 && search_result.text() == ""){
          //         appendErrMsgToHTML("一致するユーザーはいません");
          //       }
          //     });
          //   }
          // }
          // else{
          //   appendErrMsgToHTML("一致するユーザーはいません");
          // }
        })
        .fail(function(){
          alert('ブランド検索に失敗しました');
        })
      }
      preWord = Word;
    });
  });