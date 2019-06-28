$(document).on('turbolinks:load', function() {
  if ($("#charge-form").length){
    var form = $("#charge-form");
    Payjp.setPublicKey('pk_test_a15829099e8ebf7b20d35274');
    $(document).on("click", "#submit-button", function(e) {
  
      e.preventDefault();
      form.find("input[type=submit]").prop("disabled", true);
  
      var card = {
          number: $("#card_number").val(),
          cvc: $("#cvc").val(),
          exp_month: $("#exp_month").val(),
          exp_year: $("#exp_year").val(),
      };
      Payjp.createToken(card, function(s, response) {
        if (response.error) {
          alert("カード情報が正しくありません。");
        }
        else {
              $("#card_number").removeAttr("name");
              $("#cvc").removeAttr("name");
              $("#exp_month").removeAttr("name");
              $("#exp_year").removeAttr("name"); 
          var token = response.id;
  
          form.append($('<input type="hidden" name="payjpToken" />').val(token));
          form.get(0).submit();
        }
      });
    });
  }
});
