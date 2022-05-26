function setDark() 
{	
    document.getElementById("stylesheet").setAttribute("href", "static/css/cssDark.css");
    document.getElementById("dark").style.display = "none";
    document.getElementById("light").style.display = "block";
}

function setLight() 
{
	document.getElementById("stylesheet").setAttribute("href", "static/css/cssLight.css");
	document.getElementById("light").style.display = "none";
    document.getElementById("dark").style.display = "block";
}