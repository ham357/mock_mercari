$(function(){
  Dropzone.autoDiscover = false;

    $("#item-dropzone").dropzone({
    paramName : "product[product_images_attributes][image_url]",
    maxFiles: 10,
    maxFilesize: 2,
    parallelUploads: 10,
    maxThumbnailFilesize: 10,
    addRemoveLinks: true,
    uploadMultiple: true,
    autoProcessQueue: false,
    dictRemoveFile:'削除',
    previewsContainer: '#dz-previews',
    previewTemplate:`<div class="dz-preview"><div class="dz-image"><img data-dz-thumbnail /></div><a class="dz-edit">編集</a></div>`,
    init: function(){
      myDropzone = this
      $('form').submit(function(e){
      　if(document.URL.match("sell")) {
        e.preventDefault();
      }
        myDropzone.processQueue();
        $('.dz-remove').text('削除');
      })
    this.on("removedfile", function (file) {
      if (file.url && file.url.trim().length > 0) {
          $("<input type='hidden'>").attr({
              id: 'DeletedImageUrls',
              name: 'DeletedImageUrls'
          }).val(file.name).appendTo('#item-dropzone');
      }
  });
    },
    drop: function(){
      $(document).ready();
      $('#dz-preview').append(`<div class="dz-preview"><div class="dz-image"><img data-dz-thumbnail /></div><a class="dz-edit">編集</a></div>`)

      if (($('.dz-preview').length + 1) < 5){
      var count = 100 - (($('.dz-preview').length + 1) * 20) + "%"
    }else if (($('.dz-preview').length + 1) >= 10){
      $('.dz-message').hide();
    }else{
      var count = 100 - (($('.dz-preview').length - 4 ) * 20) + "%"
    }
    $('.dz-message').css('width', count);

    },
    success: function(file, response){
      window.location.href = "/"; 
    },
    removedfile: function(file){
      var id = $(file.previewTemplate).find('.dz-remove').attr('id');

      if (($('.dz-preview').length - 1) < 5){
        var count = 100 - (($('.dz-preview').length - 1) * 20) + "%"
      }else if (($('.dz-preview').length + 1) >= 10){
        $('.dz-message').show();
      }else{
        var count = 100 - (($('.dz-preview').length - 6) * 20) + "%"
      }
      $('.dz-message').css('width', count);
      var previewElement;
      return (previewElement = file.previewElement) != null ? (previewElement.parentNode.removeChild(file.previewElement)) : (void 0);
    },
    complete: function(obj){
      var xhr = obj.xhr
      var response = obj.xhr.response
      var error = JSON.parse(xhr.responseText)
      if (error.error_name == "" &&
          error.error_description == "" &&
          error.error_category == "" &&
          error.error_state == "" &&
          error.error_price == "" &&
          error.error_delivery_cost == "" &&
          error.error_delivery_prefecture == "") {
        window.location.href = error.root_path
      } else {
        $('.item_name').append(`<p class="error"> ${error.error_name} </p>`);
        $('.item_description').append(`<p class="error"> ${error.error_description} </p>`);
        $('.item_category').append(`<p class="error"> ${error.error_category} </p>`);
        $('.item_state').append(`<p class="error"> ${error.error_state} </p>`);
        $('.item_cost').append(`<p class="error"> ${error.error_delivery_cost} </p>`);
        $('.item_prefecture').append(`<p class="error"> ${error.error_delivery_prefecture} </p>`);
        $('.item_date').append(`<p class="error"> ${error.error_delivery_date} </p>`);
        $('.item_price__right').append(`<p class="error"> ${error.error_price} </p>`);
        $('.item_new__delivery').css('min-height', '340px')
        $('.item_price').css('min-height', '100px')
      }
    },
    error: function(){
      alert('error');
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