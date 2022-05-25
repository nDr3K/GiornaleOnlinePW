//
let elements = document.getElementsByClassName("categorie");

for (let i = 0; i < elements.length; i++)
{
    elements[i].addEventListener("click", showElements());
}

function showElements()
{
    this.parentNode.parentNode.parentNode.parentNode.querySelector("elementsContent")[0].style.display = "block";
}