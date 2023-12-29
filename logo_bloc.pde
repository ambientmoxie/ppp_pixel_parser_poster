void generateLogoAsset(){
  
  lg.beginDraw();
  lg.background(255);
  lg.imageMode(CENTER);
  jpgLogo.resize(lg.width / 2, 0);
  pngLogo.resize(lg.width / 2, 0);
  lg.translate(lg.width / 2, lg.height / 2);
  
  println(getFileExtension(filename) == "png");
  
  if(getFileExtension(filename).equals("png")){
    lg.image(pngLogo, 0, 0);
  }else {
    lg.image(jpgLogo, 0, 0);  
  }
  
  lg.save("export/logo/format.jpg");
  lg.endDraw();
  
}
