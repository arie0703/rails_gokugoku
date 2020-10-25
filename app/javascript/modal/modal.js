var btn = document.getElementById('btn');  //id="btn"を取得する変数
var modal = document.getElementById('modal');
var closeBtn = document.getElementById('closeBtn');

//第一引数にモーダルを発生させる動作、第二引数に効果（モーダルのdisplayをblockにする）
btn.addEventListener('click', function() {
modal.style.display = 'block';
});

//閉じる用
closeBtn.addEventListener('click', function() {
modal.style.display = 'none';
});