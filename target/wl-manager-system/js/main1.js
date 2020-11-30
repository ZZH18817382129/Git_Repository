// JavaScript Document
$(function(){
	//Header
	// $(".menucon").hover(function(){
	// 	$(".smenu").stop().animate({height:"326px"}, 300);	
	// },function(){
	// 	$(".smenu").stop().animate({height:"0"}, 300);
	// });

	// $(".smenu").hover(function() {
	// 	$(this).stop().animate({height:"326px"}, 300);	
	// }, function() {
	// 	$(this).stop().animate({height:"0"}, 300);
	// })

	$(".menucon li").hover(function(){
			$(this).children("a").addClass("active");
		$(this).children(".semenuBox").stop().animate({height: 200},400);	
	},function(){
		$(this).children("a").removeClass("active");
		$(this).children(".semenuBox").stop().animate({height: 0},400);	
	});

	//返回顶部
	if($(window).scrollTop() > 500){$("#backtop").show()};
	$(window).scroll(function(){
		if( $(window).scrollTop() > 500){
			$("#backtop").show()
		}else{
			$("#backtop").hide()
		}
	});
	$("#backtop").click(function(){
		$('html,body').animate({'scrollTop':0},600);
	});	
});