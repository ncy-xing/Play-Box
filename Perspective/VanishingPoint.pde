/* Vanishing point with a square hitbox which can be dragged
 across window by the user. */
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

  VanishingPoint(PApplet canvas, float x, float y) {
    rectMode(CENTER);
    this.x = x;
    this.y = y;
    this.canvas = canvas;
    this.fillColor = this.passiveColor;
  }

  public void display() {
    canvas.noStroke();
    canvas.fill(fillColor);
    canvas.rect(x, y, boxSize, boxSize);
  }

  public boolean isSelected() {
    return isSelected;
  }

  public void setSelected(boolean s) {
    isSelected = s;
  }

  /* Check if the given cursor position is over the hitbox and sets hitbox color. */
  public boolean checkCursorOverBox(int x, int y) {
    if (x > this.x-boxSize && x < this.x+boxSize &&
      y > this.y-boxSize && y < this.y+boxSize) {
      fillColor = activeColor;
      return true;
    }
    fillColor = passiveColor;
    return false;
  }

  public void move(float x, float y) {
    this.x = constrain(x, 0, canvas.width);
    this.y = constrain(y, 0, canvas.width);
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }
}
