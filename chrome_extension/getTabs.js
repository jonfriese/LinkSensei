function getTabs(tabs)  {
  chrome.tabs.getCurrent();

}

chrome.browserAction.onClicked.addListener(getTabs);
