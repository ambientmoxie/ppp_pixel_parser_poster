
PImage    seed;
PGraphics flo; // Final Ouput
String    filename = "araki_3.jpg";
float     averageColorValue;


void setup() {
  size(100, 100);

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
  
  generateFinalOutput();
  

  print("done.");
  background(0,255,0);
}
