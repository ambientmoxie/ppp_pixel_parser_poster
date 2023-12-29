// Return an array of two bright values.
// ------------------------------------
// [0] = Lighest value of the image.
// [1] = Darkest value of the image.

float computeAverageColorValue() {

  averageColorValue = 0.0;

  sampleImage.loadPixels();
  
  // step = factor to normalize the data
  
  for (int i = 0; i < sampleImage.pixels.length; i ++) {
    brightColorValue = sampleImage.brightness(sampleImage.pixels[i]);
    brightnessInventory[i] = brightColorValue;
    averageColorValue += brightColorValue;
    if(brightnessInventory[i] > 100){
       println("larger than 100"); 
    }
  }

  if (sampleImage.pixels.length > 0) { 
  averageColorValue /= sampleImage.pixels.length; // divide by factor to normalize the data
  }

  println(averageColorValue);
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
