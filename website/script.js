document.addEventListener("DOMContentLoaded", function () {
    let button = document.createElement("button");
    button.innerText = "Download Resume";
    button.onclick = function () {
        alert("Resume download feature coming soon!");
    };

    document.querySelector("main").appendChild(button);
});
