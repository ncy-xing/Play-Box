class Bubble {
  // The position of this Bubble.
  private float x;
  private float y;

  // The size of this Bubble.
  private float size;

  // How much red, green, and blue this Bubble has.
  private float myRed;
  private float myGreen;
  private float myBlue;

  // How fast this Bubble moves.
  private float speedX;
  private float speedY;

  // Store a reference to the canvas.
  private PApplet canvas;

  Bubble(PApplet canvas, float x, float y) {
    // Store a reference to the canvas.
    this.canvas = canvas;

    // Store x and y.
    this.x = x;
    this.y = y;

    // Randomize our size.
    size = this.canvas.random(15, 35);

    // Randomize our color.
    myRed = this.canvas.random(0, 255);
    myGreen = this.canvas.random(0, 255);
    myBlue = this.canvas.random(0, 255);

    // Randomize our speed.
    speedX = this.canvas.random(-5, 5);
    speedY = this.canvas.random(-5, 5);
  }

  void display() {
    // This method specifies our Bubble will not have an outline.
    this.canvas.noStroke();

    // Specifies the fill for the Bubble.
    this.canvas.fill(myRed, myGreen, myBlue);

    // Draws an ellipse on the screen to represent our Bubble.
    this.canvas.ellipse(x, y, size, size);
  }

  void move() {
    // Updates position based on speed.
    x += speedX;
    y += speedY;
  }
}
