class VanishingLines {
  private int DIVISIONS = 2; // How many lines to draw starting from one side of the screen
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
    canvas.line(0, cY, canvas.width, cY);
    canvas.line(cX, 0, cX, canvas.height);
  };
  
}
