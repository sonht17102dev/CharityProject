var boxBank = document.getElementById('box-bank');
	var boxOffice = document.getElementById('box-office');
	var bankInfo = document.getElementById('bank-info');
	var officeInfo = document.getElementById('office-info');

	boxBank.addEventListener('click', function() {
		bankInfo.classList.remove('hidden');
		officeInfo.classList.add('hidden');
	});

	boxOffice.addEventListener('click', function() {
		bankInfo.classList.add('hidden');
		officeInfo.classList.remove('hidden');
	});