// Return avergae bright value
// ---------------------------


float computeAverageColorValue(float sampleColorValue, float[] sampleColorInventory, String channel) {

  averageColorValue = 0.0;
  sampleImage.loadPixels();

  for (int i = 0; i < sampleImage.pixels.length; i ++) {

    switch(channel) {
    case "brightness":
      sampleColorValue = sampleImage.brightness(sampleImage.pixels[i]);
      break;
    case "red":
      sampleColorValue = red(sampleImage.pixels[i]);
      break;
    case "green":
      sampleColorValue = green(sampleImage.pixels[i]);
      break;
    case "blue":
      sampleColorValue = blue(sampleImage.pixels[i]);
      break;
    }

    sampleColorInventory[i] = sampleColorValue;
    averageColorValue += sampleColorValue;
  }

  if (sampleImage.pixels.length > 0) {
    averageColorValue /= sampleImage.pixels.length;
  }

  println(averageColorValue);
  return averageColorValue;
}

// Generate the lerping brightness bar.
// ------------------------------------

void generateBrightnessGradientBar() {

  computeAverageColorValue(brightColorValue, brightnessInventory, "brightness");
  
  println("radius value of the rect in degres is: " + floor(map(averageColorValue, 0, 100, 0, 288)));

  lbright.beginDraw();
  lbright.colorMode(HSB, 360, 100, 100);
  lbright.noStroke();


  float amount = 14.0;
  color from   = lbright.color(0, 0, averageColorValue);
  color to     = lbright.color(0, 0, 100);

  float w      = lbright.width / amount;
  float h      = lbright.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = lerpColor(from, to, interIndex);

    if (i == 0) {
      lbright.fill(from);
    } else if (i == amount - 1) {
      lbright.fill(to);
    } else {
      lbright.fill(inter);
    }
    lbright.rect(w * i, 0, w, h);
  }

  lbright.save("export/gradient/bright_gradient.jpg");
  lbright.endDraw();
}
