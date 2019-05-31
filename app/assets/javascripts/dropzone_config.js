$(function(){
  Dropzone.autoDiscover = false;
  var dropflg = 0;
  var addedfile_count = 0; 
  var now_images = 0;
  var submitflg = 0;
  var total_images = 0;
    $("#item-dropzone").dropzone({
    paramName : "product[product_images_attributes][image_url]",
    maxFiles: 10,
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
        submitflg = 1;

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

            if (myDropzone.getQueuedFiles().length > 0){
              e.preventDefault();
            }
            myDropzone.processQueue();
            $('.dz-remove').text('削除');

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
    renameFile: function (file) {
      let newName = new Date().getTime();
      return newName;
    },
    drop: function(){
      dropflg = 1;

    },
    dragenter		: function(){

      if(total_images == 10){
        myDropzone.disable();
      }

    },
    addedfiles: function(files){
      addedfile_count = files.length;
      $(".error").remove();
      $(document).ready();
      $('#dz-preview').append(`<div class="dz-preview"><div class="dz-image"><img data-dz-thumbnail /></div><a class="dz-edit">編集</a></div>`)

      if(dropflg==1){
        total_images = myDropzone.files.length + files.length
        now_images = myDropzone.files.length;
      }else{
        total_images = myDropzone.files.length
        now_images = myDropzone.files.length - addedfile_count;
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

      if(total_images > 10){
        $('.sell__container__top__section--form--uploader').append(`<p class="error"> アップロードできる画像は10枚までです。</p>`);

        if(dropflg==1){
          while(files.length){
            files.shift()
          }
        }else{
          var i = 0;
          while(i < files.length){
            var addedfile = myDropzone.files[myDropzone.files.length - 1]
            myDropzone.removeFile(addedfile);
            i += 1;
          }
        }        

        if ((now_images) < 5){
          var count = 100 - (now_images* 20) + "%"
        }else{
          var count = 100 - ((now_images - 5) * 20) + "%"
        }
        setTimeout(function(){
        $('.dz-message').css('width', count);
        },10);

        if (now_images >= 10){
          $('.dz-message').hide();
        }else{
          $('.dz-message').show();
        }

      }

      dropflg = 0;

    },
    completemultiple: function(file, response){
      if(document.URL.match("edit")){
        var now_url = document.URL
        var show_path = now_url.replace('edit', '');
        window.location.href= show_path;
      }
    },

    queuecomplete	: function(files){
      if (submitflg == 1){
        if(document.URL.match("sell")){
          $.ajax({ 
            url: '/products/new', 
            type: 'GET',
            dataType: 'json' 
          })

          .done(function(data) {

            $('#overlay, #modalWindow').fadeIn();
            var html2 = `<a class=" product-modal__container__content__btn--blue" href="/products/${ data['new_product'].id }" data-turbolinks="false"><div class="product-modal__container__content__btn--blue">
            <h1>商品ページへ行ってシェアする</h1>
            </div>
            </a>`

            $('.product-modal__container__content').append(html2);   

          })
          .fail(function() {
            alert('modal error');
          })
        }
      }
        
    },
    removedfile: function(file){
      if (myDropzone.files.length < 10){
        myDropzone.enable()
      }
      var id = $(file.previewTemplate).find('.dz-remove').attr('id');

      if (myDropzone.files.length < 5){
        var count = 100 - (myDropzone.files.length* 20) + "%"
      }else if ((myDropzone.files.length + 1) == 10){
        var count = 100 - ((myDropzone.files.length - 5) * 20) + "%"
      }else{
        var count = 100 - ((myDropzone.files.length - 5) * 20) + "%"
      }
      setTimeout(function(){
      $('.dz-message').css('width', count);
    },10);

    if ((myDropzone.files.length + 1) == 10){
      $('.dz-message').show();
    }

      var previewElement;
      return (previewElement = file.previewElement) != null ? (previewElement.parentNode.removeChild(file.previewElement)) : (void 0);
    },
    maxfilesreached	: function(file){
      $(".error").remove();
    },
    maxfilesexceeded : function(file){
      if ((now_images) < 5){
        var count = 100 - (now_images* 20) + "%"
      }else{
        var count = 100 - ((now_images - 5) * 20) + "%"
      }
      setTimeout(function(){
      $('.dz-message').css('width', count);
    },10);

    if (now_images >= 10){
      $('.dz-message').hide();
    }else{
      $('.dz-message').show();
    }

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
    var count = 100 - (myDropzone.files.length * 22) + "%"
      $('.dz-message').css('width', count);
  })

　if(document.URL.match("sell")) {
  locateCenter(); 
  $(window).resize(locateCenter);  
  function locateCenter() {
    let w = $(window).width();
    let h = $(window).height();
    
    let cw = $('#modalWindow').outerWidth();
    let ch = $('#modalWindow').outerHeight();
   
    $('#modalWindow').css({
      'left': ((w - cw) / 2) + 'px',
      'top': ((h - ch) / 2) + 'px'
    });
  }
}
});