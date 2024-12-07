document.addEventListener('turbo:load', () => {
    let itemCount = document.querySelectorAll('#items-container .form-control').length;
  
    // 「項目を追加」ボタンのイベントリスナー
    document.getElementById('add-item-btn').addEventListener('click', () => {
      itemCount++;
      const newItem = document.createElement('div');
      newItem.classList.add('mb-3');
      newItem.innerHTML = `<input type="text" class="form-control text-center mx-auto" style="width: 80%" placeholder="${itemCount}. 項目名を入力してください">`;
      document.getElementById('items-container').appendChild(newItem);
    });
  
    // 「項目を削除」ボタンのイベントリスナー
    document.getElementById('delete-item-btn').addEventListener('click', () => {
      const itemsContainer = document.getElementById('items-container');
      if (itemsContainer.childElementCount > 0) {
        itemsContainer.removeChild(itemsContainer.lastElementChild);
        itemCount--;
      } else {
        alert("これ以上削除できません。");
      }
    });
  });
  