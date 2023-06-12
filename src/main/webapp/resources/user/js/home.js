// Get the modal
var modalLogin = document.getElementById('id-login');
var modalSignup = document.getElementById('id-signup');
var modal = document.getElementById('id-news-1');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modalLogin) {
		modalLogin.style.display = "none";
	}
	if (event.target == modalSignup) {
		modalSignup.style.display = "none";
	}
	if (event.target == modal) {
		modal.style.display = "none";
	}
}