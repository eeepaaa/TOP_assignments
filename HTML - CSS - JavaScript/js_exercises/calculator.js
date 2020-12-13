function add(num1, num2) {
  return num1 + num2;
}

function subtract(num1, num2) {
  return num1 - num2;
}

function sum(args) {
  let count = 0;

  for (let index = 0; index < args.length; index++) {
    count += args[index];
  }

  return count;
}

function multiply(args) {
  let count = 1;

  for (let index = 0; index < args.length; index++) {
    count *= args[index];
  }

  return count;
}

function power(num, toPower) {
  return num ** toPower;
}

function factorial(num) {
  if (num == 0) return 1;

  let count = num;

  for (let index = num - 1; index >0; index--) {
    count *= index;
  }

  return count;
}
