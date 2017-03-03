# Week 2 Notes


***
## Lattice plotting system

Lattice plotting system is implemented using the following packages:

* *lattice*: contains code for producing Trellis graphics, which are independent of the *"base"* graphics system; includes function like **xplot, bwplot, levelplot**

* *grid*: implements a different graphing system independent of the *"base"* system; the *lattice* package builds on top of *grid*

  - We seldom call functions from the *grid* package directly
  
* The lattice plotting system does not have a "two-phase" aspect with separate plotting and annotations like in base plotting.

* All plotting/annotations is donoe at once with a single function call.

