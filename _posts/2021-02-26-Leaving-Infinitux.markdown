---
layout: post
title:  "Leaving Infinitux"
date:   2021-01-29 02:39:38 -0700
categories: Procedural Content Generation Independent Study
---
Unfortunately, despite it's appearances the codebase for the platformerai competition were too outdated. I was unabled to get it to work, even with using older installations of intellij. As such I propose an alternative to the platformer assignment: generating an overworld map via cellular automata.

In contrast with a dungeon, an overworld map is typically less focussed on the using walls and the lack thereof, and rather uses multiple environmental features such as grassland, hills, water, and forests to create a dynamic landscape. The way this generation works is I will assign a chance to each environmental feature, and every square in the grid will run those odds to decide what sort of tile it will be. These values will be stored in a 2d array, the indicies of which give the vector location of the tile. Then we perform a check, comparing each tile to it's current surroundings. If 5 or more surrounding tiles are of a different tile than the one in question, then this majority neighbor will be stored in that location in a new array. This will be done multiple times, in order to result in clusters of features, such as a mountain range or a lake.

This should be certainly doable as I can use my code from project 1 for reference in creating this new generation type. I've already built up some of the necessary skills through this prior project.
[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/

