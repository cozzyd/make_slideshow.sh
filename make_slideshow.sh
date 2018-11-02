#/bin/sh 
type=${1-png}
title=${2-pix}


cat >index.html << EOM 
<html>
<head>
<title>$title</title>

<script type="text/javascript">


var slideIndex = 1;



function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("slides");
    slideIndex =n;
    if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length} ;
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndex-1].style.display = "block";
    document.getElementById("slide_index").value = slideIndex; 
    location.hash = "#" + slideIndex;
    document.getElementById("filename").innerHTML = x[slideIndex-1].getAttribute("src"); 
}

function plusDivs(n) {
    showDivs(slideIndex + n);
}

function load() 
{
  var maybe = parseInt(location.hash.slice(1));
  if (!isNaN(maybe)) 
  {
    showDivs(maybe); 
  }
  else showDivs(1); 
}

</script> 
</head>
<body onLoad='load()'>
<input type="button"  onclick="plusDivs(-1)" value="<--">
<input id="slide_index" size=4 value="1" onchange="showDivs(parseInt(document.getElementById('slide_index').value))"> </span>
<input type="button"  onclick="plusDivs(+1)" value="-->">
<span id="filename"> </span>
EOM

for i in *.$type; do 
  echo "<img width=100% class=\"slides\" src=\"$i\">" >> index.html
done

echo "</body></html>" >> index.html 




