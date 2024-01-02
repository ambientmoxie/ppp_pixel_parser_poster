
/*
TODO : Refactor RVB module
 */

// 01 = Main image
PGraphics sdb;

// 02 = Ellipse seed, shaders and variables
PGraphics cds;
PGraphics ced1;
PGraphics ced2;
PGraphics ced3;
PGraphics ced4;

int account;
float cw;
float ch;

// 03 = Sorted grid and variables

PGraphics sdg; // Sorted grid
IntDict   inventory;
String[]  colorKeys;

// 04 = Logo format

PGraphics lob;
PImage pngLogo;
PImage jpgLogo;

// 05 = Red gradient

PGraphics rdb;
float[]   redInventory;
float     redColorValue;

// 06 = Green gradient

PGraphics gnb;
float[]   greenInventory;
float     greenColorValue;

// 07 = Blue gradient

PGraphics beb;
float[]   blueInventory;
float     blueColorValue;

// 08 = Gradient lines

PGraphics gtb;

// 09 = Brightness gradient

PGraphics btb;
float[]   brightnessInventory;
float     brightColorValue;

// 10 = RVB shader

PGraphics rvbs;
PGraphics rds; // red shader
PGraphics gns; // green shader
PGraphics bes; // green shader
color newValue;
color colorCheck;

// 11 = Two blocs

PGraphics cbb;

// ----
// 01 - Main image
// ----

void generateMainImage() {
  sdb.beginDraw();
  seed.resize(sdb.width, 0);
  sdb.image(seed, 0, (sdb.height / 10) * -1);
  sdb.endDraw();
}

// ----
// 02 - Ellipse shader
// ----

void generateRasterSeed() {
  cds.beginDraw();
  cds.colorMode(HSB, 360, 100, 100);
  seed.resize(cds.width, 0);
  cds.image(seed, 0, (cds.height / 12) * -1);
  cds.endDraw();
}

void generateRasterImage() {
  generateRasterSeed();

  int i = 0;

  while (i < 4) {

    cds.loadPixels();

    switch(i) {
    case 0:
      createPattern(2, ced1);
      ced1.save("export/shader/shader1.tif");
      break;
    case 1:
      createPattern(4, ced2);
      ced2.save("export/shader/shader2.tif");
      break;
    case 2:
      createPattern(20, ced3);
      ced3.save("export/shader/shader3.tif");
      break;
    case 3:
      createPattern(100, ced4);
      ced4.save("export/shader/shader4.tif");
      break;
    }
    i += 1;
  }
}

void createPattern(int account, PGraphics buffer) {
  buffer.beginDraw();
  buffer.noStroke();
  cw = buffer.width / float(account);
  ch = buffer.height / float(account);

  for (int x = 0; x < account; x++) {
    for (int y = 0; y < account; y++) {
      int targetPixelX = int((cw * x) + (cw / 2));
      int targetPixelY = int((ch * y) + (ch / 2));

      color c = cds.pixels[index(targetPixelX, targetPixelY, cds.width)];
      float bc = brightness(c);

      buffer.fill(bc < 180 ? 0 : 255);
      buffer.ellipse(cw * x + cw / 2, ch * y + ch / 2, cw, ch);
    }
  }

  buffer.endDraw();
}

// ----
// 03 - Sorted grid
// ----

void generateSortedColors() {

  sdb.loadPixels();

  for (int i = 0; i < sdb.pixels.length; i++) {
    String sc = hex(sdb.pixels[i]);
    if (inventory.hasKey(sc) == true || i != 0) {
      inventory.increment(sc);
    } else {
      inventory.set(sc, 1);
    }
  }

  inventory.sortValuesReverse();
  colorKeys = inventory.keyArray();
}

void generateSortedGrid() {

  int anchor = 0;

  sdg.beginDraw();
  sdg.noStroke();

  float w = sdg.width / 18;
  float h = sdg.height / 10;

  for (int y = 0; y < 10; y++) {
    for (int x = 0; x < 18; x++) {

      int mapIndex = floor(map(anchor, 0, 180, 0, inventory.size()));

      sdg.fill(unhex(colorKeys[mapIndex]));
      sdg.rect(w * x, h * y, w, h);

      anchor++;
    }
  }

  sdg.endDraw();
}

// ----
// 04 - Logo format
// ----

void generateLogoAsset() {

  String extension = getFileExtension(filename);

  lob.beginDraw();
  lob.background(255);
  lob.imageMode(CENTER);
  jpgLogo.resize(lob.width / 2, 0);
  pngLogo.resize(lob.width / 2, 0);
  lob.translate(lob.width / 2, lob.height / 2);

  if (extension.equals("png")) {
    lob.image(pngLogo, 0, 0);
  } else {
    lob.image(jpgLogo, 0, 0);
  }

  lob.endDraw();
}

// ----
// 05 - Red gradient
// ----

