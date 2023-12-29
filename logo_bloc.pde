
// Variables
// ----

PGraphics lob;
PImage pngLogo;
PImage jpgLogo;

// Return jpg or png logo
// ----

void generateLogoAsset(){
  
  String extension = getFileExtension(filename);
  
  lob.beginDraw();
  lob.background(255);
  lob.imageMode(CENTER);
  jpgLogo.resize(lob.width / 2, 0);
  pngLogo.resize(lob.width / 2, 0);
  lob.translate(lob.width / 2, lob.height / 2);
  
  if(extension.equals("png")){
    lob.image(pngLogo, 0, 0);
  }else {
    lob.image(jpgLogo, 0, 0);  
  }
  
  lob.save("export/logo/format.jpg");
  lob.endDraw();
  
}
