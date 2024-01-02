
// Variables
// ----

PGraphics gnb;  
float[]   greenInventory;
float     greenColorValue;

// Return green gradient
// ----
// From average green value in the image to white

void generateGreenGradientBar() {

  computeAverageColorValue(greenColorValue, greenInventory, "green");

  gnb.beginDraw();
  gnb.noStroke();

  float amount = 7.0;
  color from   = color(0, averageColorValue, 0);
  color to     = color(255, 255, 255);
  float w      = gnb.width / amount;
  float h      = gnb.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = gnb.lerpColor(from, to, interIndex);

    if (i == 0) {
      gnb.fill(from);
    } else if (i == amount - 1) {
      gnb.fill(to);
    } else {
      gnb.fill(inter);
    }
    gnb.rect(w * i, 0, w, h);
  }
  gnb.endDraw();
}
