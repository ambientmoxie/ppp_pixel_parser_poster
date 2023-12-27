// Global variables
PImage seed;
int factor = 1;

// Main image buffer
PGraphics mi;

// Raster modules related variables
PGraphics rzs;
PGraphics rz;

// RVB modules related variables
PGraphics rvbs;
PGraphics rvb;
color newValue;
color colorCheck;

// Int Dict & Int Grid
IntDict inventory;
PGraphics sg;
String[] colorKeys;

// Lerping brightness
PGraphics lb;



void setup() {
  size(1000, 1000);
  seed = loadImage("seed.png");
  pixelDensity(displayDensity());

  // Init dictionnary
  inventory = new IntDict();

  // Init main image buffer
  mi = createGraphics(333 * factor, 400 * factor);

  // Init raster buffer and it's seed
  rzs = createGraphics(111 * factor, 100 * factor);
  rz = createGraphics(111 * factor, 100 * factor);

  // Init rvb buffer and it's seed
  rvbs = createGraphics(111 * factor, 137 * factor);
  rvb = createGraphics(111 * factor, 137 * factor);

  sg = createGraphics(333 * factor, 180 * factor);

  //Lerping brightness
  lb = createGraphics(520 * factor, 20 * factor);

  // Init functions

  //generateMainImage();
  //generateRasterSeed();
  //generateRasterImage();
  //generateRVBSeed();
  //generateRVBImage();

  //generateSortedGrid();
  generateBrightnessLerpingBar();
  image(lb,0,0);
}

// ---------- //
// Main Image //
// ---------- //

void generateMainImage() {
  mi.beginDraw();
  seed.resize(mi.width, 0);
  mi.image(seed, 0, 0);
  mi.save("export/main_image/mi.png");
  mi.endDraw();
}

// Draw the image seed for rasterized modules.
// It's convenient to draw another image source because of rendering proportions.

void generateRasterSeed() {
  rzs.beginDraw();
  seed.resize(rzs.width / 2, 0);
  rzs.image(seed, 0, (rzs.height / 12) * -1);
  rzs.endDraw();
}

// ------------- //
// Raster Module //
// ------------- //

void generateRasterImage() {
  rz.beginDraw();

  int i = 1;

  while (i < 50) {
    rz.background(255);
    rz.noStroke();

    float account = 2 * i;
    println(account);
    float rzw = rz.width / account;
    float rzh = rz.height / account;

    rzs.loadPixels();
    for (int x = 0; x < account; x++) {
      for (int y = 0; y < account; y++) {

        int targetPixelX = int((rzw * x) + (rzw / 2));
        int targetPixelY = int((rzh * y) + (rzh / 2));

        color c = rzs.pixels[index(targetPixelX, targetPixelY, rzs.width * 2)];
        float bc = brightness(c);

        if (bc < 110) {
          rz.fill(0);
        } else {
          rz.fill(255);
        }

        rz.pushMatrix();
        rz.translate(rzw / 2, rzh / 2);
        rz.ellipse(rzw * x, rzh * y, rzw, rzh);
        rz.popMatrix();
      }
    }

    rz.save("export/raster/rz" + i + ".jpg");
    i += 1;
  }
  rz.endDraw();
}

// ---------- //
// RVB Module //
// ---------- //

void generateRVBSeed() {
  rvbs.beginDraw();
  seed.resize(rvb.width, 0);
  rvbs.image(seed, 0, (rvbs.height / 12) * -1);
  rvbs.endDraw();
}

void generateRVBImage() {
  rvb.beginDraw();
  rvbs.loadPixels();
  rvb.loadPixels();

  int p = 0;

  while (p < 3) {
    for (int i = 0; i < rvbs.pixels.length; i++) {

      switch(p) {
      case 0:
        newValue = color(255, 0, 0);
        colorCheck = int(red(rvbs.pixels[i]));
        break;
      case 1:
        newValue = color(0, 255, 0);
        colorCheck = int(green(rvbs.pixels[i]));
        break;
      case 2:
        newValue = color(0, 0, 255);
        colorCheck = int(blue(rvbs.pixels[i]));
        break;
      }

      if (colorCheck > 30) {
        rvb.pixels[i] = newValue;
      } else {
        rvb.pixels[i] = color(255);
      }
    }
    rvb.updatePixels();
    rvb.save("export/rvb/rvb" + p + ".jpg");
    p++;
  }

  rvb.endDraw();
}

// ------------- //
// Sorted Colors //
// ------------- //

void generateSortedColors() {

  // Load image pixels and loop through all the pixels of the visible image.

  mi.loadPixels();
  for (int i = 0; i < mi.pixels.length; i++) {

    // Get the color of the pixel and convert it into string
    String sc = hex(mi.pixels[i]);

    // Check if the color is already present in the dict.
    // Increment the value if it's the case, add it to the dict. if it's not
    if (inventory.hasKey(sc) == true || i != 0) {
      inventory.increment(sc);
    } else {
      inventory.set(sc, 1);
    }
  }

  inventory.sortValuesReverse();
  colorKeys = inventory.keyArray();
}

// ------------------ //
// Sorted Colors Grid //
// ------------------ //

void generateSortedGrid() {
  int borderBox = 1 * factor;
  int anchor = 0;

  generateSortedColors();

  sg.beginDraw();
  sg.background(255, 0, 0);

  float w = sg.width / 18;
  float h = sg.height / 10;

  for (int x = 0; x < 18; x++) {
    for (int y = 0; y < 10; y++) {

      // Index is remap in order to have an interested range of color displayed
      int mapIndex = floor(map(anchor, 0, 180, 0, inventory.size()));

      sg.strokeWeight(borderBox);
      sg.stroke(0);
      sg.fill(unhex(colorKeys[mapIndex]));
      sg.rect(w * x, h * y, w, h);

      anchor++;
    }
  }
  sg.save("export/sorted_grid/sorted_grid.jpg");
  sg.endDraw();
}

void generateBrightnessLerpingBar() {
  lb.beginDraw();
 
  int amount = 14;
  float w = lb.width / amount;

  for (int i = 0; i < amount; i++) {
    lb.stroke(255,0,0);
    lb.rect(w * i, 0, w, lb.height);
  }

  lb.endDraw();
}

int index(int x, int y, int target_width) {
  return x + y * target_width;
}
