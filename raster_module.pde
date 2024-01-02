
// Variables
// ----

PGraphics cds;
PGraphics ced1; // Circle dithering 1
PGraphics ced2; // Circle dithering 2
PGraphics ced3; // Circle dithering 3
PGraphics ced4; // Circle dithering 4

int account;
float cw;
float ch;

// Ellipse dithering
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
      createPattern(2, ced1, "ced1");
      break;
    case 1:
      createPattern(10, ced2, "ced2");
      break;
    case 2:
      createPattern(20, ced3, "ced3");
      break;
    case 3:
      createPattern(100, ced4, "ced4");
      break;
    }

    i += 1;
  }
}

void createPattern(int account, PGraphics buffer, String filename) {
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

      buffer.fill(bc < 50 ? 0 : 255);
      buffer.ellipse(cw * x + cw / 2, ch * y + ch / 2, cw, ch); // Corrected position
    }
  }

  buffer.endDraw();
  buffer.save("export/raster/" + filename + ".tif"); // Save once after drawing is complete
}
