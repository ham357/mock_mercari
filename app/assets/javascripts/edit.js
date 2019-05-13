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

      });
    }
  })
  .fail(function() {
    alert('edit error');
  })
　}
});
  });
