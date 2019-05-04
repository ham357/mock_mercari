$(function(){
  const default_category_group_elements_count = document.getElementsByClassName("sell__container__top__section--form--group--content")[0].children.length;
  const default_shipping_group_elements_count = document.getElementsByClassName("sell__container__top__section--form--group--content")[1].children.length;

  function buildCategorySelectBox(categories,category_element) {
    
    var html = `<div class= "sell__container__top__section--form--group--select">
    <select class="sell__container__top__section--form--group--select--box">
      <option value="">---</option>`

      $.each( categories , function(index, category) {

        html += `<option value="${ category.id }">${ category.name }</option>`

      })

      
    html +=   `</select>
            <i class="fa-chevron-down"></i>
            </div>`

            category_element.after(html);
    
  }  

  function buildSizeSelectBox(product_sizes,selected_group_element){
    
    var html = `<div class= "sell__container__top__section--form--group">
    <div class="sell__container__top__section--form--group--head">
      <label>サイズ</label>
      <span>必須</span>
      <div class= "sell__container__top__section--form--group--select">
    <select class="sell__container__top__section--form--group--select--box">
      <option value="">---</option>`

      $.each( product_sizes , function(index, product_size) {

        html += `<option value="${ product_size.id }">${ product_size.name }</option>`

      })

      
    html +=   `</select>
            <i class="fa-chevron-down"></i>
            </div>
            </div>
            </div>`

    selected_group_element.after(html);
    
  }  
  
  function buildInputBox(selected_group_element){
    
    var html = `<div class= "sell__container__top__section--form--group">
    <div class="sell__container__top__section--form--group--head--gray">
      <label>ブランド</label>
      <span>任意</span>
      <div class="sell__container__top__section--form--group--seach">
      <input type="serch" name="name" class="sell__container__top__section--form--group--seach--input" placeholder = "例）シャネル">
      </div>
      </div>
      </div>`

      selected_group_element.after(html);
    
  }  

  function buildShippingMethodSelectBox(product_shipping_methods,selected_group_element){
    
    var html = `<div class= "sell__container__top__section--form--group">
    <div class="sell__container__top__section--form--group--head">
      <label>配送方法の負担</label>
      <span>必須</span>
      <div class= "sell__container__top__section--form--group--select">
    <select class="sell__container__top__section--form--group--select--box">
      <option value="">---</option>`

      $.each( product_shipping_methods , function(index, product_shipping_method) {

        html += `<option value="${ product_shipping_method.id }">${ product_shipping_method.name }</option>`

      })
      
    html +=   `</select>
            <i class="fa-chevron-down"></i>
            </div>
            </div>
            </div>`

    selected_group_element.after(html);
    
  }  

  $(document).on('change', '.sell__container__top__section--form--group--select', function (e) {

    var selected_element = $(this);
    var selected_group_element = $(this).parent();
    var selected_group = selected_group_element[0];
    var selected_group_elements = selected_group_element.parent().children();
    var selected_group_elements_count = selected_group_elements.length;
    var category_select_box_group = $(".sell__container__top__section--form--group").first()[0];
    var shipping_fee_group = $(".sell__container__top__section--form--groups").eq(2).find(".sell__container__top__section--form--group")[0];
    var select_value = selected_element.find('.sell__container__top__section--form--group--select--box option:selected').val();

    if(selected_group == category_select_box_group){

      var selected_box_number = $(".sell__container__top__section--form--group--select").index(this) + 1;

      var category_select_box_element = $(this).parent().find('.sell__container__top__section--form--group--select');
      var category_select_box_element_count = category_select_box_element.length;
    
      if(select_value !== ""){
        $.ajax({ 
          url: '/category', 
          type: 'GET',
          data: { 
            id: select_value
          },
          dataType: 'json' 
        })
        .done(function(data) {

          var data_conunt = Object.keys(data).length;
          var size_flg = data['category'][0].size_flg;
          var brand_flg = data['category'][0].brand_flg;
          data['category'].shift();
          var size_brand_element = selected_group_element.find(".sell__container__top__section--form--group");
          var size_brand_element_count = size_brand_element.length;
          
          if (data_conunt !== 0){
              if(selected_box_number !== 3){
                for(var i=category_select_box_element_count;i>selected_box_number-1;i--){
                  category_select_box_element.eq(i).remove(); 
                }
                for(var i=selected_group_elements_count;i>default_category_group_elements_count;i--){
                  selected_group_elements.eq(i-2).remove();
                }
                buildCategorySelectBox(data['category'],selected_element);
          }else{
              if(selected_group_elements_count == default_category_group_elements_count){
                if(brand_flg){
                    buildInputBox(selected_group_element);
                  }

                if(size_flg){
                    buildSizeSelectBox(data['size_category'],selected_group_element);
                }
    
                }
              }
          }

        })
        .fail(function() {
          alert('select box error');
        })
      }
    }else if(selected_group == shipping_fee_group){
      $.ajax({ 
        url: '/product_shipping_methods', 
        type: 'GET',
        data: { 
          id: select_value
        },
        dataType: 'json' 
      })
      .done(function(data) {

        if(selected_group_elements_count !== default_shipping_group_elements_count){
          selected_group_elements.eq(1).remove();
        }
        buildShippingMethodSelectBox(data['shipping_method'],selected_group_element)

      })
      .fail(function() {
        alert('select box error');
      })
    }
  });

});
