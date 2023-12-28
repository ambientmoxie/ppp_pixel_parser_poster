
void generateAllGradientsBlue() {
  
  colorByBlueValue();
  blueToDark();
  blueToWhite();
  
}

// Return an array of two blue values.
// -----------------------------------
// [0] = Less blue value of the image.
// [1] = Most blue value of the image.

float[] colorByBlueValue() {
  blueValues = new float[2];
  mi.loadPixels();
  for (int i = 0; i < mi.pixels.length; i++) {
    blueColorValue = blue(mi.pixels[i]);
    blueInventory[i] = blueColorValue;
  }
  blueInventory = sort(blueInventory);
  blueValues[0] = blueInventory[blueInventory.length -1];
  blueValues[1] = blueInventory[0];
  return blueValues;
}

// Generate the blue brightness bar.
// ------------------------------------
// First rectangle is filled with the most blue value of the image.
// Last rectangle is filled with the least blue value of the image (or white).
// Color in between are generated dynamically in order to create a gradient between the two main colors.

void blueToDark() {
  lblue.beginDraw();
  lblue.noStroke();

  float amount = 7.0;
  color from   = color(0, 0, blueValues[0]);
  color to     = color(0, 0, blueValues[1]);
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

void blueToWhite() {
  lblue.beginDraw();
  lblue.noStroke();

  float amount = 7.0;
  color from   = color(0, 0, blueValues[0]);
  color to     = color(255);
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

  lblue.save("export/gradient/blue-gradient-tw.jpg");
  lblue.endDraw();
}
