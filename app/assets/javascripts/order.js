$(function(){
  $('.buy__container__item__inner--form--point--ul--li--toggle').on("click", function() {
    var price = gon.price
    var totalPrice = price
    var points = gon.points
    var priceSpan = $(".buy-price-right-span").html();
    // totalPrice = totalPrice * 10;
    $(function(){
      $('input[name=point]').change(function(){
        var select = $('input[name=point]:checked').attr('id')
        console.log(select)
        if (select  == 'use'){
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
        var totalPriceStr = String('¥  '+ totalPrice).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
        $(".buy-price-right-span").html(totalPriceStr);
        $(".price_checker").val(totalPrice);
      });
    });
    $(function(){
      $('.use_part_input').keyup(function(e){
        var inputPrice = $(this).val();
        if (inputPrice > 0){
          totalPrice = totalPrice - inputPrice
        }else{
          totalPrice = price
        }
        var totalPriceStr = String('¥  '+ totalPrice).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
        $(".buy-price-right-span").html(totalPriceStr);
        $(".price_checker").val(totalPrice);
        $('.point_checker').val(inputPrice)
      })
    })
  });
});
