/*
Name: Auto refresh Zendesk
Description:
    - This bookmarklet allows you to manually set a desired refresh interval for the view you are on.
      It uses the built in refresh button to cut down on loading the whole page (which can be slow).

Instructions:
    1. Add a new bookmark to your bookmark bar (chrome or firefox).
    2. Name the bookmark something you'll understand (Enable Zendesk Autorefresh).
    3. Copy the code below from line 13 to line 66 and paste it into the URL field.
    4. Navitage to a view in Zendesk.
    5. Click the bookmark to activate the code.
    To deactivate the code, simply reload the page.
*/

javascript:
interval = prompt("Set timeout In Seconds");
timeout = 1000 * interval;
timeleft = interval;
countdownText = `${timeleft}s`;
viewsHeader = document.querySelector('[data-test-id="views_views-list_header"]').children[1];
const newNode = document.createElement("button");
newNode.id = "interval";
newNode.setAttribute('onclick', 'stopReload()');
newNode.classList.add("LRaz", "LRbg", "LRba", "LRbb", "StyledIconButton-sc-1t0ughp-0", "dVIhxi", "StyledFont-sc-1iildbo-0", "dDJboo");
const textNode = document.createTextNode(countdownText);
newNode.appendChild(textNode);
viewsHeader.insertBefore(newNode, viewsHeader.children[0]);
updateTimerInterval = null;
if (timeout > 0) {
    updateTimerInterval = setInterval('updateTimer()', 1000);
};
function stopReload() {
    if (timeout > 0) {
        clearInterval(updateTimerInterval);
        timeout = 0;
        countdownText = "⏸";
        timerobj = document.getElementById("interval");
        timerobj.textContent = countdownText;
    } else {
        interval = prompt("Set timeout In Seconds");
        timeout = 1000 * interval;
        timeleft = interval;
        countdownText = `${timeleft}s`;
        if (timeout > 0) {
            timerobj = document.getElementById("interval");
            timerobj.textContent = countdownText;
            updateTimerInterval = setInterval('updateTimer()', 1000);
        };
    };
};
function reload() {
    refreshbtn = document.querySelector('[aria-label="Refresh views pane"]');
    refreshbtn.click();
};
function updateTimer() {
    timerobj = document.getElementById("interval");
    if (timeleft === 0) {
        timeleft = interval;
        reload()
    } else {
        timeleft = timeleft - 1;
    };
    countdownText = `${timeleft}s`;
    timerobj.textContent = countdownText;
};


