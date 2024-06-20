//helps you find a place to be a citizen (Patriotic Eagle location based buff)
//DeadNed

string page = "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta charset=\"UTF-8\">\n";
page+="<title>Buff List Filter</title>";
page+="<style>ul{list-style-type:none;padding-left:5px;}li{padding:10px;}li{border-top:5px double #000;}</style>";

//body start. table html copy+pasted from kol
page+="</head><body><center><table width=\"95%\" cellspacing=\"0\" cellpadding=\"0\" style=\" border: 1px solid blue;\"><tbody><tr>";
page+="<td style=\"color: white;\" align=\"center\" bgcolor=\"blue\"><b> Citizen of ...  </b></td></tr><tr><td>";
page+="Currrent location:<br><b>"+my_location()+"</b>: "+(my_location().pledge_allegiance !="" ? my_location().pledge_allegiance : "<i>Can not pledge</i>")+"<p>";
page+="Mafia's list of locations you Can_adventure() and have a pledge_allegiance node:<br>";
page+="&nbsp;<img src=\"/images/itemimages/flag1.gif\">&nbsp;";
page+="<input type=\"text\" id=\"_f\" placeholder=\"Enter keywords...\" autofocus size=\"36\"><div id=\"_b\"><ul>";

// open to suggestions for improving location filter!
foreach loc in $locations[] 
	if (can_adventure(loc) && loc.pledge_allegiance!="")
		page+="<li><b>"+loc+"</b>: "+loc.pledge_allegiance+"</li>\n";
		
page+="</ul></div></td></tr></table>";
page+="<script>_f=document.getElementById(\"_f\"),_b=document.getElementById(\"_b\"),_f.addEventListener(\"input\",(function(){filterValue=_f.value.toLowerCase(),buffItems=_b.querySelectorAll(\"li\"),buffItems.forEach((e=>{text=e.textContent.toLowerCase(),text.includes(filterValue)?e.style.display=\"block\":e.style.display=\"none\"}))}));</script>";
page+="</body></html>";
page.write();
