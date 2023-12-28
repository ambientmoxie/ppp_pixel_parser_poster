
// Create an ordered color dictionary
// ----------------------------------
// Load image pixels and loop through all the pixels of the visible image.
// Get the color of each pixel and convert it into a string.

void generateSortedColors() {

  mi.loadPixels();
  
  for (int i = 0; i < mi.pixels.length; i++) {
    String sc = hex(mi.pixels[i]);
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
  
  generateSortedColors();
  
  int anchor = 0;

  sg.beginDraw();
  sg.background(255, 0, 0);
  sg.noStroke();

  float w = sg.width / 18;
  float h = sg.height / 10;

  for (int x = 0; x < 18; x++) {
    for (int y = 0; y < 10; y++) {
     
      int mapIndex = floor(map(anchor, 0, 180, 0, inventory.size()));

      sg.fill(unhex(colorKeys[mapIndex]));
      sg.rect(w * x, h * y, w, h);

      anchor++;
    }
  }
  sg.save("export/sorted_grid/sorted_grid.jpg");
  sg.endDraw();
}
