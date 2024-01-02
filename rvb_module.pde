
// Variables
// ----

PGraphics rvbs;
PGraphics rds; // red shader
PGraphics gns; // green shader
PGraphics bes; // green shader
color newValue;
color colorCheck;

void generateRVBseed() {
  rvbs.beginDraw();
  seed.resize(rvbs.width, 0);
  rvbs.image(seed, 0, (rvbs.height / 12) * -1);
  rvbs.endDraw();
}

void generateRVBImages() {
  generateRVBseed();

  rds.beginDraw();
  gns.beginDraw();
  bes.beginDraw();
  
  // Load pixels of the seed impage and buffers

  rvbs.loadPixels();
  rds.loadPixels();
  gns.loadPixels();
  bes.loadPixels();

  int p = 0;

  while (p < 3) {
    for (int i = 0; i < rvbs.pixels.length; i++) {
      
      // Generate the red, green and blue version of the seed

      switch(p) {
      case 0:
        newValue = color(255, 0, 0);
        colorCheck = int(red(rvbs.pixels[i]));
        if (colorCheck > 30) {
          rds.pixels[i] = newValue;
        } else {
          rds.pixels[i] = color(255);
        }
        break;
      case 1:
        newValue = color(0, 255, 0);
        colorCheck = int(green(rvbs.pixels[i]));
        if (colorCheck > 30) {
          gns.pixels[i] = newValue;
        } else {
          gns.pixels[i] = color(255);
        }
        break;
      case 2:
        newValue = color(0, 0, 255);
        colorCheck = int(blue(rvbs.pixels[i]));
        if (colorCheck > 30) {
          bes.pixels[i] = newValue;
        } else {
          bes.pixels[i] = color(255);
        }
        break;
      }
    }
    
    // Update pixels of buffers
    rds.updatePixels();
    gns.updatePixels();
    bes.updatePixels();
    rds.save("export/rvb/rds.jpg");
    gns.save("export/rvb/gns.jpg");
    bes.save("export/rvb/bes.jpg");
    p++;
  }

  rds.endDraw();
  gns.endDraw();
  bes.endDraw();
}
