class VanishingLines {
  private int DIVISIONS = 3; // How many lines to draw starting from one side of the screen
  private PApplet canvas;
  private VanishingPoint vp;

  VanishingLines(PApplet canvas, VanishingPoint vp) {
    this.canvas = canvas;
    this.vp = vp;
  }

  public void display() {
    display(this.vp);
  }

  public void display(VanishingPoint vp) {
    float cX = vp.getX();
    float cY = vp.getY();
    canvas.stroke(#FF00FF);
    
    // Draw lines from bottom
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
    for (int x=0; x <= canvas.width; x+= canvas.width/DIVISIONS) {
      if (x == canvas.width / 2) {
        continue;
      }
      float slope = (canvas.height - vp.getY()) / (vp.getX() - x);
      float x2 = (vp.getY() / slope) +  vp.getX();
      canvas.line(x, canvas.height, x2, 0);
    }
    
    canvas.stroke(#00FFFF);
    canvas.line(0, cY, canvas.width, cY);
    canvas.line(cX, 0, cX, canvas.height);
  };
}
