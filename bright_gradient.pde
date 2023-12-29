// Return an array of two bright values.
// ------------------------------------
// [0] = Lighest value of the image.
// [1] = Darkest value of the image.

float averageColorValue() {

  averageColorValue = 0;

  mi.loadPixels();
  for (int i = 0; i < mi.pixels.length; i++) {
    brightColorValue = mi.brightness(mi.pixels[i]);
    brightColorValue = round(brightColorValue);
    brightnessInventory[i] = brightColorValue;
  }

  for ( int i = 0; i < brightnessInventory.length; ++i ) {
    averageColorValue += brightnessInventory[i];
  }
  
  averageColorValue /= brightnessInventory.length;

  println(brightnessInventory[98]);
  return averageColorValue;
}

// Generate the lerping brightness bar.
// ------------------------------------
// First rectangle is filled with the most darkest value of the image.
// Last rectangle is filled with the most brighest value of the image.
// Color in between are generated dynamically in order to create a gradient between the two main colors.

//void generateBrightnessGradientBar() {
//  colorByBrightValue();
//  lbright.beginDraw();
//  lbright.colorMode(HSB, 360, 100, 100);
//  lbright.noStroke();


//  float amount = 14.0;
//  color from   = lbright.color(0, 0, brightValues[1]);
//  color to     = lbright.color(0, 0, brightValues[0]);

//  float w      = lbright.width / amount;
//  float h      = lbright.height;
//  color inter;
//  float interIndex;

//  for (int i = 0; i < amount; i++) {

//    interIndex = map(i, 0, amount, 0, 1);
//    inter = lerpColor(from, to, interIndex);

//    lbright.fill(inter);
//    lbright.rect(w * i, 0, w, h);
//  }

//  lbright.save("export/gradient/bright_gradient.jpg");
//  lbright.endDraw();
//}
