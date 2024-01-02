
// Variables
// ----

PGraphics btb;  
float[]   brightnessInventory;
float     brightColorValue;

// Return brightness gradient
// ----
// From average brightness value in the image to white

void generateBrightnessGradientBar() {

  computeAverageColorValue(brightColorValue, brightnessInventory, "brightness");
  
  println("radius value of the rect in degres is: " + floor(map(averageColorValue, 0, 100, 0, 288)));

  btb.beginDraw();
  btb.colorMode(HSB, 360, 100, 100);
  btb.noStroke();


  float amount = 14.0;
  color from   = btb.color(0, 0, averageColorValue);
  color to     = btb.color(0, 0, 100);

  float w      = btb.width / amount;
  float h      = btb.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = lerpColor(from, to, interIndex);

    if (i == 0) {
      btb.fill(from);
    } else if (i == amount - 1) {
      btb.fill(to);
    } else {
      btb.fill(inter);
    }
    btb.rect(w * i, 0, w, h);
  }
 
  btb.endDraw();
}
