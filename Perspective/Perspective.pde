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
boolean animateOn;
float xOffset = 0.0;
float yOffset = 0.0;

void setup() {
  size(1000, 700, P3D);
  rectMode(CENTER);
  vp = new VanishingPoint(this, width/2, height/2);
  vlines = new VanishingLines(this, vp);
  center = new Center(this, vp);
  boxSize = 10;
  animateOn = true;
}

void draw() {
  colorMode(HSB, 100);
  lights();
  background(0, 0, 0);
  pointLight(200, 50, 80, 200, -150, 0);

  if (vp.checkCursorOverBox(mouseX, mouseY)) {
    center.toggleActive(true);
  } else {
    center.toggleActive(false);
  }
  vlines.display();

  translate(vp.getX(), vp.getY(), 0);
  center.display();
  translate(-vp.getX(), -vp.getY(), 0);
  
  if (animateOn) {
    animate();
  }
}

void animate() {
  center.move();
}

void keyPressed(){
  if (keyCode == ENTER) {
    animateOn = !animateOn;
  }
  if (keyCode == RIGHT) {
    center.incrementHue(1);
  } 
  if (keyCode == LEFT) {
    center.incrementHue(-1);
  }
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
    vp.move(mouseX, mouseY);
  }

  xOffset = mouseX-bx;
  yOffset = mouseY-by;
}

void mouseReleased() {
  vp.setSelected(false);
}
