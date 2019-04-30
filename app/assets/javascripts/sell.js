$(function(){

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

    selected_group_element.append(html);
    
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

      selected_group_element.append(html);
    
  }  

  function buildShippingMethodSelectBox(select_value,selected_group_element){
    
    var html = `<div class= "sell__container__top__section--form--group">
    <div class="sell__container__top__section--form--group--head">
      <label>配送方法の負担</label>
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

    return html;
    
  }  

  $(document).on('change', '.sell__container__top__section--form--group--select', function () {
    var selected_element = $(this);
    var selected_group_element = $(this).parent();
    var selected_group = selected_group_element[0];
    var category_select_box_group = $(".sell__container__top__section--form--group").first()[0];
    var shipping_fee_group = $(".sell__container__top__section--form--groups").eq(2).find(".sell__container__top__section--form--group")[0];
    var select_value = selected_element.find('.sell__container__top__section--form--group--select--box option:selected').val();
    
    // console.log(selected_group[0] == shipping_group[0]);
    // console.log($(this));
    // console.log($(".sell__container__top__section--form--groups").eq(2).find(".sell__container__top__section--form--group"));

    if(selected_group == category_select_box_group){
      // console.log($(".sell__container__top__section--form--group--select").index(this));

      var selected_box_number = $(".sell__container__top__section--form--group--select").index(this) + 1;

      var category_select_box_element = $(this).parent().find('.sell__container__top__section--form--group--select');
      var category_select_box_element_count = category_select_box_element.length;
    // console.log($(this).parent()[0]);
    // console.log($(".sell__container__top__section--form--group").first()[0]);


    // $('.sell__container__top__section--form--group--select').on('change', function(e) {


      // console.log(category_element);
      // var next_element = category_element.find('.sell__container__top__section--form--group--select--box option:selected').val();
      
      // console.log(select_value);
      // console.log(next_element);
      // next_element.remove(); if (next_element.length !== 0)
      // console.log(select_boxs);
      
      
      // select_box_count -= 1;
      // }
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
          // console.log(data);
          // console.log(data['category'][0]);
          // console.log(data['size_category']);

          var data_conunt = Object.keys(data).length;
          var size_flg = data['category'][0].size_flg;
          var brand_flg = data['category'][0].brand_flg;
          data['category'].shift();
          var size_brand_element = selected_group_element.find(".sell__container__top__section--form--group");
          var size_brand_element_count = size_brand_element.length;

          // console.log(Object.keys(data).length);
          // console.log(form_group_element.find(".sell__container__top__section--form--group").length == 0);
          
          if (data_conunt !== 0){
            
            
            // console.log(select_box_count);
            // console.log(selected_box_number);
            // console.log(brand_input_count);
            
            // if (select_box_count >= 3){
              if(selected_box_number !== 3){
                for(var i=category_select_box_element_count;i>selected_box_number-1;i--){
                  category_select_box_element.eq(i).remove(); 
                }
                for(var i=0;i<size_brand_element_count;i++){
                  size_brand_element.remove();
                }
                buildCategorySelectBox(data['category'],selected_element);
                // select_boxs.last().remove(); 

            // if (select_box_count > 3){
            //   if(selected_box_number !== 3){
            //     for(var i=0;i<brand_input_count;i++){
            //       brand_input.remove();
            //     }
            //     select_boxs.last().remove(); 
            //   }

              // select_box_count += 1;
            // }else if(select_box_count == 3){
            //   if(selected_box_number==1){
            //     category_element.after(html);
            //     select_boxs.last().remove(); 
            //     select_boxs.eq(1).remove();
            //     if(brand_input_count !== 0){
                  
            //       brand_input.remove() ;
            //     }
            //   }else if(selected_box_number == 2){
            //     category_element.after(html);
            //     select_boxs.last().remove(); 
            //     if(brand_input_count !== 0){
                  
            //       brand_input.remove() ;
            //     }
              }else{
                if(size_flg){
                  if(size_brand_element_count == 0){
                    buildSizeSelectBox(data['size_category'],selected_group_element);

                  }

                }
                if(brand_flg){
                  if(size_brand_element_count == 0){
                    buildInputBox(selected_group_element);
    
                  }
    
                }
              }
            // }else if(select_box_count == 2){
            //   if(selected_box_number==1){
            //     category_element.after(html);
            //     select_boxs.last().remove(); 
            //     // select_boxs.eq(1).remove();
            //   }else{
            //     category_element.after(html);
            //   }
            // }else{
            //   category_element.after(html);
            // }
            // var html2 = buildInputBox;
            // form_group_element.append(html2);
            // console.log(data[0].brand_flg);

            // }else if(select_box_count == 3){
    
            //   // select_boxs.last().remove();
            // }else{
            //   category_element.after(html);
            // }
            // $('.sell__container__top__section--form--group--select').filter(":last").remove(); if ($('.sell__container__top__section--form--group--select').length > 3);
            
          }

        })
        .fail(function() {
          alert('select box error');
        })
      }
    }else if(selected_group == shipping_fee_group){
      console.log(select_value);
      buildShippingMethodSelectBox(select_value,selected_group_element)
    }
  });

});