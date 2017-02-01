class Obstackle {
  PVector beginning; 
  PVector ending;

  Obstackle(PVector beginning, PVector ending) {
    this.beginning = beginning.copy();
    this.ending = ending.copy();
  }

  void display() {
    stroke(2);
    rect(beginning.x, beginning.y, ending.x, ending.y);
    noStroke();
  }

  boolean contains(Rocket r) {
    float smallerY = min(beginning.y, ending.y);
    float smallerX = min(beginning.x, ending.x);    
    float biggerY = max(beginning.y, ending.y);
    float biggerX = max(beginning.x, ending.x);
    if (r.location.x > smallerX && r.location.x < biggerX && r.location.y > smallerY && r.location.y < biggerY)
      return true;
    else 
    return false;
  }
}