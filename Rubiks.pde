import peasy.*;
PeasyCam cam;
import java.lang.Math;
Cube rub;
boolean canFlip = true;

// Cooldown variables
long lastTurnTime = 0; // Timestamp of the last turn
long cooldownDuration = 175; // Cooldown duration in milliseconds (1/4 second)

void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, 400);
  rub = new Cube(3, 40);
}

void draw() {
  background(220); 
  rub.drawPieces();

  // Check if the cooldown period has elapsed
  if (millis() - lastTurnTime > cooldownDuration) {
    if (keyPressed && canFlip) {
      if (key == 'b') {
        rub.makeTurn(2, 0, true); // BLUE
        lastTurnTime = millis(); // Update the last turn time
      } else if (key == 'g') {
        rub.makeTurn(2, 2, true);  // GREEN
        lastTurnTime = millis();
      } else if (key == 'o') {
        rub.makeTurn(0, 2, true); // ORANGE
        lastTurnTime = millis();
      } else if (key == 'r') {
        rub.makeTurn(0, 0, true); // RED
        lastTurnTime = millis();
      } else if (key == 'w') {
        rub.makeTurn(1, 2, true); // WHITE
        lastTurnTime = millis();
      } else if (key == 'y') {
        rub.makeTurn(1, 0, true); // YELLOW
        lastTurnTime = millis();
      } else if (key == 'z') {
        rub.scramble();
        lastTurnTime = millis();
      }
    }
  }

  // Reset canFlip when 'k' is pressed
  if (keyPressed && key == 'k') {
    canFlip = true;
  }
}
