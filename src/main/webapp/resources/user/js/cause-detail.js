/*	Loại bỏ style mặc định khi dùng ckeditor upload hình ảnh*/
	var imgBanners = document.querySelectorAll("#banner-images img");
	
	imgBanners.forEach( item => {
		if(item.hasAttribute("style")){
			item.removeAttribute("style");
		}
	})
	var article = document.getElementById('article');
	var infoArticle = document.getElementById("infoArticle");
	article.classList.add("hide-acticle"); 
	article.classList.remove("show-acticle"); 
	
  	var screenWidth = window.innerWidth || document.documentElement.clientWidth;

  	if (screenWidth < 991) {
	 	infoArticle.style.display = 'none';
  	} else {
	  	infoArticle.style.display = 'block';
  	}
	function showMore() {
		article.classList.remove("hide-acticle") 
		article.classList.add("show-acticle") 
		infoArticle.classList.remove("hideInfoActicle");
		infoArticle.classList.add("showInfoActicle");
		document.getElementById('showMoreButton').style.display = 'none';  // Ẩn nút "Xem thêm"
	}