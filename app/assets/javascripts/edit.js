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
          var yourstring = value.image_url.url
          var fileNameIndex = yourstring.lastIndexOf("/") + 1;
          var filename = yourstring.substr(fileNameIndex);

        var mockFile = { name: filename ,
          status: Dropzone.ADDED, 
          url: yourstring };
        myDropzone.emit("addedfile", mockFile);
        myDropzone.emit("thumbnail", mockFile, yourstring);

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
