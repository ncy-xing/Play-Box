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
  //vp.display();
  vlines.display();

  translate(vp.getX(), vp.getY(), 0);
  center.display();
  translate(-vp.getX(), -vp.getY(), 0);

  //if (keyCode == ENTER) {
  //  toggle = true;
  //  // Change height of the camera with mouseY
  //  //camera(width/2, height/2, 220.0, // eyeX, eyeY, eyeZ
  //  //  0, 0, 0.0, // centerX, centerY, centerZ
  //  //  0.0, 1.0, 0.0); // upX, upY, upZ
  //  //translate(xOffset, yOffset, 0);
  //  //float fov = PI/3.0;
  //  //float cameraZ = (height/2.0) / tan(fov/2.0);
  //  //perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  //  //float aspect = float(width)/float(height);
  //  translate(vp.getX(), vp.getY(), 0);
  //  rotateX(-PI/6);
  //  rotateY(PI/3);
  //  box(100);
  //  translate(-vp.getX(), -vp.getY(), 0);
  //}
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
