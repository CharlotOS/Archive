// old render module?? idk if anyone uses it
// lol look at this canvas mess

const canvas = document.createElement("canvas");
canvas.width = 800;
canvas.height = 600;
document.body.appendChild(canvas);

const ctx = canvas.getContext("2d");
ctx.fillStyle = "red";
ctx.fillRect(100, 100, 200, 200);

// clicks get logged for "debug"? lol
document.addEventListener("click", e => {
  fetch("/log.php", {
    method: "POST",
    body: JSON.stringify({ x: e.clientX, y: e.clientY })
  });
});
