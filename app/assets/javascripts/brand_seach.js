$(function(){
  var preWord = "";
  
  function buildBrandSeachBox(brands,brand_search_input) {

    var brand_search_result = $(".sell__container__top__section--form--group--seach--result");

    html = `<ul class="sell__container__top__section--form--group--seach--list">`
    
    $.each( brands , function(index, brand) {
      
      html += `<li id="${ brand.id }" class="sell__container__top__section--form--group--seach--list-list">${ brand.name }</li>`
                
    })
              
    html += `</ul>`

    brand_search_result.empty();
    brand_search_result.append(html);

  }  

  $(document).on("click", ".sell__container__top__section--form--group--seach--list-list", function () {

    var brand_search_input = $(".sell__container__top__section--form--group--seach--input");

    brand_search_input.val($(this).text());
    $(this).remove();

   });

  $(document).on('keyup', $(".sell__container__top__section--form--group--seach--input"), function (e) {
    var brand_search_input = $(".sell__container__top__section--form--group--seach--input");
    var input = brand_search_input.val();
    var Word = input;
    
      if (Word !== preWord){
        $.ajax({
          type: 'GET',
          url: '/brands',
          data: { keyword: input },
          dataType: 'json'
        })
    
        .done(function(data){
          var brand_search_result = $(".sell__container__top__section--form--group--seach--result");
              if(input == ""){
                brand_search_result.empty();
              }else{
              buildBrandSeachBox(data,brand_search_input)
              }
        })
        .fail(function(){
          alert('ブランド検索に失敗しました');
        })
      }
      preWord = Word;
    });
  });
