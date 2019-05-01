$(function(){
  var preWord = "";
  
  $(document).on('keyup', $(".sell__container__top__section--form--group--seach--input"), function (e) {
    var brand_search_input = $(".sell__container__top__section--form--group--seach--input");
    var input = brand_search_input.val();
    var Word = input;
    
    // console.log(input);
    // console.log(brand_search_input);

      if (Word !== preWord){
        $.ajax({
          type: 'GET',
          url: '/brands',
          data: { keyword: input },
          dataType: 'json'
        })
    
        .done(function(data){
              console.log(data);

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
          alert('ユーザー検索に失敗しました');
        })
      }
      preWord = Word;
    });
  });