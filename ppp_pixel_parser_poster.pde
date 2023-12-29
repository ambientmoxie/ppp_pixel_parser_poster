int factor = 1;

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
//float     brightValues;
float     brightColorValue;

// Red Gradient
PGraphics lred;
float[]   redInventory;
float[]   redValues;
float     redColorValue;

// Green Gradient
PGraphics lgreen;
float[]   greenInventory;
float[]   greenValues;
float     greenColorValue;

// Blue Gradient
PGraphics lblue;
float[]   blueInventory;
float[]   blueValues;
float     blueColorValue;


void setup() {
  size(100, 100);

    // Init dictionnary and image
    // -----------------------------

  inventory = new IntDict();
  seed      = loadImage("dark.png");

  // Init buffers
  // -----------------------------
  sampleImage = createGraphics(444, 400);
  mi   = createGraphics(444 * factor, 400 * factor);
  rzs  = createGraphics(111 * factor, 100 * factor);
  rz   = createGraphics(111 * factor, 100 * factor);
  rvbs = createGraphics(111 * factor, 137 * factor);
  rvb  = createGraphics(111 * factor, 137 * factor);
  sg   = createGraphics(333 * factor, 180 * factor);

  //Lerping brightness
  // -----------------------------
  lbright = createGraphics(520 * factor, 20 * factor);
  lred    = createGraphics(260 * factor, 20 * factor);
  lgreen  = createGraphics(260 * factor, 20 * factor);
  lblue   = createGraphics(260 * factor, 20 * factor);

  // Init inventories and functions
  // -----------------------------

  generateSampleImage(); // needs to be called first
  generateMainImage(); // needs to be called first

  brightnessInventory = new float[mi.pixels.length];
  redInventory        = new float[mi.pixels.length];
  greenInventory      = new float[mi.pixels.length];
  blueInventory       = new float[mi.pixels.length];

  //generateRasterImage();
  //generateSortedGrid();
  //generateRVBImage();
  computeAverageColorValue();
  //generateAllGradientsRed();
  //generateAllGradientsGreen();
  //generateAllGradientsBlue();
  //generateBrightnessGradientBar();

  print("done.");
}

void generateSampleImage(){
  sampleImage.beginDraw();
  sampleImage.colorMode(HSB,360,100,100);
  seed.resize(sampleImage.width, 0);
  sampleImage.image(seed, 0, (sampleImage.height / 10) * -1);
  sampleImage.endDraw();
}

int index(int x, int y, int target_width) {
  return x + y * target_width;
}
