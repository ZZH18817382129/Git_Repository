(function(window) {

/*************************************
* 						
* 		图片切换		
* sliderWidth: 切换宽度  
* speedTime:一次切换所花的时间
* autoTime: 自动切换的间隔时间
*
***************************************/
var slideX = function(thisUl, btnLeft, btnRight, sliderWidth, speedTime, autoTime) {

	this.slideUl = thisUl;
	this.slideLi = thisUl.find("li");
	this.btnLeft = btnLeft;
	this.btnRight = btnRight;
	this.sliderWidth = sliderWidth;
	this.speedTime = speedTime;
	this.autoTime = autoTime;
	this.canClick = true;
	this.init();
};

slideX.prototype = {

	init: function () {
		var _self = this;

		this.slideUl.width(this.slideLi.length * this.sliderWidth);
		this.slideAuto();
		this.btnLeft.click(function(){
			if (_self.canClick) {
				
				_self.slideLeft();
			};
		}).hover(function() {
			_self.slideStop();
		}, function() {
			_self.slideAuto();
		});

		this.btnRight.click(function() {
			if (_self.canClick) {

				_self.slideRight();
			};
		}).hover(function() {_self.slideStop();}, function() {_self.slideAuto();});
		this.slideUl.hover(function() {_self.slideStop();}, function() {_self.slideAuto();});
	},
	slideLeft: function () {
		var _self = this;

		this.canClick = false;
		this.slideUl.find('li:last').prependTo(_self.slideUl);
		this.slideUl.css('marginLeft', 0-this.sliderWidth);
		this.slideUl.animate({ 'marginLeft': 0 }, this.speedTime, function () {
			
			_self.canClick = true;			
		});
		return false;
	},
	slideRight: function () {
		var _self = this;

		this.canClick = false;
		this.slideUl.animate({ 'marginLeft': 0-this.sliderWidth}, this.speedTime, function () {
			_self.slideUl.css('marginLeft', '0');
			_self.slideUl.find('li:first').appendTo(_self.slideUl);
			_self.canClick = true;
		});
		return false;
	},
	slideAuto: function () {
		var _self = this;

		this.intervalId = window.setInterval(function () {_self.slideRight();}, this.autoTime);
	},
	slideStop: function () {
		window.clearInterval(this.intervalId);
	}
}

window.slideX = slideX;

})(window);
