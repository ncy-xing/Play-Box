/*
* Models a vanishing point with a square hitbox which can be dragged
* across the window by the user.
* Written for CSCI 3275 on Dec. 2023. 
* @author Nancy Xing 
*/
class VanishingPoint {
  private PApplet canvas;
  private float x;
  private float y;
  private int boxSize = 150;
  private int activeColor = color(255, 255, 255);
  private int passiveColor = color(153);
  private int fillColor;
  private boolean isSelected = false;
  private float xOffset = 0.0;
  private float yOffset = 0.0;
  
  /* Initialize variables.
  * @param canvas The canvas to draw on. 
  * @param x The starting X coordinate. 
  * @param y The starting Y coordinate. 
  */
  VanishingPoint(PApplet canvas, float x, float y) {
    rectMode(CENTER);
    this.x = x;
    this.y = y;
    this.canvas = canvas;
    this.fillColor = this.passiveColor;
  }
  
  /* Draws the vanishing point onto the canvas. */
  public void display() {
    canvas.noStroke();
    canvas.fill(fillColor);
    canvas.rect(x, y, boxSize, boxSize);
  }
  
  /* Return whether or not the vanishing point is currently selected. */
  public boolean isSelected() {
    return isSelected;
  }
  
  /* Set whether or not the vanishing point is currently selected. 
  * @param s True if point should be selected, false if not. 
  */
  public void setSelected(boolean s) {
    isSelected = s;
  }

  /* Check if the given cursor position is over the hitbox and sets hitbox color. 
  * @param x The cursor's X coordinate. 
  * @param y The cursor's Y coordinate. 
  */
  public boolean checkCursorOverBox(int x, int y) {
    if (x > this.x-boxSize && x < this.x+boxSize &&
      y > this.y-boxSize && y < this.y+boxSize) {
      fillColor = activeColor;
      return true;
    }
    fillColor = passiveColor;
    return false;
  }
  
  /* Move vanishing point. 
  * @param x X coordinate to move to. 
  * @param y Y coordinate to move to. 
  */
  public void move(float x, float y) {
    this.x = constrain(x, 0, canvas.width);
    this.y = constrain(y, 0, canvas.width);
  }
  
  /* Return current X coordinate. */
  public float getX() {
    return x;
  }
  
  /* Return current Y coordinate. */
  public float getY() {
    return y;
  }
}
