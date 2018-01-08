// The size of the cell where the lines are drawn.
float CELL_SIZE = 20;

// The current x position. This will increase by CELL_SIZE after drawing the lines to move horizontally.
float x = 0;

// The current y position. This will increase by CELL_SIZE after drawing a complete row of lines, to move vertically.
float y = 0;

// Set everything up before we start drawing.
void setup() {
  // Create a canvas at the size of the current screen.
  fullScreen();

  // Set the background to light grey.
  // This is the same as background(51, 51, 51)
  background(51);

  // Set the stroke color, i.e. the color of the lines.
  // This is the same as background(200, 200, 200)
  stroke(200);

  // We don't want to fill any shapes.
  noFill();
}

// Let's start drawing!
void draw() {
  // If we've already drawn the whole line, we want to start over on the next line.
  if (x >= width) {
    // Reset the x position to the far left.
    x = 0;
    // Increase the y position to go down by CELL_SIZE.
    y += CELL_SIZE;
  }

  // If we've already drawn the complete window, we start over.
  if (y >= height) {
    // Set the x position to the far left.
    x = 0;
    // Set the y position to the top of the window.
    y = 0;

    // Fill the window with the light grey color again to clear the canvas.
    background(51);
  }

  // Generate a random number between 0 and 1.
  int randomNumber = floor(random(0, 2));

  // If the number is 1, draw a line from (x, y) to (x+CELL_SIZE, y+CELL_SIZE). (Back slash)
  if (randomNumber == 1) { // \
    line(x, y, x+CELL_SIZE, y+CELL_SIZE);
  }
  // Else, draw a line from (x+CELL_SIZE, y) to (x, y+CELL_SIZE). (Forward slash)
  else { // /
    line(x+CELL_SIZE, y, x, y+CELL_SIZE);
  }

  // Now that we're done with the actual drawing, let's increase the x position before drawing the next line.
  x += CELL_SIZE;

  // At this point, the draw() function is called again, in an infinite loop.
}