$(function(){

  function buildSelectBox(categories) {
    
    var html = `<div class= "sell__container__top__section--form--group--select">
    <select class="sell__container__top__section--form--group--select--box">
      <option value="">---</option>`

      $.each( categories , function(index, category) {

        html += `<option value="${ category.id }">${ category.name }</option>`

      })

      
    html +=   `</select>
            </div>`

    return html;
    
  }  
  
  $(document).on('change', '.sell__container__top__section--form--group--select', function () {

    if($(this).parent()[0] == $(".sell__container__top__section--form--group").first()[0]){
      // console.log($(".sell__container__top__section--form--group--select").index(this));

      var select_box_number = $(".sell__container__top__section--form--group--select").index(this) + 1;

    var select_box_count = $(this).parent().find('.sell__container__top__section--form--group--select').length;
    var select_boxs = $(this).parent().find('.sell__container__top__section--form--group--select');
    // console.log($(this).parent()[0]);
    // console.log($(".sell__container__top__section--form--group").first()[0]);


    // $('.sell__container__top__section--form--group--select').on('change', function(e) {
      var category_element = $(this);
      var select_value = category_element.find('.sell__container__top__section--form--group--select--box option:selected').val();
      // console.log(category_element);
      // var next_element = category_element.find('.sell__container__top__section--form--group--select--box option:selected').val();
      
      // console.log(select_value);
      // console.log(next_element);
      // next_element.remove(); if (next_element.length !== 0)
      console.log(select_box_count);
      // console.log(select_boxs);
      
      // console.log("hi");
      
      // select_box_count -= 1;
      // }
      
      $.ajax({ 
        url: '/category', 
        type: 'GET',
        data: { 
          id: select_value
        },
        dataType: 'json' 
      })
      .done(function(data) {
        
        html = buildSelectBox(data);
        
        // select_box_count += 1;
        if(select_box_count == 3){
          if(select_box_number==1){
            category_element.after(html);
            select_boxs.last().remove(); 
            select_boxs.eq(1).remove();
          }else if(select_box_number == 2){
            category_element.after(html);
            select_boxs.last().remove(); 
        }
      }
        
        if (select_box_count > 3){
          select_boxs.last().remove(); 
        }else if(select_box_count == 3){

          // select_boxs.last().remove();
        }else{
          category_element.after(html);
        }
        // $('.sell__container__top__section--form--group--select').filter(":last").remove(); if ($('.sell__container__top__section--form--group--select').length > 3);

    })
    .fail(function() {
      alert('select box error');
    })
  }
  });

});