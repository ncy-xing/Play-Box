VanishingPoint vp;
VanishingLines vlines;
PGraphics pg;
Center center;
float bx;
float by;
int boxSize;
boolean overBox = false;
boolean locked = false;
boolean toggle = false;

float xOffset = 0.0;
float yOffset = 0.0;

void setup() {
  size(1000, 700, P3D);
  rectMode(CENTER);
  vp = new VanishingPoint(this, width/2, height/2);
  vlines = new VanishingLines(this, vp);
  center = new Center(this, vp);
  boxSize = 10;
}

void draw() {
  lights();
  background(0, 0, 0);

  vp.checkCursorOverBox(mouseX, mouseY);
  vlines.display();

  translate(vp.getX(), vp.getY(), 0);
  center.display();
  translate(-vp.getX(), -vp.getY(), 0);
  
  center.move();
}

void mousePressed() {
  boolean vpSelected = false;
  if (vp.checkCursorOverBox(mouseX, mouseY)) {
    vpSelected = true;
  }
  vp.setSelected(vpSelected);
}

void mouseDragged() {
  if (vp.isSelected()) {
    vp.move(min(width, mouseX), min(height, mouseY));
  }

  xOffset = mouseX-bx;
  yOffset = mouseY-by;
}

void mouseReleased() {
  vp.setSelected(false);
}
