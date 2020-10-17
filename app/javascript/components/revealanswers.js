const revealAnswers = () => {
  const revealBtn = document.getElementById("reveal-answers");
  const goodAnswers = document.querySelectorAll(".good-answer");
  if (revealBtn && goodAnswers) {
    revealBtn.addEventListener('click', (event) => {
      goodAnswers.forEach((answer) => {
        console.log(answer);
        answer.classList.toggle('revealed');
      });
    });
  };
};

export { revealAnswers };
