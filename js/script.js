
function getRandIntIncInc(min, max) {
	return Math.floor(Math.random() * (max - min + 1)) + min;
}

function getRandIntIncExc(min, max) {
	return Math.floor(Math.random() * (max - min) + min);
}

function changeBg() {
	var randBg = getRandIntIncExc(0, bgs.length);
	document.body.style.backgroundImage = "url('../pix/bg/"+bgs[randBg]+"')";
}

function changeCursor() {
	var randCursor = getRandIntIncInc(1, 13);
	document.body.style.cursor = "url('../pix/cursors/"+randCursor+".cur'), auto";
}

function showHideID(ele_id) {
	var x = document.getElementById(ele_id);
	x.style.display === "none" ? x.style.display = "block" : x.style.display = "none";
}

var bgs = ['1510357933-854992703.jpg', '411517.jpg', 'act1.jpg', 'act2.jpg', 'act3.jpg', 'act4.jpg', 'act4c.jpg', 'act5.jpg'];

changeBg();
changeCursor();

document.getElementById('changeBg').addEventListener('click', function (event) {
	changeBg();
	changeCursor();
});

// document.body.addEventListener('click', function (event) {
// 	console.log(1);
// 	showHideID('info');
// });


// setInterval(function(){ 
// 	changeBg(); changeCursor();
// }, 20*1000);

