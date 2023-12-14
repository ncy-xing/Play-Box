class VanishingLines {
  private int DIVISIONS = 4; // How many lines to draw starting from one side of the screen
  private int COLOR_SET_SIZE = 3;
  private PApplet canvas;
  private VanishingPoint vp;
  private color baseColor;
  private float hueChange;
  private float brightChange;
  private float satChange;

  VanishingLines(PApplet canvas, VanishingPoint vp, color c) {
    this.canvas = canvas;
    this.vp = vp;
    this.baseColor = c;
    hueChange = random(0, 20);
    brightChange = random(0, 60);
    satChange = random(0, 40);
  }

  public void display() {
    display(this.vp);
  }

  public void setColor(color c) {
    baseColor = c;
  }

  public void display(VanishingPoint vp) {
    float cX = vp.getX();
    float cY = vp.getY();

    // Draw lines from bottom
    canvas.stroke(transformColor(baseColor, hueChange, brightChange, 0));
    for (int x=0; x <= canvas.width; x+= canvas.width/DIVISIONS) {
      if (x == canvas.width / 2) {
        continue;
      }
      float slope = (vp.getY()) / (vp.getX() - x);
      float y2 = canvas.height;
      float x2 = y2 / slope + x;
      canvas.line(x, 0, x2, y2);
    }

    // Draw lines from top
    canvas.stroke(transformColor(baseColor, 0, brightChange, satChange));
    for (int x=0; x <= canvas.width; x+= canvas.width/DIVISIONS) {
      if (x == canvas.width / 2) {
        continue;
      }
      float slope = (canvas.height - vp.getY()) / (vp.getX() - x);
      float x2 = (vp.getY() / slope) +  vp.getX();
      canvas.line(x, canvas.height, x2, 0);
    }

    // Draw transverse lines
    canvas.stroke(baseColor);
    canvas.line(0, cY, canvas.width, cY);
    canvas.line(cX, 0, cX, canvas.height);
  };

  public color transformColor(color c, float hueChange, float brightChange, float satChange) {
    float hue = hue(c) + hueChange;
    hue = constrain(hue, 0, 100);
    float saturation = saturation(c) + brightChange;
    saturation = constrain(saturation, 10, 100);
    float brightness = hue(c) + satChange;
    hue = constrain(hue, 20, 100);

    return color(hue, saturation, brightness);
  }
}
