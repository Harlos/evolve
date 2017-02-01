import java.lang.Math;
Population population;

int lifeTime;
int generationCounter;
int lifeCounter;
PVector target;
Obstackles obstackles;
boolean running;

void setup() {
  size(800, 800, P2D);
  rectMode(CORNERS);
  lifeTime = 500;
  running = false;

  target = new PVector(width/2, 20);
  obstackles = new Obstackles();

  fill(0);
  generationCounter = 0;
  float mutationRate = 0.01;
  int amount = 3000;
  population = new Population(mutationRate, amount);
}

void keyPressed() {
  if (key == 'p')
    if (running) running = false;
    else 
    running = true;
}

  void mousePressed() {
    if (mouseButton == RIGHT)
      target.set(mouseX, mouseY);
    if (mouseButton == LEFT);
    obstackles.addObs(new PVector(mouseX, mouseY));
  }

  void draw() { 
    background(255);
    fill(0, 255, 0);
    ellipse(target.x, target.y, 40, 40);
    noFill();
    obstackles.run();
    text("generation: " + generationCounter, 10, 10);
    text("lifeCounter: " + lifeCounter, 10, 20);
    if (running)
      if (lifeCounter < lifeTime) {
        //println(frameRate);
        population.live(lifeCounter, obstackles);
        lifeCounter += 5;
      } else {
        generationCounter++;
        lifeCounter = 0;
        population.evolve();
      }
  }