void generateRedGradientBar() {

  computeAverageColorValue(redColorValue, redInventory, "red");

  rdb.beginDraw();
  rdb.noStroke();

  float amount = 7.0;
  color from   = color(averageColorValue, 0, 0);
  color to     = color(255, 255, 255);
  float w      = rdb.width / amount;
  float h      = rdb.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = rdb.lerpColor(from, to, interIndex);

    if (i == 0) {
      rdb.fill(from);
    } else if (i == amount - 1) {
      rdb.fill(to);
    } else {
      rdb.fill(inter);
    }
    rdb.rect(w * i, 0, w, h);
  }

  rdb.endDraw();
}

// ----
// 06 - Green gradient
// ----

void generateGreenGradientBar() {

  computeAverageColorValue(greenColorValue, greenInventory, "green");

  gnb.beginDraw();
  gnb.noStroke();

  float amount = 7.0;
  color from   = color(0, averageColorValue, 0);
  color to     = color(255, 255, 255);
  float w      = gnb.width / amount;
  float h      = gnb.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = gnb.lerpColor(from, to, interIndex);

    if (i == 0) {
      gnb.fill(from);
    } else if (i == amount - 1) {
      gnb.fill(to);
    } else {
      gnb.fill(inter);
    }
    gnb.rect(w * i, 0, w, h);
  }
  gnb.endDraw();
}

// ----
// 07 - Blue gradient
// ----

void generateBlueGradientBar() {

  computeAverageColorValue(blueColorValue, blueInventory, "blue");

  beb.beginDraw();
  beb.noStroke();

  float amount = 7.0;
  color from   = color(0, 0, averageColorValue);
  color to     = color(255, 255, 255);
  float w      = beb.width / amount;
  float h      = beb.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = beb.lerpColor(from, to, interIndex);

    if (i == 0) {
      beb.fill(from);
    } else if (i == amount - 1) {
      beb.fill(to);
    } else {
      beb.fill(inter);
    }
    beb.rect(w * i, 0, w, h);
  }

  beb.endDraw();
}

// ----
// 08 - Gradient lines
// ----

void generateGradientLines() {

  color from = color(unhex(colorKeys[0]));
  color to   = color(unhex(colorKeys[181055])); // Recorded color here
  color inter;
  float interIndex;

  gtb.beginDraw();

  for (int i = 0; i < gtb.width; i++) {

    interIndex = map(i, 0, gtb.width, 0, 1);
    inter = gtb.lerpColor(from, to, interIndex);

    gtb.stroke(inter);
    gtb.line(i, 0, i, gtb.height);
  }
  gtb.endDraw();
}

// ----
// 09 - Brighntess gradient
// ----

void generateBrightnessGradientBar() {

  computeAverageColorValue(brightColorValue, brightnessInventory, "brightness");

  btb.beginDraw();
  btb.colorMode(HSB, 360, 100, 100);
  btb.noStroke();


  float amount = 14.0;
  color from   = btb.color(0, 0, averageColorValue - 80);
  color to     = btb.color(0, 0, 100);

  float w      = btb.width / amount;
  float h      = btb.height;
  color inter;
  float interIndex;

  for (int i = 0; i < amount; i++) {

    interIndex = map(i, 0, amount, 0, 1);
    inter = lerpColor(from, to, interIndex);

    if (i == 0) {
      btb.fill(from);
    } else if (i == amount - 1) {
      btb.fill(to);
    } else {
      btb.fill(inter);
    }
    btb.rect(w * i, 0, w, h);
  }

  btb.endDraw();
}

// ----
// 10 - RVB Shader
// ----

void generateRVBseed() {
  rvbs.beginDraw();
  seed.resize(rvbs.width, 0);
  rvbs.image(seed, 0, (rvbs.height / 12) * -1);
  rvbs.endDraw();
}

void generateRVBImages() {
  generateRVBseed();
  rvbs.loadPixels();

  rds.beginDraw();
  gns.beginDraw();
  bes.beginDraw();
  rds.loadPixels();
  gns.loadPixels();
  bes.loadPixels();

  for (int i = 0; i < rvbs.pixels.length; i++) {
    createPattern(rds, i, color(255, 0, 0), int(red(rvbs.pixels[i])));
    createPattern(gns, i, color(0, 255, 0), int(green(rvbs.pixels[i])));
    createPattern(bes, i, color(0, 0, 255), int(blue(rvbs.pixels[i])));
  }

  rds.updatePixels();
  gns.updatePixels();
  bes.updatePixels();
  rds.endDraw();
  gns.endDraw();
  bes.endDraw();
}

void createPattern(PGraphics buffer, int i, color newValue, int colorIntensity) {
  buffer.pixels[i] = colorIntensity > 30 ? newValue : color(255);
}

// ----
// 11 - Two blocs
// ----

void generateTwoBlocs() {

  int randomFinalColor = round(random(0, inventory.size() - 1));

  cbb.beginDraw();
  cbb.noStroke();

  cbb.fill(unhex(colorKeys[0]));
  cbb.rect(0, 0, cbb.width / 2, cbb.height);
  cbb.fill(unhex(colorKeys[181055])); // Use recorded index
  cbb.rect(cbb.width / 2, 0, cbb.width / 2, cbb.height);

  println("Recorded color index " + randomFinalColor);

  cbb.endDraw();
}
