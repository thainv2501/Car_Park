/**
 * 
 */
 
 const starNumber = 450;
const stars = document.getElementsByClassName("stars")[0];
for (let index = 0; index < starNumber; index++) {
  let spanNode = document.createElement("span");
  let rng1 = Math.floor(Math.random() * 255);
  let rng2 = Math.floor(Math.random() * 255);
  let rng3 = Math.floor(Math.random() * 255);
  spanNode.style.background = `rgb(${rng1},${rng2},${rng3})`;
  let delay = Math.random() * 5;
  spanNode.style.animationDelay = delay + "s";
  stars.appendChild(spanNode).classList.add("star");
}
