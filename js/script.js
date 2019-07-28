
function getRandIntIncInc(min, max) {
	return Math.floor(Math.random() * (max - min + 1)) + min;
}

function getRandIntIncExc(min, max) {
	return Math.floor(Math.random() * (max - min) + min);
}

function changeBg() {
	var randBg = getRandIntIncExc(0, bgs.length);
	document.body.style.backgroundImage = "url('pix/bg/"+bgs[randBg]+"')";
}

function showHideID(ele_id) {
	var x = document.getElementById(ele_id);
	x.style.display === "none" ? x.style.display = "block" : x.style.display = "none";
}

var bgs = ['1510357933-854992703.jpg', 'act1.jpg', 'act2.jpg', 'act3.jpg', 'act4.jpg', 'act4c.jpg', 'act5.jpg', 'act5_ancients.jpg'];
changeBg();

var randCursor = getRandIntIncInc(1, 13);
document.body.style.cursor = "url('pix/cursors/"+randCursor+".cur'), auto";

document.getElementById('changeBg').addEventListener('click', function (event) {
	changeBg();
});


// setInterval(function(){ 
// 	changeBg();
// }, 2000);

