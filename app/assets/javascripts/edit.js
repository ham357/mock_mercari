$(function(){

  $(window).on('load',function(){
    　if(document.URL.match("edit")) {
  $.ajax({ 
    url: document.URL, 
    type: 'GET',
    dataType: 'json' 
  })
  .done(function(data) {

    if (data) {

        $.each(data["product_images"], function(key,value){
          var image_long_url = value.image_url.url
          var fileNameIndex = image_long_url.lastIndexOf("/") + 1;
          var filename = image_long_url.substr(fileNameIndex);

          var mockFile = { name: filename ,
                          status: Dropzone.ADDED, 
                          url: image_long_url };
          myDropzone.emit("addedfile", mockFile);
          myDropzone.emit("thumbnail", mockFile, image_long_url);

          myDropzone.files.push(mockFile);
          
          var total_images = $('.dz-preview').length
  
          if (total_images < 5){
          var count = 100 - total_images * 20 + "%" 
          }else if (total_images >= 10){
            $('.dz-message').hide();
          }else{
            var count = 100 - (total_images - 5 ) * 20 + "%"
          }
            $('.dz-message').css('width', count);
      });
    }
  })
  .fail(function() {
    alert('edit error');
  })
　}
});
  });
