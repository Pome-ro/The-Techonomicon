/*
Name: Auto refresh Zendesk
Description:
    - This bookmarklet allows you to manually set a desired refresh interval for the view you are on.
      It uses the built in refresh button to cut down on loading the whole page (which can be slow).


*/

javascript:
interval = prompt("Set timeout In Seconds");
timeout = 1000 * interval;
timeleft = interval;
viewsHeader = document.querySelector('[data-test-id="views_views-list_header"]');
const newNode = document.createElement("div");
newNode.id = "interval";
newNode.classList.add("LRay", "LRaz", "LRba", "LRbb", "LRb", "LRt", "LRbc", "LRbd", "StyledFont-sc-1iildbo-0", "dDJboo");
newNode.style.width = "45%";
const textNode = document.createTextNode(`${timeleft}s`);
newNode.appendChild(textNode);
viewsHeader.insertBefore(newNode, viewsHeader.children[1]);
if (timeout > 0) {
    setTimeout('reload()', timeout);
    setTimeout('updateTimer()', 1000);
};
function reload() {
    setTimeout('reload()', timeout);
    autobtntep = document.querySelector('[aria-label="Refresh views pane"]');
    autobtntep.click();
};
function updateTimer() {
    timerobj = document.getElementById("interval");
    setTimeout('updateTimer()', 1000);
    if (timeleft === 0) {
        timeleft = interval;
    } else {
        timeleft = timeleft - 1;
    };

    timerobj.textContent = `${timeleft}s`;
};


