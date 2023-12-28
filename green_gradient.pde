
void generateAllGradientsGreen(){
  
  colorByGreenValue();
  greenToDark();
  greenToWhite();
  
}

// Return an array of two green values.
// ------------------------------------
// [0] = Less green value of the image.
// [1] = Most green value of the image.

float[] colorByGreenValue() {
  greenValues = new float[2];
  mi.loadPixels();
  for (int i = 0; i < mi.pixels.length; i++) {
    greenColorValue = green(mi.pixels[i]);
    greenInventory[i] = greenColorValue;
  }
  greenInventory = sort(greenInventory);
  greenValues[0] = greenInventory[greenInventory.length -1];
  greenValues[1] = greenInventory[0];
  return greenValues;
}

// Generate the green brightness bar.
// ------------------------------------
// First rectangle is filled with the most green value of the image.
// Last rectangle is filled with the least green value of the image (or white).
// Color in between are generated dynamically in order to create a gradient between the two main colors.

void greenToDark() {
  lgreen.beginDraw();
  lgreen.noStroke();
  
  float amount = 7.0;
  color from   = color(0, greenValues[0], 0);
  color to     = color(0, greenValues[1], 0);
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

void greenToWhite() {
  lgreen.beginDraw();
  lgreen.noStroke();
  
  float amount = 7.0;
  color from   = color(0, greenValues[0], 0);
  color to     = color(255);
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
  
  lgreen.save("export/gradient/green-gradient-tw.jpg");
  lgreen.endDraw();
  
}
