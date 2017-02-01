class Population {

  int counter;
  float mutationRate;
  ArrayList<Rocket> matingPool;
  Rocket[] population;

  Population(float mutationRate, int size) {
    this.mutationRate = mutationRate;
    population = new Rocket[size];
    for (int i = 0; i < population.length; i++) 
      population[i] = new Rocket();
    matingPool = new ArrayList<Rocket>();
    counter = 0;
  }

  void live (int counter, Obstackles obstackles) {   
    while (this.counter <= counter) {
      for (int i = 0; i < population.length; i++) {
        population[i].run(this.counter, obstackles);
      }
      this.counter++;
    }
  }

  void evolve() {
    this.counter = 0;
    fitness();
    selection();
    reproduction();
  }

  void fitness() {
    for (Rocket roc : population)
      roc.fitness();
  }

  void selection() {
    matingPool.clear();
    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = map(population[i].fitness, 0, maxFitness(), 0, 1);
      int n = (int) (fitnessNormal * 100);
      if (population[i].crushed) n *= 0.01;
      if (population[i].arrived) n *= 10;
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }

  void reproduction() {
    for (int i = 0; i < population.length; i++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      Rocket partnerA = matingPool.get(a);
      Rocket partnerB = matingPool.get(b);
      Rocket child = partnerA.crossover(partnerB);
      child.mutate(mutationRate);
      population[i] = child;
    }
    println(population.length);
  }

  float maxFitness() {
    float max = 0;
    for (int i = 0; i < population.length; i++) 
      if ( population[i].fitness > max) max = population[i].fitness;
    return max;
  }
}