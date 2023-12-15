/*
* Models a rotating box figure within the given canvas.
* Written for CSCI 3275 on Dec. 2023.
* @author Nancy Xing 
*/
class Center {
  private float COLOR_INCREMENT = 1;
  private PApplet canvas;
  private VanishingPoint vp;
  private float xTilt;
  private float yTilt;
  private color currentColor;
  private color activeColor;
  private color passiveColor;
  private float rotationOffset = PI/120.0;
  
  /* Initialize variables.
  * @param canvas The canvas to display on. 
  * @param vp the vanishing point to use as a hitbox.
  */ 
  Center(PApplet canvas, VanishingPoint vp) {
    this.canvas = canvas;
    canvas.colorMode(HSB, 100);
    activeColor = color(0, 0, 100);
    passiveColor = color(random(0, 100), 50, 80);

    this.vp = vp;
    xTilt = 0;
    yTilt = 0;
    currentColor = passiveColor;
  }
  
  /* Draw two rotating boxes onto the canvas. */
  public void display() {
    canvas.fill(currentColor);
    canvas.noStroke();
    canvas.rotateX(xTilt);
    canvas.rotateY(yTilt);
    box(100);
    canvas.rotateX(-xTilt / 2);
    canvas.rotateY(-yTilt / 2);
    box(100);
    canvas.tint(255, 255);
  }
  
  /* Change center color when active. */
  public void toggleActive(boolean active) {
    currentColor = active ? activeColor : passiveColor;
  }
  
  /* Changes hue of the center in a given direction. 
  * @param direction Value of -1 or 1 to indicate direction of the hue change. 
  */
  public void incrementHue(int direction) {
    float hue = hue(passiveColor);
    hue += (direction) * COLOR_INCREMENT;
    if (hue > 100) {
      hue = abs(100 % hue);
    } else if (hue < 0) {
      hue = 100 - COLOR_INCREMENT;
    }
    passiveColor = color(hue, saturation(passiveColor), brightness(passiveColor));
  };
  
  /* Rotate the center in place. */
  public void move() {
    xTilt += rotationOffset;
    yTilt += rotationOffset;
  };
  
  /* Returns current color of center. */
  public color getColor() {
    return passiveColor;
  }
}
