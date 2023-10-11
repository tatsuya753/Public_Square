// post_detail.js
document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.DivLink').forEach(postLink => {
    postLink.addEventListener('click', () => {
      const postId = postLink.dataset.postId;
      location.href = `/posts/${postId}`;
    });
  });
});