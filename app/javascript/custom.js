document.addEventListener('turbo:load', () => {
  
    let itemCount = document.querySelectorAll('#items-container .form-control').length;
   
   
     document.getElementById('add-item-btn').addEventListener('click', () => {
      itemCount++;
      const url = `http://localhost:3000/pages/createPage?item_count=${itemCount}`;
      window.location.href = url;
    });
  
    document.getElementById('delete-item-btn').addEventListener('click', () => {
      const itemsContainer = document.getElementById('items-container');
      if (itemsContainer.childElementCount > 1) {
        itemsContainer.removeChild(itemsContainer.lastElementChild);
        itemCount--;
      } else {
        alert("これ以上削除できません。");
      }
    });

    document.addEventListener('click', (event) => {
      if (event.target.classList.contains("bi-trash")) {
          const row = event.target.closest(".row");
          if (row) {
              row.remove();
          }
      }
    });

    const form = document.querySelector("form");
    const createBtn = document.getElementById("create-btn");

    form.addEventListener("submit", function (event) {
      let isValid = true;
      const title = form.querySelector("input[name*='title']");
      const items = form.querySelectorAll("input[name*='items']");

      if (!title.value.trim()) {
          isValid = false;
      }

      items.forEach(item => {
          if (!item.value.trim()) {
              isValid = false;
          }
      });

      if (!isValid) {
          alert("全ての項目に入力してください");
          event.preventDefault();
      }
    });
});
