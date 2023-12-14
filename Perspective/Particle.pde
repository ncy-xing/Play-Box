class Particle {
  // The position of this Particle.
  private float x;
  private float y;
  private float speedX;
  private float speedY;
  private PApplet canvas;

  Particle(PApplet canvas, float x, float y) {
    this.canvas = canvas;
    this.x = x;
    this.y = y;

    speedX = this.canvas.random(-5, 3);
    speedY = this.canvas.random(-5, 3);
  }

  void display() {
    this.canvas.stroke(40, 0, 100);
    this.canvas.point(x, y);
  }

  void move() {
    // Updates position based on speed.
    x += speedX;
    y += speedY;
  }
}
