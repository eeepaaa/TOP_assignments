function caesar(string, shift) {
  if (shift > 26) return console.error("Shift value greater than 25!");
  if (shift < 0) shift += 26;

  const letters = "abcdefghijklmnopqrstuvwxyz".split("");
  let convertedString = "";
  
  string.split("").forEach(e => {

    if (letters.includes(e)) {
      let eIndex = letters.indexOf(e) + shift;
      if (eIndex > 25) eIndex -= 26;
      convertedString += letters[eIndex];

    } else if (letters.includes(e.toLowerCase())) {
      let eIndex = letters.indexOf(e.toLowerCase()) + shift;
      if (eIndex > 25) eIndex -= 26;
      convertedString += letters[eIndex].toUpperCase();
      
    } else {
      convertedString += e;
    }
  });

  return convertedString;
}