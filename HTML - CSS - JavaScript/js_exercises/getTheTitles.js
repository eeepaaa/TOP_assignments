function getTheTitles(arr) {
  let result = [];

  for (let index = 0; index < arr.length; index++) {
    result[index] = arr[index].title;
  }

  return result;
}
