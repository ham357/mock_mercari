// SearchContorollerのindexアクション”ブランドの選択”のインクリメンタルサーチ
$(document).on('turbolinks:load', function(){
  $('.brand--input',).on('keyup',  function(){
    var input = $.trim($(this).val());
    $.ajax({
    // /searches/searchでsearchアクションに飛べる
      url: '/searches',
      type: 'GET',
      data: ('keyword=' + input),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data){
      $('.brand--ul').find('.brand--ul--li').remove();
      $('.brand--ul').css("display", "block");
      $(data).each(function(index, brand){
        $('.brand--ul').append('<li class= "brand--ul--li" , id= "'+brand.name+'">' + brand.name + '</li>' );
      })
      $('.brand--ul--li').on("click",function(){
        var value = $(this).attr('id')
        $('.brand--input').val(value);
        $('.brand--ul').find('.brand--ul--li').remove();
        $('.brand--ul').css("display", "none");
      });
    })
  });
});
