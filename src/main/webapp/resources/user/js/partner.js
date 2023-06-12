var items = document.getElementById("itemsPartner");
	items.classList.add("hide-partner") // Hiển thị toàn bộ nội dung
	items.classList.remove("show-partner") // Giấu một phần nội dung
function showMore() {
	items.classList.remove("hide-partner") // Hiển thị toàn bộ nội dung
	items.classList.add("show-partner") // Hiển thị toàn bộ nội dung
	document.getElementById('showMoreButton').style.display = 'none';  // Ẩn nút "Hiển thị thêm"
}