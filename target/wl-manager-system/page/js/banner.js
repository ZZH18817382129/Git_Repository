$(function(){
	var listN = $(".bannerpic li").size();
	for(i=0;i<listN;i++){
		$(".bannerbtn").append('<span style="right:'+59*(listN-i-1)+'px"></span>');
	}
	$(".bannerpic ul li").eq(0).css("display","block").fadeIn(600);
	$(".bannerbtn span").eq(0).addClass("on")
	var sw = 1;
	$(".bannerbtn span").mouseover(function(){
		sw = $(".bannerbtn span").index(this);
		myShow(sw);
	});
	function myShow(i){
		$(".bannerpic ul li").eq(i).stop(true,true).css("display","block").fadeIn(800).siblings("li").fadeOut(600);
		$(".bannerbtn span").eq(i).addClass("on").siblings("span").removeClass("on");
	}
	//滑入停止动画，滑出开始动画
	$(".bannerpic").hover(function(){
		if(myTime){
		   clearInterval(myTime);
		}
	},function(){
		myTime = setInterval(function(){
		  myShow(sw)
		  sw++;
		  if(sw==listN){sw=0;}
		} , 5000);
	});
	//自动开始
	var myTime = setInterval(function(){
	   myShow(sw)
	   sw++;
	   if(sw==listN){sw=0;}
	} , 3500);
})