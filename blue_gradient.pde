
// Variables
// ----

PGraphics beb;  
float[]   blueInventory;
float     blueColorValue;

// Return blue gradient
// ----
// From average blue value in the image to white

void generateBlueGradientBar() {

  computeAverageColorValue(blueColorValue, blueInventory, "blue");

  beb.beginDraw();
  beb.noStroke();

  float amount = 7.0;
  color from   = color(0, 0, averageColorValue);
  color to     = color(255, 255, 255);
  float w      = beb.width / amount;
  float h      = beb.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = beb.lerpColor(from, to, interIndex);

    if (i == 0) {
      beb.fill(from);
    } else if (i == amount - 1) {
      beb.fill(to);
    } else {
      beb.fill(inter);
    }
    beb.rect(w * i, 0, w, h);
  }

  //beb.save("export/gradient/blue-gradient-td.jpg");
  beb.endDraw();
}
