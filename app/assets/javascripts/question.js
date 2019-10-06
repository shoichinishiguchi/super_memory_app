window.onload = function() {
  const btns = document.querySelectorAll(".ans_show_btn");
  console.log(btns);
  btns.forEach(btn => {
    btn.addEventListener("click", () => {
      id = btn.getAttribute("question_id");
      let answer = document.getElementById(`question_ans_${id}`);
      answer.classList.remove("opacity-zero");
      let before_show = document.getElementById(`before_show_${id}`);
      before_show.classList.add("display-none");
      let after_show = document.getElementById(`after_show_${id}`);
      after_show.classList.remove("display-none");
    });
  });
};
