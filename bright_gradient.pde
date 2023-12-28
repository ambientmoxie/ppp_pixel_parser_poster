// Return an array of two bright values.
// ------------------------------------
// [0] = Lighest value of the image.
// [1] = Darkest value of the image.

float[] colorByBrightValue() {
  brightValues = new float[2];
  mi.loadPixels();
  for (int i = 0; i < mi.pixels.length; i++) {
    brightColorValue = brightness(mi.pixels[i]);
    brightnessInventory[i] = brightColorValue;
  }
  brightnessInventory = sort(brightnessInventory);
  brightValues[0] = brightnessInventory[brightnessInventory.length -1];
  brightValues[1] = brightnessInventory[0];
  return brightValues;
}

// Generate the lerping brightness bar.
// ------------------------------------
// First rectangle is filled with the most darkest value of the image.
// Last rectangle is filled with the most brighest value of the image.
// Color in between are generated dynamically in order to create a gradient between the two main colors.

void generateBrightnessGradientBar() {
  colorByBrightValue();
  lbright.beginDraw();
  lbright.noStroke();
  
  float amount = 14.0;
  color from   = int(brightValues[1]);
  color to     = int(brightValues[0]);
  float w      = lbright.width / amount;
  float h      = lbright.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = lbright.lerpColor(from, to, interIndex);

    if (i == 0) {
      lbright.fill(from);
    } else if (i == 14) {
      lbright.fill(to);
    } else {
      lbright.fill(inter);
    }

    lbright.rect(w * i, 0, w, h);
  }
  
  lbright.save("export/gradient/bright_gradient.jpg");
  lbright.endDraw();
}
