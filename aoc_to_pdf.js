// This isn't designed to just be run - take each part and save them into a bookmarklet. This site:
// https://mrcoles.com/bookmarklet/
// is a good resource. Open the problem and click the bookmarklet for the part you want, and you will get a print dialog containing the problem by itself.

// GET PART 1

var descs = document.getElementsByClassName('day-desc');
var part1 = descs[0];
var oldPage = document.body.innerHTML;
document.body.innerHTML = "<html><head><title></title></head><body>" +
						   "<div style=\"padding: 15px\">" + 
                           "<div>" + part1.innerHTML + "</div>" +
                           "<div>" + part1.nextSibling.nextSibling.innerHTML + "</div>" +
						   "</div>" + 
                           "</body></html>";
window.print();
document.body.innerHTML = oldPage;

// GET PART 2

var descs = document.getElementsByClassName('day-desc');
var part2 = descs[1];
var oldPage = document.body.innerHTML;
document.body.innerHTML = "<html><head><title></title></head><body>" +
						   "<div style=\"padding: 15px\">" + 
                           "<div>" + part2.innerHTML + "</div>" +
                           "<div>" + part2.nextSibling.nextSibling.innerHTML + "</div>" +
						   "</div>" + 
                           "</body></html>";
window.print();
document.body.innerHTML = oldPage;
