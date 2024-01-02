
// Variables
// ----

PImage    seed;
PGraphics flo; // Final Ouput
String    filename = "seed.png";
float     averageColorValue;


void setup() {
  size(1000, 1000);

  // Init dictionnary and image
  // ----

  inventory = new IntDict();
  seed      = loadImage(filename);
  pngLogo   = loadImage("pnglogo.png");
  jpgLogo   = loadImage("jpglogo.png");

  // Init buffers
  // ----

  flo  = createGraphics(3268, 4721); // A3 ratio (120px margin)
  
  sdb  = createGraphics(2614, 2360);
  cds  = createGraphics(654, 590);
  ced1  = createGraphics(654, 590);
  ced2  = createGraphics(654, 590);
  ced3  = createGraphics(654, 590);
  ced4  = createGraphics(654, 590);
  rvbs = createGraphics(654, 782);
  rds  = createGraphics(654, 782);
  gns  = createGraphics(654, 782);
  bes  = createGraphics(654, 782);
  sdg  = createGraphics(1962, 1060);
  cbb  = createGraphics(1307, 782);
  lob  = createGraphics(1307, 1059);

  //Lerping brightness
  // ----

  btb = createGraphics(3060, 130);
  rdb = createGraphics(1530, 130);
  gnb = createGraphics(1530, 130);
  beb = createGraphics(1530, 130);
  gtb = createGraphics(1310, 390);

  // Init inventories and functions
  // ----

  generateMainImage();
  generateSortedColors();

  brightnessInventory = new float[sdb.pixels.length];
  greenInventory      = new float[sdb.pixels.length];
  blueInventory       = new float[sdb.pixels.length];
  redInventory        = new float[sdb.pixels.length];

  // Export all assets
  // ----

  generateBrightnessGradientBar();
  generateGreenGradientBar();
  generateBlueGradientBar();
  generateRedGradientBar();
  generateGradientLines();
  generateRasterImage();
  generateSortedGrid();
  generateLogoAsset();
  generateTwoBlocs();
  generateRVBImages();
  
  generateFinalOutput();
  

  print("done.");
}

// Return index in pixel array
// ----

int index(int x, int y, int target_width) {
  return x + y * target_width;
}

// Return file extension
// ----

String getFileExtension(String filename) {
  int lastIndexOfDot = filename.lastIndexOf('.');
  if (lastIndexOfDot > 0) {
    return filename.substring(lastIndexOfDot + 1);
  } else {
    return "";
  }
}

// Return average color (RVB and brightness);
// ----

float computeAverageColorValue(float sampleColorValue, float[] sampleColorInventory, String channel) {

  averageColorValue = 0.0;
  sdb.loadPixels();

  for (int i = 0; i < sdb.pixels.length; i ++) {

    switch(channel) {
    case "brightness":
      sampleColorValue = sdb.brightness(sdb.pixels[i]);
      break;
    case "red":
      sampleColorValue = red(sdb.pixels[i]);
      break;
    case "green":
      sampleColorValue = green(sdb.pixels[i]);
      break;
    case "blue":
      sampleColorValue = blue(sdb.pixels[i]);
      break;
    }

    sampleColorInventory[i] = sampleColorValue;
    averageColorValue += sampleColorValue;
  }

  if (sdb.pixels.length > 0) {
    averageColorValue /= sdb.pixels.length;
  }

  return averageColorValue;
}
