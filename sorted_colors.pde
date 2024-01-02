
// Variables
// ----

PGraphics sdg; // Sorted grid
IntDict   inventory; 
String[]  colorKeys;

// Store colors into a dictionnary and sort the values from lowest to highest.
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
  sdg.background(255, 0, 0);
  sdg.noStroke();

  float w = sdg.width / 18;
  float h = sdg.height / 10;

  for (int x = 0; x < 18; x++) {
    for (int y = 0; y < 10; y++) {
     
      int mapIndex = floor(map(anchor, 0, 180, 0, inventory.size()));

      sdg.fill(unhex(colorKeys[mapIndex]));
      sdg.rect(w * x, h * y, w, h);

      anchor++;
    }
  }
  //sdg.save("export/sorted_grid/sorted_grid.jpg");
  sdg.endDraw();
}
