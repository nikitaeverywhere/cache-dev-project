/**
 * From http://stackoverflow.com/a/4033310/2590150
 * @param {string} theUrl
 * @param {function} callback
 */
function httpGet (theUrl, callback)  {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
            var data;
            try {
                data = JSON.parse(xmlHttp.responseText);
                callback(data);
            } catch (e) {
                console.error(e, xmlHttp.responseText);
            }
        }
    };
    xmlHttp.open("GET", theUrl, true); // true for asynchronous
    xmlHttp.send(null);
}

function spawnPressed () {
    httpGet("/Robots/Spawn", function (data) {
        if (data.status == 1)
            getRobots();
        else
            alert("Error! " + data);
    });
}

function getRobots () {
    httpGet("/Robots/", function (data) {
        var tableBody = document.getElementById("tableBody"),
            html = [];
        if (data.error || !tableBody) { alert(data.error || "no #tableBody"); return; }
        for (var id in data) {
            html.push("<tr>",
                "<td>", id, "</td>",
                "<td>", data[id].Name, "</td>",
                "<td>", data[id].Energy, "</td>",
                "<td>", data[id].Message, "</td>",
            "</tr>");
        }
        tableBody.innerHTML = html.join("");
    });
}

window.addEventListener("load", function () {
    document.getElementById("spawnButton").addEventListener("click", spawnPressed);
    getRobots();
});