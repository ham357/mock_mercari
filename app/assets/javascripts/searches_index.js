// SearchContorollerのindexアクション”カテゴリーを選択する”の３つのドロップダウンメニュー
$(function(){
  var cpArea2 = $(".area2").html();
  var cpArea3 = $(".area3div").html();
  $(".area3").remove();
  $(".area1").change(function(){
    var area1 = $(".area1").val();
    $(".area2").removeAttr("disabled");
    $(".area2div").css("display", "block");
    $(".area2").html(cpArea2);
    $(".area2 option[data-group != "+area1+"]").remove();
    $(".area2").prepend('<option value= "",category_id_eq= "",selected= "true">すべて</option>');
    $('.area2').val('').change();
  });
    $(".area2").on("change",function(){
    var area2 = $(".area2 option:selected").attr('subdata-group');
    var area1 = $(".area1").val()
    $(".area2div").find(".check_box1").each(function(index, element){
      $(element).remove();
    })
    $(".area3div").html(cpArea3);
    $(".check_box1 [subdata-group != "+area2+"]").remove();
    $(".check_box1 [data-group != "+area1+"]").remove();
    if(area2 == undefined){
      $(".area3_1").remove();
    }
  });
    $(".area2").on("change",function(){
    $(".area3div").css("display", "block");
  });
});
// SearchContorollerのindexアクション”サイズを指定する”のドロップダウンメニュー及びセレクトボタン
$(function(){
  var cpSizeArea2 = $(".size_area2div").html();
  $(".check_box2").remove();
  $(".size_area1").change(function(){
    var area1 = $(".size_area1 option:selected").attr('size')
    $(".size_area2div").css("display", "block");
    $(".size_area2div").find(".check_box2").each(function(index, element){
      $(element).remove();
    })
    $(".size_area2div").html(cpSizeArea2);
    $(".check_box2 [data-group != "+area1+"]").remove();
    $(".size_area2div").prepend('<div class="checkbox-default size_area2"><input value="", id="check_all", type="checkbox",class= "check_box", data-group= ""><label for="check_all",class= "check_box",data-group= "" > すべて</label></input></div>')
    if(area1 == undefined){
      $(".check_box2").remove();
      $(".size_area2").remove();
    };
  });
  // 専用のカラムをつくるまでこれで
  $('.price-select').change(function(){
    var id = $('.price-select').val();
    if (id == '300 ~ 1000'){
      $('.min').val('300');
      $('.max').val('1000');
    }else if (id == '1000 ~ 5000'){
      $('.min').val('1000');
      $('.max').val('5000');
    }else if (id == '5000 ~ 10000'){
      $('.min').val('5000');
      $('.max').val('10000');
    }else if (id == '10000 ~ 30000'){
      $('.min').val('10000');
      $('.max').val('30000');
    }else if (id == '30000 ~ 50000'){
      $('.min').val('30000');
      $('.max').val('50000');
    }else if (id == '50000 ~'){
      $('.min').val('50000');
      $('.max').val('');
    }
  })
  // クリアボタン
  $(function(){
    $(".btn-gray").on("click",function(){
      $(".area3").remove();
      $(".area2div").css("display", "none");
      $(".size_area2").remove();
      clearForm(this.form);

    })
    function clearForm(form) {
      $(form)
            .find("input, select, textarea")
            .not(":button, :submit, :rest, :hidden")
            .val("")
            .prop("checked", false)
            .prop("selected", false);
    };
  });

  $('.all_check_1').on('change', function() {
    $('.check_1').children('input').prop('checked', this.checked);
  });
  $('.all_check_2').on('change', function() {
    $('.check_2').children('input').prop('checked', this.checked);
  });
  $('.all_check_3').on('change', function() {
    $('.check_3').children('input').prop('checked', this.checked);
  });
});
