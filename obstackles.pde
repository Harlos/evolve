class Obstackles {
  ArrayList<Obstackle> obstackles;
  boolean adding;
  PVector beginning;

  Obstackles() {
    obstackles = new ArrayList<Obstackle>();
    adding = false;
  }

  void addObs(PVector beginning) {
    this.beginning = beginning.copy();
    thinking();
  }

  void thinking() {
    if (mouseButton == LEFT) {
      adding = true;
      fill(0);
      rect(beginning.x, beginning.y, mouseX, mouseY);
      noFill();
    } else {
      adding = false;
      obstackles.add(new Obstackle(beginning, new PVector(mouseX, mouseY)));
    }
  }

  void run() {
    if (adding) thinking();
    display();
  }

  void display() {
    for (Obstackle item : obstackles)
      item.display();
  }

  boolean contains(Rocket rocket) {
    for (Obstackle item : obstackles) 
      if (item.contains(rocket)) 
        return true;
    return false;
  }
}