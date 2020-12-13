const operators = document.getElementsByClassName("operators");
const numbers = document.getElementsByClassName("numbers");
const clear = document.getElementById("clear");
const backspace = document.getElementById("backspace");
const decimal = document.getElementById("decimal");
const equal = document.getElementById("equal");
const screen = document.getElementById("input");
let previousNumber = "0";
let input = "";

function enableInput() {
  for (let index = 0; index < numbers.length; index++) {
    const number = numbers[index];
    number.addEventListener("click", function() {
      if (previousNumber == "0") previousNumber = "";
      previousNumber += `${this.textContent}`;
      screen.textContent = previousNumber;
    });
  }

  decimal.addEventListener("click", function() {
    if (previousNumber.indexOf(".") > 0) return;
    previousNumber += `${this.textContent}`;
    screen.textContent = previousNumber;
  })

  for (let index = 0; index < operators.length; index++) {
    const operator = operators[index];
    operator.addEventListener("click", function() {
      if (screen.textContent == "0") return;
      if (input.split(" ")[0] == false) {
        input = `${screen.textContent} ${this.textContent} `;
      } else {
        input += screen.textContent;
        calculate(input);
        input = `${screen.textContent} ${this.textContent} `;
      }
      previousNumber = "0";
    });
  }

  clear.addEventListener("click", function() {
    previousNumber = "0";
    screen.textContent = "0";
    input = "";
  });

  backspace.addEventListener("click", function() {
    if (screen.textContent == "0") return;
    previousNumber = previousNumber.split("");
    previousNumber.pop();
    previousNumber = previousNumber.join("");
    if (previousNumber == "") {
      screen.textContent = "0";
    } else {
      screen.textContent = previousNumber;
    }
  });

  equal.addEventListener("click", function() {
    if (previousNumber == "0") return;
    input += screen.textContent;
    calculate(input);
    input = "";
    previousNumber = "0";
  });
}

function calculate(string) {
  number1 = Number(string.split(" ")[0]); 
  operator = string.split(" ")[1];
  number2 = Number(string.split(" ")[2]);

  if ((number1 == "") || (operator == "") || (number2 == "")) return;
  if (operator == "+") result = sum(number1, number2);
  if (operator == "-") result = substract(number1, number2);
  if (operator == "*") result = multiply(number1, number2);
  if (operator == "/") result = divide(number1, number2);

  function sum(a, b) {
    return a + b; 
  }

  function substract(a, b) {
    return a - b;
  }

  function multiply(a, b) {
    return a * b;
  }

  function divide(a, b) {
    return a / b;
  }

  if (result.toString().includes(".")) {
    screen.textContent = Number(result.toFixed(2));
  } else {
    screen.textContent = result;
  }
}

enableInput();
