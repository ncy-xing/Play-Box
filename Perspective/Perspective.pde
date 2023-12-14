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
Particle[] particles;
int numParticles  = 0;
int particleIndex = 0;
int lastTime;

Particle test;

void setup() {
  size(1000, 700, P3D);
  surface.setTitle("Play Box");
  surface.setResizable(true);
  rectMode(CENTER);
  vp = new VanishingPoint(this, width/2, height/2);
  center = new Center(this, vp);
  vlines = new VanishingLines(this, vp, center.getColor());
  boxSize = 10;
  animateOn = true;
  particles = new Particle[200];

  for (int i = 0; i < 50; i++) {
    addParticle();
  }
}

void addParticle() {
  particles[particleIndex] = new Particle(this, vp.getX(), vp.getY());
  particleIndex++;
  // Increase our total bubbles in play, if we haven't filled the array yet.
  if (numParticles < particles.length) {
    numParticles++;
  }
  if (particleIndex >= particles.length) {
    particleIndex = 0;
  }
}

boolean atTimeInterval(int elapsed) {
  boolean result = elapsed - lastTime > 100;
  lastTime = millis();
  return result;
}

void draw() {
  colorMode(HSB, 100);
  lights();
  background(0, 0, 0);
  pointLight(200, 50, 80, 200, -150, 0);
  color c = center.getColor();
  pointLight(hue(c), saturation(c), brightness(c), vp.getX(), vp.getY(), 0);

  for (int i = 0; i < numParticles; i++) {
    particles[i].display();
    if (animateOn) {
      particles[i].move();
    }
  }

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
    addParticle();
  }

  if (keyPressed) {
    checkColorChange();
    vlines.setColor(center.getColor());
  }

  //if (atTimeInterval(millis())) {
  //  addParticle();
  //};
}

void checkColorChange() {
  if (keyCode == RIGHT) {
    center.incrementHue(1);
  }
  if (keyCode == LEFT) {
    center.incrementHue(-1);
  }
}

void animate() {
  //rotate center
  center.move();
}

void keyPressed() {
  if (keyCode == ENTER) {
    animateOn = !animateOn;
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
