import consumer from "./consumer"

consumer.subscriptions.create("ReactionChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const btnId = `reaction-btn-${data.content}`;
    const reactionButton = document.getElementById(btnId);
    const checkedButton = document.getElementById(`${btnId}-checked`);
    const reactionCount = document.getElementById(`reaction-count-${data.content}`);
    if (reactionButton.getAttribute("class").includes("hidden")) {
      reactionButton.setAttribute("class", "btn border-primary");
      checkedButton.setAttribute("class", "hidden");
      reactionCount.innerHTML =　Number(reactionCount.innerHTML) - 1;
    } else {
      reactionButton.setAttribute("class", "hidden");
      checkedButton.setAttribute("class", "btn btn-primary");
      reactionCount.innerHTML = Number(reactionCount.innerHTML) + 1;
    }
  }
});
