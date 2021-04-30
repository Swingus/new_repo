---
layout: post
title:  "Project Retrospect"
date:   2021-04-29 02:39:38 -0700
categories: Procedural Content Generation Independent Study
---
The first project involved using genetic algorithms to procedurally generate a dungeon. I used the tunneller agent and then optimized for distance between the entrance and exit of the dungeon. This is shown below. The tunneller is fairly naive, and allows for backtracking over already generated rooms, but it essentially carves out a map from being a collection of just walls into one which involves rooms and corridors.

![layout](/assets/layout.PNG)

The second project consisted of using cellular automata to generate cavelike structures. First, the entire floor is randomly generated. Then, each pass of the algorithm converts tiles of either wall or floor into the other type if the majority of their adjacent tiles is of the other type. I enjoyed this algorithm a lot, and it would later be used in my third and fifth projects as well.

![CA](/assets/CA.PNG)

The third project uses the diamond square algorithm to generate a top down view landscape. I combined this with the cellular automata to make two distinct types of terrain, trees represented in green, and plains represented in gray. The diamond square algorithm shades these by randomly generating height values for the pixel in each corner, then interpolating with a minor random change to get the center pixel. Then, using the center and two corner pixels, the same process is used to find the pixel bisecting one of the edges. This results in a new square to continue applying the diamond square algorithm.

![DS](/assets/DS.PNG)

The fourth project moves away from pixel management and into generating lines. We generated plants using L Systems, and this code is fairly modular, allowing for the user to easily change the angle in which branches are formed, as well as line length. L Systems take a recursive grammar and generate branches based on an initial structure this grammar defines, which will continue to generate smaller versions of this branching off one another in the mode of a fractal.

![LSYS](/assets/LSYS.PNG)

The fifth and final project involves using perlin noise to generate a noise based heightmap. The values of each variable for perlin noise is randomly generated within a prescribed range. I used this in conjunction with the cellular automata in order to texture the floor, while keeping the walls the same.

![perlinnnoise](/assets/perlinnoise.PNG)

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
