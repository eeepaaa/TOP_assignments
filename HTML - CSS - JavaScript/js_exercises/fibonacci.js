function fibonacci(num) {
  if (num < 1) return "OOPS";
  if (typeof num == "string") Number(num);

  let series = [1, 1];
  let count = 1;

  for (let index = 2; index < num; index++) {
    count = series[index - 1] + series[index - 2];
    series[index] = count;
  }

  return count;
}
