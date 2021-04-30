---
layout: post
title:  "2/12"
date:   2021-02-12 02:39:38 -0700
categories: Procedural Content Generation Independent Study
---
Constructive Generation

Dungeon generation typically has 3 elements: A representational model which abstracts the dungeon's structure, a method of constructing that model, and a method of creating the actual geometry of the dungeon from that model.

Dungeons and platformers both have free space, walls, treasures, enemies, and traps.

Constructive generation, while faster than the search based methods of the prior chapter, but as a cost give less control to the creator.

Space Partitioning, a method of subdividing portions of levels into sectionals called cells. This is often done hierarchically to form different levels of cells. One method of this is binary space partiitioning BSP which recursively divides space. This is expaned upon to quadtrees for 2d and octrees for 3d.

The entire dungeon is represented by the root node, and then each branch subdivides this. The subdivisions are checked if they meet the idealized size, and if not are further subdivided. Once reaching the idealized size, a room is generated stochastically within that plot, which will then have hallways connecting to at least one adjacent cell.

Agent Based Dungeon Growing, more organic and chaotic, a creation as needed sort of approach. Often called digger agents, as they create tunnels which define the dungeon. Upon generating a room or turning the tunneler agent, the chance of doing so is reset, and will grow by a degree until it does so again. More advanced diggers can look ahead in order to avoid intersection, however that's not always desired, as intersection can create more chaotic and interesting dungeons.

Because of the innate chaos of the agent based approach, tuning can require many tests in order to receive the desired results.

Cellular Automata, consists of an n dimensional grid, a set of states and transition rules. Often demonstrated as a vector or a 2d matrix. Each cell looks to its neighbors in order to determin its state. Everytime a room is exited, a new room is generated. This uses four parameters, a percentage of inaccessible areas, a number of cellular automata generations, a neighberhood trheshhold value, and the number of cells in one neighborhood.

Whenever a room is generated, its immediate neighboors are also generated in order to have proper connections between them.

Grammar based dungeon generation, uses the rules of a graph grammar to generate a graph that describes a level's topology. This is a high level topological representation and can be controlled through parameters including dificulty, fun, and global size.

advanced platform generation methods

Rhythm based generation, which links to the timing and repetition of user actions. This generation is reflective of the current user.

ORE based Chunk aproach takes pregenerated regions and sews them together as the player moves through the level. Post generation then places things like powerups. This is very designer oriented, and if taken too far strays away from procedural generation into manual construction.

LAB level generator for infinitux, a freeware 2d platforming game. The software to be used comes from https://sites.google.com/site/platformersai/platformer-ai-competition 

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/

