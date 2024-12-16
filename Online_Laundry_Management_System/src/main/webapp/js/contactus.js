/**
 * 
 */

const input = document.querySelectorAll(".input");

function focusFun() {
  let parent = this.parentNode;
  parent.classList.add("focus");
}

function blurFun() {
  let parent = this.parentNode;
  if(this.value == "") {
    parent.classList.remove("focus")
  }
}

input.forEach((inputs) => {
  inputs.addEventListener("focus", focusFun);
  inputs.addEventListener("blur", blurFun);
});