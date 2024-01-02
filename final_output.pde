void generateFinalOutput() {
  flo.beginDraw();
  
  flo.image(sdb, 0, 0); // Main image
  flo.image(sdg, 0, 2360); // Sorted colors
  flo.image(lob, 1962, 2360); // Logos bloc
  
  // Gradient bars 
  
  flo.image(rdb, 0, 3420); // Red gradient bar
  flo.image(gnb, 0, 3550); // Blue gradient bar
  flo.image(beb, 0, 3680); // Blue gradient bar
  flo.image(btb, 0, 3810); // Bright gradient bar
  
  flo.image(gtb, 1530, 3420); // Red gradient bar
  
  flo.image(rds, 0, 3939); // Red shader
  flo.image(gns, 654, 3939); // Green shader
  flo.image(bes, 1308, 3939); // Blue shader
  
  flo.image(cbb, 1962, 3939); // Two blocs
  
  flo.image(ced1, 2614, 0);
  flo.image(ced2, 2614, 590);
  flo.image(ced3, 2614, 590 * 2);
  flo.image(ced4, 2614, 590 * 3);
  
  // Details
  flo.noStroke();
  flo.fill(0);
  flo.rect(3060, 3419, 208, 130);
  flo.rect(3060, 3809, 208, 130);
  
  flo.save("export/final_ouput/final_ouput.png");
  
  flo.endDraw();
}
