$(function(){
    $(".navi--hover").hover(function(){
        $(this).css('background-color', '#f5f5f5');
        $('.active').css('background-color', '');
        $(this).find('.fa-chevron-right').css('opacity', '1');
        $(this).find('.fa-chevron-right').animate({'right':'-5px'},50);
    }, function(){
        $(this).css('background-color', '');
        $(this).find('.fa-chevron-right').css('opacity', '');
        $(this).find('.fa-chevron-right').animate({'right':'0px'},100);
    });
});
