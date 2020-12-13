function palindromes(arr) {
  arr = arr.toLowerCase().split("");
  let reverse = [];
  let letters = "abcdefghijklmnopqrstuvwxzy".split("");

  for (let index = 0; index < arr.length; index++) {
    if (!letters.includes(arr[index])) delete arr[index];
  }

  arr = arr.filter(x => x);

  for (let index = 0; index < arr.length; index++) {
    reverse[index] =  arr[arr.length - index - 1];  
  }

  return arr.join() == reverse.join();
}
