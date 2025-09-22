document.addEventListener("DOMContentLoaded", function () {
  const resultado = document.getElementById("resultado");
  let current = "";
  let lastInput = "";

  const buttons = document.querySelectorAll(".btn-number");
  const clearBtn = document.getElementById("btn-clear");

  function handleInput(value) {
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
    } else if (value === "," || value === ".") {
      if (!lastInput.includes(",")) {
        current += ".";
        resultado.textContent += ",";
        lastInput += ",";
      }
    } else if (["+", "-", "*", "/"].includes(value)) {
      current += value;
      resultado.textContent += value;
      lastInput = "";
    } else if (!isNaN(value)) {
      current += value;
      resultado.textContent += value;
      lastInput += value;
    }
  }

  buttons.forEach(btn => {
    btn.addEventListener("click", function () {
      handleInput(btn.textContent);
    });
  });

  clearBtn.addEventListener("click", function () {
    current = "";
    lastInput = "";
    resultado.textContent = "";
  });

  document.addEventListener("keydown", function (e) {
    if (e.key === "Enter" || e.key === "=") {
      handleInput("=");
    } else if (e.key === "Escape" || e.key.toLowerCase() === "c") {
      clearBtn.click();
    } else if (["+", "-", "*", "/"].includes(e.key)) {
      handleInput(e.key);
    } else if (e.key === "," || e.key === ".") {
      handleInput(",");
    } else if (!isNaN(e.key) && e.key !== " ") {
      handleInput(e.key);
    }
  });

  resultado.textContent = "";
});