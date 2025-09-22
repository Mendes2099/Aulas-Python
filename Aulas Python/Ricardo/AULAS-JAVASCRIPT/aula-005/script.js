document.addEventListener("DOMContentLoaded", function () {
  const resultado = document.getElementById("resultado");
  let current = "";
  let lastInput = "";

  // ...existing code...
const buttons = document.querySelectorAll(".btn-number");

  const clearBtn = document.getElementById("btn-clear");

  buttons.forEach(btn => {
    btn.addEventListener("click", function () {
      let value = btn.textContent;

      if (value === "=") {
        try {
          let expr = current.replace(/,/g, ".");
          let res = eval(expr);
          resultado.textContent = res;
          current = res.toString();
        } catch {
          resultado.textContent = "Erro";
          current = "";
        }
      } else if (value === ",") {
        if (!lastInput.includes(",")) {
          current += ".";
          resultado.textContent += ",";
          lastInput += ",";
        }
      } else if (["+", "-", "*", "/"].includes(value)) {
        current += value;
        resultado.textContent += value;
        lastInput = "";
      } else {
        current += value;
        resultado.textContent += value;
        lastInput += value;
      }
    });
  });

  clearBtn.addEventListener("click", function () {
    current = "";
    lastInput = "";
    resultado.textContent = "";
  });

  resultado.textContent = "";
});