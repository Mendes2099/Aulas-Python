// Quiz Data
const quizQuestions = [
  {
    question: "Qual é a capital de Portugal?",
    options: ["Lisboa", "Porto", "Madrid", "Paris"],
    answer: 0
  },
  {
    question: "O JavaScript é uma linguagem de programação?",
    options: ["Verdadeiro", "Falso"],
    answer: 0
  },
  {
    question: "Qual destes é um framework JavaScript?",
    options: ["Django", "React", "Laravel", "Spring"],
    answer: 1
  },
  {
    question: "HTML significa HyperText Markup Language?",
    options: ["Verdadeiro", "Falso"],
    answer: 0
  },
  {
    question: "Qual destes NÃO é um sistema operativo?",
    options: ["Windows", "Linux", "Python", "macOS"],
    answer: 2
  },
  {
    question: "CSS serve para estilizar páginas web?",
    options: ["Verdadeiro", "Falso"],
    answer: 0
  },
  {
    question: "Qual é o resultado de 2 + 2 * 2?",
    options: ["6", "8", "4", "2"],
    answer: 0
  },
  {
    question: "Qual destes é um navegador web?",
    options: ["Chrome", "Excel", "Word", "Photoshop"],
    answer: 0
  },
  {
    question: "O Python é tipado dinamicamente?",
    options: ["Verdadeiro", "Falso"],
    answer: 0
  },
  {
    question: "Qual destes é usado para versionamento de código?",
    options: ["Git", "FTP", "HTTP", "SMTP"],
    answer: 0
  }
];

// Render Quiz
function renderQuiz() {
  const quizForm = document.getElementById('quiz-form');
  quizForm.innerHTML = '';
  quizQuestions.forEach((q, idx) => {
    const optionsHtml = q.options.map((opt, i) =>
      `<div class="form-check">
        <input class="form-check-input" type="radio" name="q${idx}" id="q${idx}o${i}" value="${i}">
        <label class="form-check-label" for="q${idx}o${i}">${opt}</label>
      </div>`
    ).join('');
    quizForm.innerHTML += `
      <div class="mb-3">
        <strong>${idx + 1}. ${q.question}</strong>
        ${optionsHtml}
      </div>
    `;
  });
}

renderQuiz();

// Submission
document.getElementById('submit-quiz').addEventListener('click', function (e) {
  e.preventDefault();
  let score = 0;
  let resultHtml = '';
  quizQuestions.forEach((q, idx) => {
    const selected = document.querySelector(`input[name="q${idx}"]:checked`);
    const correctIdx = q.answer;
    let isCorrect = selected && Number(selected.value) === correctIdx;
    if (isCorrect) score++;
    resultHtml += `<div>
      <strong>${idx + 1}. ${q.question}</strong><br>
      <span style="color:${isCorrect ? 'green' : 'red'};">
        ${selected ? q.options[selected.value] : '<em>Não respondido</em>'}
        ${isCorrect ? '✔️' : '❌'}
      </span>
      <span style="color:blue;"> (Correta: ${q.options[correctIdx]})</span>
    </div><hr>`;
  });
  resultHtml += `<h4>Pontuação: ${score} / ${quizQuestions.length}</h4>`;
  document.getElementById('quiz-result').innerHTML = resultHtml;
});