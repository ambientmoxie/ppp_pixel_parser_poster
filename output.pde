void generateFinalOutput() {
  
  // Generate all assets
  generateBrightnessGradientBar();
  generateGreenGradientBar();
  generateBlueGradientBar();
  generateRedGradientBar();
  generateGradientLines();
  generateRasterImage();
  generateSortedGrid();
  generateLogoAsset();
  generateTwoBlocs();
  generateRVBImages();
  
  flo.beginDraw();
  
  // Display assets
  flo.image(sdb, 0, 0); 
  flo.image(sdg, 0, 2360); 
  flo.image(lob, 1962, 2360); 
  flo.image(rdb, 0, 3420);
  flo.image(gnb, 0, 3550); 
  flo.image(beb, 0, 3680); 
  flo.image(btb, 0, 3810); 
  flo.image(gtb, 1530, 3420); 
  flo.image(rds, 0, 3939); 
  flo.image(gns, 654, 3939); 
  flo.image(bes, 1308, 3939); 
  flo.image(cbb, 1962, 3939);
  flo.image(ced1, 2614, 0);
  flo.image(ced2, 2614, 590);
  flo.image(ced3, 2614, 590 * 2);
  flo.image(ced4, 2614, 590 * 3);

  // Details
  flo.noStroke();
  flo.fill(0);
  flo.rect(3060, 3419, 208, 130);
  flo.rect(3060, 3809, 208, 130);

  flo.endDraw();
  
  flo.save("export/final_ouput.png");
}
