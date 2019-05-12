$(function(){
  $('.buy__container__item__inner--form--point--ul--li--toggle').on("click", function() {
    var price = gon.price
    var totalPrice = price
    var points = gon.points
    var priceSpan = $(".buy-price-right-span").html();
    var btnDisableTrue = $('.buy__container__item__inner--form--btn').prop('disabled', true)
    var btnDisableFalse = $('.buy__container__item__inner--form--btn').prop('disabled', false);
    var cantPaymentFifty = $(".buy__container__item__inner--form--alert").html("50円以下の決済不可")
    $(function(){
      $('input[name=point]').change(function(){
        var select = $('input[name=point]:checked').attr('id')
        $(".buy__container__item__inner--form--alert").html("");
        btnDisableFalse
        if (select  == 'use'){
          totalPrice = price
          totalPrice = totalPrice - points
          $('.use_part_input').prop('disabled', true);
          $('.use_part_input').val("")
          $('.point_checker').val(points)
        }else if (select == 'use_part' ){
          $('.use_part_input').prop('disabled', false);
          totalPrice = price
        }else{
          totalPrice = price
          $('.use_part_input').prop('disabled', true);
          $('.use_part_input').val("")
          $('.point_checker').val('0')
        }
        if(totalPrice < 50){
          btnDisableTrue
          cantPaymentFifty
        }
        var totalPriceStr = String('¥  '+ totalPrice).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
        $(".buy-price-right-span").html(totalPriceStr);
        $(".price_checker").val(totalPrice);
      });
    });
    $(function(){
      $('.use_part_input').keyup(function(e){
        var inputPrice = $(this).val();
        if (inputPrice > 0){
          totalPrice = price - inputPrice
        }else{
          totalPrice = price
        }
        if (inputPrice > gon.points){
          btnDisableTrue
          $(".buy__container__item__inner--form--alert").html("ポイント所持分を超えてます");
        }else if(inputPrice > gon.price ){
          btnDisableTrue
          $(".buy__container__item__inner--form--alert").html("商品価格以下にしてください");
        }else if(totalPrice < 50){
          btnDisableTrue
          cantPaymentFifty
        }else{
          btnDisableFalse
          $(".buy__container__item__inner--form--alert").html("");
        }
        var totalPriceStr = String('¥  '+ totalPrice).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
        $(".buy-price-right-span").html(totalPriceStr);
        $(".price_checker").val(totalPrice);
        $('.point_checker').val(inputPrice)
      })
    })
  });
});
