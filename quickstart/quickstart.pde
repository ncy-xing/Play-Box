// Create an array of Bubbles.
Bubble[] theBubbles = new Bubble[100];

// How many Bubbles we have already created.
int numBubbles = 0;

// The current index position in our Bubble array.
int currentBubble = 0;

void setup() {
  size(500, 500, P3D);
}

void draw() {
  // Clear the background.
  background(0, 0, 0);

  // If the user clicks...
  if (mousePressed) {
    // Create a Bubble and add it to the current index in our array.
    // The Bubble should be placed where the user clicked.
    theBubbles[currentBubble] = new Bubble(this, mouseX, mouseY);

    // Increase the current index to get ready for the next Bubble.
    currentBubble++;

    // Increase our total bubbles in play, if we haven't filled the array yet.
    if (numBubbles < theBubbles.length) {
      numBubbles++;
    }

    // Did we just use our last slot? If so, we can reuse old slots.
    if (currentBubble >= theBubbles.length) {
      currentBubble = 0;
    }

  }
  
  // Draw all bubbles that have been created.
    for (int i = 0; i < numBubbles; i++) {
      if (keyCode != UP) {
        theBubbles[i].move();
      }
      theBubbles[i].display();
    }
}
