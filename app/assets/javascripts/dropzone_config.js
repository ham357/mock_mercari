$(function(){
  Dropzone.autoDiscover = false;
  var dropflg = 0;
    $("#item-dropzone").dropzone({
    paramName : "product[product_images_attributes][image_url]",
    maxFiles: 11,
    maxFilesize: 2,
    parallelUploads: 10,
    maxThumbnailFilesize: 10,
    addRemoveLinks: true,
    uploadMultiple: true,
    autoProcessQueue: false,
    acceptedFiles:'.jpg, .png, .jpeg, .gif',
    dictRemoveFile:'削除',
    previewsContainer: '#dz-previews',
    previewTemplate:`<div class="dz-preview"><div class="dz-image"><img data-dz-thumbnail /></div><a class="dz-edit">編集</a></div>`,
    init: function(){
      myDropzone = this
      $('form').submit(function(e){
        　if(document.URL.match("sell") || document.URL.match("edit")){
          $(".error").remove();
          var errflg = 0; 
          if (myDropzone.files.length == 0) {
            $(".dz-message").after(`<p class="error">画像がありません</p>`);
            errflg = 1; 
          }
          if ($("input[name='product[name]']").val() == '') {
            $("input[name='product[name]']").after(`<p class="error">入力してください</p>`);
            errflg = 1; 
          }
          if ($("textarea[name='product[description]']").val() == '') {
            $("textarea[name='product[description]']").after(`<p class="error">入力してください</p>`);
            errflg = 1; 
          }
          if ($("[name='product[category_id]'] option:selected").val() == '') {
            $("[name='product[category_id]']").after(`<p class="error">選択してください
            </p>`);
            errflg = 1; 
          }
          if ($("[name='product[status_id]'] option:selected").val() == '') {
            $("[name='product[status_id]']").after(`<p class="error">選択してください
            </p>`);            
            errflg = 1; 
          }
          if ($("[name='product[shipping_fee_id]'] option:selected").val() == '') {
            $("[name='product[shipping_fee_id]']").after(`<p class="error">選択してください
            </p>`);
            errflg = 1; 
          }
          if ($("[name='product[shipping_method_id]'] option:selected").val() == '') {
            $("[name='product[shipping_method_id]").after(`<p class="error">選択してください
            </p>`);
            errflg = 1; 
          }
          if ($("[name='product[state_id]'] option:selected").val() == '') {
            $("[name='product[state_id]']").after(`<p class="error">選択してください
            </p>`);            
            errflg = 1; 
          }
          if ($("[name='product[shipping_day_id]'] option:selected").val() == '') {
            $("[name='product[shipping_day_id]']").after(`<p class="error">選択してください
            </p>`);            
            errflg = 1; 
          }
          if ($("input[name='product[price]']").val() == '' || $("input[name='product[price]']").val() < 300 || $("input[name='product[price]']").val() > 9999999) {
            $(".sell__container__top__section--form--group--content--price--group--input-top").after(`<p class="error">300以上9999999以下で入力してください</p>`);
            errflg = 1; 
          }
          if (errflg == 0){
            if(document.URL.match("sell")){
              e.preventDefault();
            }
            myDropzone.processQueue();
            setTimeout(function(){
              $('.dz-remove').text('削除');
          },5000);
          }else{
            return false;
          }
        }
      })
    this.on("removedfile", function (file) {
      if (file.url && file.url.trim().length > 0) {
          $("<input type='hidden'>").attr({
              id: 'DeletedImageUrls[]',
              name: 'DeletedImageUrls[]'
          }).val(file.name).appendTo('#item-dropzone');
      }
  });
    },
    drop: function(){
      dropflg = 1;
    },
    addedfiles: function(files){
      $(".error").remove();
      $(document).ready();
      $('#dz-preview').append(`<div class="dz-preview"><div class="dz-image"><img data-dz-thumbnail /></div><a class="dz-edit">編集</a></div>`)

      if(dropflg==1){
        var total_images = $('.dz-preview').length + files.length
        dropflg = 0;
      }else{
        var total_images = $('.dz-preview').length
      }

      if (total_images < 5){
      var count = 100 - total_images * 20 + "%" 
    }else if (total_images >= 10){
      $('.dz-message').hide();
    }else{
      var count = 100 - (total_images - 5 ) * 20 + "%"
    }
    setTimeout(function(){
      $('.dz-message').css('width', count);
  },10);

    },
    success: function(file, response){
    },
    removedfile: function(file){
      var id = $(file.previewTemplate).find('.dz-remove').attr('id');

      if (($('.dz-preview').length - 1) < 5){
        var count = 100 - (($('.dz-preview').length - 1) * 20) + "%"
      }else if (($('.dz-preview').length + 1) > 10){
        $('.dz-message').show();
        var count = 100 - (($('.dz-preview').length - 6) * 20) + "%"
      }else{
        var count = 100 - (($('.dz-preview').length - 6) * 20) + "%"
      }
      $('.dz-message').css('width', count);
      var previewElement;
      return (previewElement = file.previewElement) != null ? (previewElement.parentNode.removeChild(file.previewElement)) : (void 0);
    },
    error: function(){
      alert('error');
    },
    maxfilesreached	: function(){
      $('.sell__container__top__section--form--uploader').append(`<p class="error"> アップロードできる画像は10枚までです。</p>`);
    }
  });

  if($("#product_price").length){
    window.onload = displayComminssionAndBenefit();
  }

  $('#product_price').on('keyup', displayComminssionAndBenefit)

  function displayComminssionAndBenefit(){
    var price = $('#product_price').val();
    var commission = Math.round(price * 0.1)
    var benefit = Math.round(price - commission)
    if (price >= 300) {
      $('#commission').text("¥" + commission)
      $('#benefit').text("¥" + benefit)
    } else {
      $('#commission').text("-")
      $('#benefit').text("-")
    }
  }

  $('input[type=file]').on('change', function(){
    var count = 100 - ($('.dz-preview').length * 22) + "%"
      $('.dz-message').css('width', count);
  })
});