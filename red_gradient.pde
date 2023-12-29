

void generateRedGradientBar() {

  computeAverageColorValue(redColorValue, redInventory, "red");

  lred.beginDraw();
  lred.noStroke();

  float amount = 7.0;
  color from   = color(averageColorValue, 0, 0);
  color to     = color(255, 255, 255);
  float w      = lred.width / amount;
  float h      = lred.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = lred.lerpColor(from, to, interIndex);
    
    if (i == 0) {
      lred.fill(from);
    } else if (i == amount - 1) {
      lred.fill(to);
    } else {
      lred.fill(inter);
    }
    lred.rect(w * i, 0, w, h);
  }

  lred.save("export/gradient/red-gradient-td.jpg");
  lred.endDraw();
}
