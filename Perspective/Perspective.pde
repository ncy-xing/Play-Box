VanishingPoint vp;
VanishingLines vlines;
PGraphics pg;

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
  pg = pg = createGraphics(1000, 40);
  vp = new VanishingPoint(this, width/2, height/2);
  vlines = new VanishingLines(this, vp);
  boxSize = 10;
}

void draw() {
  lights();
  background(0, 0, 0);

  // Change height of the camera with mouseY
  camera(30.0, mouseY, 220.0, // eyeX, eyeY, eyeZ
    0.0, 0.0, 0.0, // centerX, centerY, centerZ
    0.0, 1.0, 0.0); // upX, upY, upZ
  noStroke();
  box(90);
  stroke(255);
  line(-100, 0, 0, 100, 0, 0);
  line(0, -100, 0, 0, 100, 0);
  line(0, 0, -100, 0, 0, 100);
  translate(mouseX, mouseY, 0);

  // Display vanishing point
  //vp.checkCursorOverBox(mouseX, mouseY);
  //vp.display();
  //vlines.display();
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
    vp.move(min(width, mouseX), min(height, mouseY));
  }
}

void mouseReleased() {
  vp.setSelected(false);
}
