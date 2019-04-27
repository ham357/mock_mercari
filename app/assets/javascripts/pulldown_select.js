$(function(){
  var cpArea2 = $(".area2").html();
  var cpArea3 = $(".area3").html();
  $(".area1").change(function(){
    var area1 = $(".area1").val()
    $(".area2").removeAttr("disabled");
    $(".area2div").css("display", "block");
    $(".area2").find("option").each(function(index, element){
      $(element).remove();
    })
    $(".area2").html(cpArea2);
    $(".area2 option[data-group != "+area1+"]").remove();
    $(".area2").prepend('<option value= "",category_id_eq= "",selected= "true">すべて</option>');
    $('.area2').val('').change();
    $('.area3').attr("disabled", "disabled");
    $(".area3 option").remove();
  });
    $(".area2").change(function(){
    var area2 = $(".area2 option:selected").attr('subdata-group');
    var area1 = $(".area1").val()
    $(".area3").removeAttr("disabled");
    $(".area3div").css("display", "block");
    $(".area3").find("option").each(function(index, element){
      $(element).remove();
    })
    $(".area3").html(cpArea3);
    console.log(area2)
    console.log(area1)
    $(".area3 option[subdata-group != "+area2+"]").remove();
    $(".area3 option[data-group != "+area1+"]").remove();
    $(".area3").prepend('<option value= "",category_id_eq= "",selected= "true">すべて</option>');
    $('.area3').val('').change();
  });
});
