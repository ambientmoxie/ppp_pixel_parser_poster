void generateGreenGradientBar() {

  computeAverageColorValue(greenColorValue, greenInventory, "green");

  lgreen.beginDraw();
  lgreen.noStroke();

  float amount = 7.0;
  color from   = color(0, averageColorValue, 0);
  color to     = color(255, 255, 255);
  float w      = lgreen.width / amount;
  float h      = lgreen.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = lgreen.lerpColor(from, to, interIndex);

    if (i == 0) {
      lgreen.fill(from);
    } else if (i == amount - 1) {
      lgreen.fill(to);
    } else {
      lgreen.fill(inter);
    }
    lgreen.rect(w * i, 0, w, h);
  }

  lgreen.save("export/gradient/green-gradient-td.jpg");
  lgreen.endDraw();
}
