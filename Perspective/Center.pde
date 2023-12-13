class Center {
  private PApplet canvas;
  private VanishingPoint vp;

  Center(PApplet canvas, VanishingPoint vp) {
    this.canvas = canvas;
    this.vp = vp;
  }

  public void display() {
    rotateX(-PI/6);
    rotateY(PI/3);
    box(100);
  }
}
