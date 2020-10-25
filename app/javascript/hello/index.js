//浮き上がる系エフェクト 要素にjs-animationクラスを付与することによって使用可能

function showElementAnimation() {

  var element = document.getElementsByClassName('js-animation');
  if(!element) return; 
  
  var showTiming = window.innerHeight > 768 ? 200 : 40; // 要素が出てくるタイミングはここで調整
  var scrollY = window.pageYOffset;
  var windowH = window.innerHeight;

  for(var i=0;i<element.length;i++) { 
    var elemClientRect = element[i].getBoundingClientRect(); 
    var elemY = scrollY + elemClientRect.top;

    if(scrollY + windowH - showTiming > elemY) {
      element[i].classList.add('is-show');
    } else if(scrollY + windowH < elemY) {
    
    element[i].classList.remove('is-show');
    }
  }
}
showElementAnimation();
window.addEventListener('scroll', showElementAnimation);