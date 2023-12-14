class Center {
  private PApplet canvas;
  private VanishingPoint vp;
  private float xTilt; 
  private float yTilt;
  private color currentColor;
  private int activeColor = color(255, 255, 255);
  private int passiveColor = color(153);

  Center(PApplet canvas, VanishingPoint vp) {
    this.canvas = canvas;
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
    
    canvas.rotateX(-xTilt);
    canvas.rotateY(-yTilt);
    box(100);
  }
  
  public void toggleActive(boolean active) {
    currentColor = active ? activeColor : passiveColor;
  }
  
  public void move() {
    xTilt += - PI / 100;
    yTilt += PI / 100;
  };
}
