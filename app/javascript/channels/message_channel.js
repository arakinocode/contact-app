import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    const name = `<p>${data.user.name}</p>`;
    const createdAt = `<p>${data.content.created_at}</p>`;
    const content = `<p>${data.content.content}</p>`;
    const html = `
    <div class="message">
    <div class="upper-message">
      <div class="message-user">
        <p>${name}</p>
      </div>
      <div class="message-date">
        <p>${createdAt}</p>
      </div>
    </div>
    <div class="lower-message">
      <div class="message-content">
        <p>${content}</p>
        </div>
    </div>`
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_content');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
