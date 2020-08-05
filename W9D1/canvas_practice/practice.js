document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas')
    canvas.height = 500
    canvas.width = 500
    const ctx = canvas.getContext('2d')
    ctx.fillStyle = 'red'
    ctx.fillRect(20,30,40,50)
    ctx.beginPath();
    ctx.arc(100, 200, 60, 30,0, true);
    ctx.strokeStyle = "green";
    ctx.lineWidth = 5;
    ctx.stroke()
    ctx.fillStyle = 'yellow'
    ctx.fill()
});
