document.addEventListener('turbo:load', () => {
  
    let itemCount = document.querySelectorAll('#items-container .form-control').length;
   
    //  // 「項目を追加」ボタンのイベントリスナー
    //  document.getElementById('add-item-btn').addEventListener('click', () => {
    //   itemCount++;
    //   const newItem = document.createElement('div');
    //   newItem.classList.add('mb-3');
    //   newItem.innerHTML = `<input type="text" class="form-control text-center mx-auto" style="width: 80%" placeholder="${itemCount}. 項目名を入力してください">`;
    //   document.getElementById('items-container').appendChild(newItem);
    // });
  
    document.getElementById('delete-item-btn').addEventListener('click', () => {
      const itemsContainer = document.getElementById('items-container');
      if (itemsContainer.childElementCount > 0) {
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
