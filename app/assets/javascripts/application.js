document.getElementById("show_hide")?.addEventListener("click", (e) => {
  e.preventDefault();
  const linkElement = e.target;
  const fullTextElement = document.getElementById("full_text");
  if (fullTextElement.style.display === "none") {
    fullTextElement.style.display = "inline-block";
    linkElement.innerHTML = "▼ Hide full text"
  } else {
    fullTextElement.style.display = "none";
    linkElement.innerHTML = "▶ Show full text"
  }
});

const loginButton = document.getElementById('login-button');
if (loginButton) {
  loginButton.addEventListener('click', (event) => {
    event.preventDefault();
    document.getElementById('login-form').submit();
  })
}
