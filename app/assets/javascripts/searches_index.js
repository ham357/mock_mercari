// SearchContorollerのindexアクション”カテゴリーを選択する”の３つのドロップダウンメニュー
$(function(){
  var cpArea2 = $(".area2").html();
  var cpArea3 = $(".area3div").html();
  $(".area1").change(function(){
    var area1 = $(".area1").val()
    $(".area2").removeAttr("disabled");
    $(".area2div").css("display", "block");
    $(".area2").find(".area3_1").each(function(index, element){
      $(element).remove();
    })
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
    $(".area3div").prepend('<div class="checkbox-default area3_1", display= "none"><input value="0", id="check_all", type="checkbox",class= "check_box check_box1"><label for="0",class= "check_box check_box1"> すべて</label></input></div>');
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
  $(".size_area1").change(function(){
    var area1 = $(".size_area1 option:selected").attr('size')
    console.log(area1)
    $(".size_area2div").css("display", "block");
    $(".size_area2div").find(".check_box2").each(function(index, element){
      $(element).remove();
    })
    $(".size_area2div").html(cpSizeArea2);
    $(".check_box2 [data-group != "+area1+"]").remove();
    $(".size_area2div").prepend('<div class="checkbox-default size_area2"><input value="", id="check_all", type="checkbox",class= "check_box", data-group= ""><label for="check_all",class= "check_box",data-group= "" > すべて</label></input></div>')
    if(area1 == null){
      $(".size_area2div").remove();
    };
  });
});
