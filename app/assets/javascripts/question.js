document.addEventListener("turbolinks:load", function() {
  const ans_show_btns = document.querySelectorAll(".ans_show_btn");
  const ans_check_btns = document.querySelectorAll(".ans_check_btn");
  const release_btns = document.querySelectorAll(".release_btn");
  const category_btns = document.querySelectorAll(".cate_btn");
  const category_forms = document.getElementById("category_forms");

  ans_show_btns.forEach(btn => {
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

  ans_check_btns.forEach(btn => {
    btn.addEventListener("click", () => {
      id = btn.getAttribute("question_id");
      let after_show = document.getElementById(`after_show_${id}`);
      after_show.classList.add("display-none");
      let after_ans = document.getElementById(`after_ans_${id}`);
      after_ans.classList.remove("display-none");
    });
  });

  release_btns.forEach(btn => {
    btn.addEventListener("click", () => {
      id = btn.getAttribute("question_id");
      let question_wrap = document.getElementById(`question-wrap-${id}`);
      question_wrap.classList.add("display-none");
    });
  });

  category_btns.forEach(btn => {
    btn.addEventListener("click", () => {
      id = btn.getAttribute("category_id");
      let cate_val = document.getElementById(`cate-${id}_input`).value;
      let cate_input = `<input class="form-group__form form-category" value="${cate_val}" type="hidden" name="question[category-${id}]" id="question_category-${id}">`;
      console.log(cate_input);
      console.log(category_forms);
      category_forms.appendChild(cate_input);
    });
  });
});
