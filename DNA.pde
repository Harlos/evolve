class DNA {
  PVector[] genes;
  float maxforce;

  DNA() {
    maxforce = 0.1;
    genes = new PVector[lifeTime];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = PVector.random2D();
      genes[i].mult(random(0, maxforce));
    }
  }
}