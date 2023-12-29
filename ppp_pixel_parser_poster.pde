int factor = 10;

// Main image
PGraphics sampleImage;
PGraphics mi;
PImage seed;

// Circles raster module
PGraphics rzs;
PGraphics rz;

// RVB module
PGraphics rvbs;
PGraphics rvb;
color     newValue;
color     colorCheck;

// For sorting colors
PGraphics sg;
IntDict   inventory;
String[]  colorKeys;

float averageColorValue;

// Bright Gradient
PGraphics lbright;
float[]   brightnessInventory;
float     brightColorValue;

// Red Gradient
PGraphics lred;
float[]   redInventory;
float     redColorValue;

// Green Gradient
PGraphics lgreen;
float[]   greenInventory;
float     greenColorValue;

// Blue Gradient
PGraphics lblue;
float[]   blueInventory;
float     blueColorValue;

//Gradient lines
PGraphics gl;

//Two blocs
PGraphics tb;

//Logo
PGraphics lg;
PImage pngLogo;
PImage jpgLogo;

String filename = "darkest.png";

void setup() {
  size(1000, 1000);

  // Init dictionnary and image
  // -----------------------------

  inventory = new IntDict();
  seed      = loadImage(filename);
  pngLogo   = loadImage("pnglogo.png");
  jpgLogo   = loadImage("jpglogo.png");

  String extension = getFileExtension(filename);
  println("The file extension is: " + extension);

  // Init buffers
  // -----------------------------
  sampleImage = createGraphics(444, 400);
  mi   = createGraphics(2614, 2360);
  rzs  = createGraphics(111 * factor, 100 * factor);
  rz   = createGraphics(654, 590);
  rvbs = createGraphics(654, 782);
  rvb  = createGraphics(654, 782);
  sg   = createGraphics(1962, 1060);
  tb   = createGraphics(1307, 782);
  lg   = createGraphics(1307, 1059);

  //Lerping brightness
  // -----------------------------
  lbright = createGraphics(306 * factor, 13 * factor);
  lred    = createGraphics(153 * factor, 13 * factor);
  lgreen  = createGraphics(153 * factor, 13 * factor);
  lblue   = createGraphics(153 * factor, 13 * factor);
  gl      = createGraphics(1310, 390);

  // Init inventories and functions
  // -----------------------------

  generateSampleImage(); // needs to be called first
  generateMainImage();

  brightnessInventory = new float[mi.pixels.length];
  redInventory        = new float[mi.pixels.length];
  greenInventory      = new float[mi.pixels.length];
  blueInventory       = new float[mi.pixels.length];

  // Export the assets

  generateRasterImage();
  generateSortedGrid();
  generateRVBImage();
  generateRedGradientBar();
  generateGreenGradientBar();
  generateBlueGradientBar();
  generateBrightnessGradientBar();
  generateGradientLines();
  generateTwoBlocs();
  generateLogoAsset();


  print("done.");
}

void generateSampleImage() {
  sampleImage.beginDraw();
  sampleImage.colorMode(HSB, 360, 100, 100);
  seed.resize(sampleImage.width, 0);
  sampleImage.image(seed, 0, (sampleImage.height / 10) * -1);
  sampleImage.endDraw();
}

int index(int x, int y, int target_width) {
  return x + y * target_width;
}

String getFileExtension(String filename) {
  int lastIndexOfDot = filename.lastIndexOf('.');
  if (lastIndexOfDot > 0) { // Check if there is a dot in the filename
    return filename.substring(lastIndexOfDot + 1); // Extract everything after the dot
  } else {
    return ""; // No extension found
  }
}
