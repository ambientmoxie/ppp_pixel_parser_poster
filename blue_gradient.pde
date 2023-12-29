void generateBlueGradientBar() {

  computeAverageColorValue(blueColorValue, blueInventory, "blue");

  lblue.beginDraw();
  lblue.noStroke();

  float amount = 7.0;
  color from   = color(0, 0, averageColorValue);
  color to     = color(255, 255, 255);
  float w      = lblue.width / amount;
  float h      = lblue.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = lblue.lerpColor(from, to, interIndex);

    if (i == 0) {
      lblue.fill(from);
    } else if (i == amount - 1) {
      lblue.fill(to);
    } else {
      lblue.fill(inter);
    }
    lblue.rect(w * i, 0, w, h);
  }

  lblue.save("export/gradient/blue-gradient-td.jpg");
  lblue.endDraw();
}
