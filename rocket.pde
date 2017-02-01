class Rocket {

  DNA dna;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float fitness;
  boolean crushed;
  boolean arrived;

  Rocket() {
    dna = new DNA();
    location = new PVector(width/2, height - 20);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    crushed = false;
    arrived = false;
  }

  void fitness() {
    float d = PVector.dist(location, target);
    fitness = pow(1/(d), 2);
  }

  Rocket crossover(Rocket partner) {
    Rocket child = new Rocket();
    for (int i = 0; i < child.dna.genes.length; i++)
      if (Math.round(random(1)) == 1)
        child.dna.genes[i] = partner.dna.genes[i];
      else
        child.dna.genes[i] = dna.genes[i];
    return child;
  }

  void mutate(float mutationRate) {
    for (PVector vec : dna.genes)
      if (random(0, 1) > mutationRate) {
        vec = PVector.random2D();        
        vec.mult(random(0, dna.maxforce));
      }
  }

  void run(int geneCounter, Obstackles obstackles) {
    applyForce(dna.genes[geneCounter]);
    update(obstackles);
    display();
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  void update(Obstackles obstackles) {
    velocity.add(acceleration);
    if (PVector.dist(location, target) <= 20)
      arrived = true;
    crushed = obstackles.contains(this);
    if (location.x < 0 || location.x > width || location.y < 0 || location.y > height) crushed = true;
    if (!crushed && ! arrived)
      location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading() + PI/2);
    fill(0, 0, 255);
    if (crushed) fill(255, 0, 0);
    if (arrived) fill(255, 0, 255);
    triangle(0, -3*2, -3, 3*2, 3, 3*2);
    noFill();
    popMatrix();
  }
}