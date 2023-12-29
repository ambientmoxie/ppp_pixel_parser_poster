
// Variables
// ----

PGraphics rdb;  
float[]   redInventory;
float     redColorValue;

// Return red gradient
// ----
// From average red value in the image to white

void generateRedGradientBar() {

  computeAverageColorValue(redColorValue, redInventory, "red");

  rdb.beginDraw();
  rdb.noStroke();

  float amount = 7.0;
  color from   = color(averageColorValue, 0, 0);
  color to     = color(255, 255, 255);
  float w      = rdb.width / amount;
  float h      = rdb.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = rdb.lerpColor(from, to, interIndex);
    
    if (i == 0) {
      rdb.fill(from);
    } else if (i == amount - 1) {
      rdb.fill(to);
    } else {
      rdb.fill(inter);
    }
    rdb.rect(w * i, 0, w, h);
  }

  rdb.save("export/gradient/red-gradient-td.jpg");
  rdb.endDraw();
}
