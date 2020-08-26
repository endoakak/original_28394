if (/posts/.test(window.location.pathname)) {
  document.addEventListener("DOMContentLoaded", function() {
    const checkBox = document.getElementById("spoiler-check-box");
    if (checkBox !== null) {
      checkBox.addEventListener("change", function(e) {
        const posts = document.querySelectorAll(".post-wrapper");
        posts.forEach(function(post) {
          if (post.innerHTML.includes("ネタバレあり")) {
            if (post.getAttribute("class").includes("hidden")) {
              post.setAttribute("class", "post-wrapper col-9 bg-white border border-primary pt-5 px-5 pb-3 mb-5");
            } else {
              post.setAttribute("class", "post-wrapper col-9 bg-white border border-primary pt-5 px-5 pb-3 mb-5 hidden");
            }
          }
        });
      });
    }
  });
}
