/*
* Models a white particle emanating from a given point.
* Written for CSCI 3275 on Dec. 2023. Initial code adapted from Sarah Harmon. 
* @author Nancy Xing 
*/
class Particle {
  private float x;
  private float y;
  private float speedX;
  private float speedY;
  private PApplet canvas;
  
  /* Initialize variables.
  * @param canvas The canvas to draw on. 
  * @param x The starting X coordinate. 
  * @param y The starting Y coordinate. 
  */
  Particle(PApplet canvas, float x, float y) {
    this.canvas = canvas;
    this.x = x;
    this.y = y;
    speedX = this.canvas.random(-5, 3);
    speedY = this.canvas.random(-5, 3);
  }
  
  /* Draw particle onto the canvas at its current location. */
  void display() {
    this.canvas.stroke(40, 0, 100);
    this.canvas.point(x, y);
  }
  
  /* Move particle. */
  void move() {
    // Updates position based on speed.
    x += speedX;
    y += speedY;
  }
}
