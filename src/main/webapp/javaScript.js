/**
 * 
 */

function loginValidate() {
	//console.log("hello");
	document.getElementById('loginErr').innerHTML = "";
	var uname = document.forms['loginForm']['usrname'].value;
	var re = new RegExp('^[a-zA-Z_][^~`;,.\"\' ]*$');
	if (!re.test(uname)) {
		document.getElementById('loginErr').innerHTML = "Invalid UserName, username must start with alphabet or underscore <br> it should not contain space";
		return false;
	}
	return true;
}
function signupValidate() {
	document.getElementById('signupErr').innerHTML = "";
	var uname = document.forms['signupForm']['usrname'].value;
	var name = document.forms['signupForm']['name'].value;
	var email = document.forms['signupForm']['emailID'].value;
	var phno = document.forms['signupForm']['phno'].value;
	//var pass = document.forms['signupForm']['passwd'].value;
	var re = new RegExp('^[a-zA-Z_][^~`;,.\"\']*$');
	var c = 0, msg = "";
	if (!re.test(uname)) {
		msg += "Invalid UserName donot include ~`;,.\"\'whitespaces also<br>";
		c++;
	}
	re = new RegExp('^[a-zA-Z][a-zA-Z ]*$');
	if (!re.test(name)) {
		msg += "Invalid Name, name should contain only alphabet and white-spaces<br>";
		c++;
	}
	re = new RegExp('^[a-zA-Z!#$%^&*(){}0-9]+@gmail.com$');
	if (!re.test(email)) {
		msg += "Invalid Email, we only accept gmails i.e xxx@gmail.com.<br>";
		c++;
	}
	if (phno.length !== 10 || Number.isNaN(Number(phno))) {
		msg += "Invalid Phone Number, it should contain only digits and should of length 10";
		c++;
	}
	if (c !== 0) {
		document.getElementById('signupErr').innerHTML = msg;
		return false;
	}
	else return true;
}

function showEventList(a) {
	const xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById('event-list').innerHTML = this.responseText;
		}
	};
	let url = "showEvents.jsp?";
	let search = document.getElementById('searchEvent').value;
	let eventCat = document.getElementById('eventCategory').value;
	let price = document.getElementById('eventPrice').value;
	let city = document.getElementById('eventCity').value;
	let fromDate = document.getElementById('fromDate').value;
	let toDate = document.getElementById('toDate').value;
	if (search != "") {
		url = url + "searchEvent=" + search + "&";
	}
	if (eventCat != "default") {
		url = url + "eventCat=" + eventCat + "&";
	}
	if (price != "default") {
		url = url + "priceThres=" + price + " &";
	}
	if (city != "default") {
		url = url + "city=" + city + " &";
	}
	if (fromDate != "") {
		url = url + "fromDate=" + fromDate + " &";
	}
	if (toDate != "") {
		url = url + "toDate=" + toDate + "&";
	}
	url = url + "pageCount=" + a;
	console.log(url);
	xhttp.open("POST", url);
	xhttp.send();
}

function nextPage() {
	let count = Number(document.getElementById('page').innerHTML);
	//let searchEvent = document.getElementById('searchEvent');
	showEventList(count + 1);
	document.getElementById('page').innerHTML = count + 1;
}

function prevPage() {
	let count = Number(document.getElementById('page').innerHTML);
	//let searchEvent = document.getElementById('searchEvent');
	showEventList(count - 1);
	document.getElementById('page').innerHTML = count - 1;
}

function resetFilter() {
	document.getElementById('searchEvent').value = "";
	document.getElementById('eventCategory').value = "";
	document.getElementById('eventPrice').value = "";
	document.getElementById('eventCity').value = "";
	document.getElementById('fromDate').value = "";
	document.getElementById('toDate').value = "";
	location.reload();
}

function showCate() {
	let city = document.getElementById('eventCity').value;
	const xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById('cate').innerHTML = this.responseText;
		}
	};
	xhttp.open('POST', "ShowCategory.jsp?city="+city, true);
	xhttp.send();
}
