class Center {
  private float COLOR_INCREMENT = 10;
  private PApplet canvas;
  private VanishingPoint vp;
  private float xTilt;
  private float yTilt;
  private color currentColor;
  private color activeColor;
  private color passiveColor;
  private float rotationOffset = PI/120.0;

  Center(PApplet canvas, VanishingPoint vp) {
    this.canvas = canvas;
    canvas.colorMode(HSB, 100);
    activeColor = color(0, 0, 100);
    passiveColor = color(random(0, 100), 50, 80);

    this.vp = vp;
    xTilt = 0;
    yTilt = 0;
    currentColor = passiveColor;
  }

  public void display() {
    canvas.fill(currentColor);
    canvas.noStroke();
    canvas.rotateX(xTilt);
    canvas.rotateY(yTilt);
    box(100);

    canvas.rotateX(-xTilt / 2);
    canvas.rotateY(-yTilt / 2);
    box(100);
    canvas.tint(255, 255);
  }

  public void toggleActive(boolean active) {
    currentColor = active ? activeColor : passiveColor;
  }

  public void incrementHue(int direction) {
    float hue = hue(passiveColor);
    hue += (direction) * COLOR_INCREMENT;
    if (hue > 100 || hue < 0) {
      hue = abs(100 % hue);
    } 
    passiveColor = color(hue, saturation(passiveColor), brightness(passiveColor));
  };

  public void move() {
    xTilt += rotationOffset;
    yTilt += rotationOffset;
  };
}
