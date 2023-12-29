
// Variables
// ----

PGraphics cds;
PGraphics ced;

// Ellipse dithering
// ----

void generateRasterSeed() {
  cds.beginDraw();
  cds.colorMode(HSB,360,100,100);
  seed.resize(cds.width, 0);
  cds.image(seed, 0, (cds.height / 12) * -1);
  cds.endDraw();
}

void generateRasterImage() {
  generateRasterSeed();
  
  ced.beginDraw();
  int i = 1;

  while (i < 50) {
    ced.background(255);
    ced.noStroke();

    float account = 2 * i;
    float cedw = ced.width / account;
    float cedh = ced.height / account;

    cds.loadPixels();
    for (int x = 0; x < account; x++) {
      for (int y = 0; y < account; y++) {

        int targetPixelX = int((cedw * x) + (cedw / 2));
        int targetPixelY = int((cedh * y) + (cedh / 2));

        color c = cds.pixels[index(targetPixelX, targetPixelY, cds.width)];
        float bc = brightness(c);

        if (bc < 50) {
          ced.fill(0);
        } else {
          ced.fill(255);
        }

        ced.pushMatrix();
        ced.translate(cedw / 2, cedh / 2);
        ced.ellipse(cedw * x, cedh * y, cedw, cedh);
        ced.popMatrix();
      }
    }

    ced.save("export/raster/ced" + i + ".jpg");
    i += 1;
  }
  ced.endDraw();
}
