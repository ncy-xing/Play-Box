class Center {
  private PApplet canvas;
  private VanishingPoint vp;
  private float xTilt; 
  private float yTilt;

  Center(PApplet canvas, VanishingPoint vp) {
    this.canvas = canvas;
    this.vp = vp;
    xTilt = 0;
    yTilt = 0;
  }

  public void display() {
    canvas.rotateX(xTilt);
    canvas.rotateY(yTilt);
    box(100);
    
    canvas.rotateX(-xTilt);
    canvas.rotateY(-yTilt);
    box(100);
  }
  
  public void move() {
    xTilt += - PI / 100;
    yTilt += PI / 100;
  };
}
