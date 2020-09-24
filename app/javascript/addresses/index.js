document.addEventListener("turbolinks:load", () => {
  document.getElementById("show_hide")?.addEventListener("click", (e) => {
    event.preventDefault();
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
})
