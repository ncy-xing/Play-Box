VanishingPoint vp;
float bx;
float by;
int boxSize;
boolean overBox = false;
boolean locked = false;

float xOffset = 0.0;
float yOffset = 0.0;
  
void setup() {
  size(1000, 700, P3D);
  rectMode(CENTER);
  vp = new VanishingPoint(this, width/2, height/2);
  boxSize = 10;
}

void draw() {
  background(0, 0, 0);
  
  // Display vanishing point
  vp.checkCursorOverBox(mouseX, mouseY);
  vp.display();
  //print(mouseX + ", " + mouseY);
}

void mousePressed() {
  boolean vpSelected = false;
  if (vp.checkCursorOverBox(mouseX, mouseY)) {
    vpSelected = true; 
  } 
  vp.setSelected(vpSelected);
  
  xOffset = mouseX-bx;
  yOffset = mouseY-by;
}

void mouseDragged() {
  if (vp.isSelected()) {
    //bx = mouseX-xOffset; 
    //by = mouseY-yOffset; 
    //vp.move(bx, by);
    vp.move(min(width, mouseX), min(height, mouseY));
  }
}

void mouseReleased() {
  vp.setSelected(false);
}
