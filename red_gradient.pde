
void generateAllGradientsRed(){
  
  colorByRedValue();
  redToDark();
  redToWhite();
  
}

// Return an array of two red values.
// ------------------------------------
// [0] = Less red value of the image.
// [1] = Most red value of the image.

float[] colorByRedValue() {
  redValues = new float[2];
  mi.loadPixels();
  for (int i = 0; i < mi.pixels.length; i++) {
    redColorValue = red(mi.pixels[i]);
    redInventory[i] = redColorValue;
  }
  redInventory = sort(redInventory);
  redValues[0] = redInventory[redInventory.length -1];
  redValues[1] = redInventory[0];
  println(redValues);
  return redValues;
}

// Generate the red brightness bar.
// ------------------------------------
// First rectangle is filled with the most red value of the image.
// Last rectangle is filled with the least red value of the image (or white).
// Color in between are generated dynamically in order to create a gradient between the two main colors.

void redToDark() {
  lred.beginDraw();
  lred.noStroke();
  
  float amount = 7.0;
  color from   = color(redValues[0], 0, 0);
  color to     = color(redValues[1], 0, 0);
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

void redToWhite() {
  lred.beginDraw();
  lred.noStroke();
  
  float amount = 7.0;
  color from   = color(redValues[0], 0, 0);
  color to     = color(255);
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
  
  lred.save("export/gradient/red-gradient-tw.jpg");
  lred.endDraw();
}
