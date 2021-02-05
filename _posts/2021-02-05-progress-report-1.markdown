---
layout: post
title:  "Chapter 2 Lab Planning Phase"
date:   2021-01-29 02:39:38 -0700
categories: Procedural Content Generation Independent Study
---
nfortunately I had a number of assignments due this week, so I had less time to work on this project than I would have liked. So what I did this week was more of a planning phase.

First I planned out how I would implement the dungeon. While some examples include hallways connecting rooms, I rather considered a full room implementation. Every room has at least one exit, facing north, south, east, or west. The maximum number of exits is 4, in which every direction has an exit.

The inspiration for this implementation comes from two places, The Binding of Isaac which is a classic roguelike and follows a format like this, and Path of Exile's Delve, which has a similar base structure and generates infinitely as the user progresses through areas of the dungeon or mines.

Additionally I wanted to take the idea of secret passageways from Path of Exile's Delve. In Path of Exile, the user can see all surrounding rooms in approximately a radius of 3 rooms, including disconnected rooms. There can be secret passageways from any room which has 2 or 3 visible passageways, to preserve the finality of dead ends as well as respecting that there can be no hidden passageways from a four exit room.

I don't want the user to be able to at a glance simply solve the maze though, so it will include what's often referred to as fog of war, a placeholder tile in place until a room is discovered. However, this would make finding hidden passages impossible, and so I decided that one of the dead ends in a cluster would include map data, and after gaining it all fog of war would be removed.

The idea of the generation is to first create a path from the entrance to exit which includes 2, 3, and 4 exit rooms. These rooms will then have branches generate from them based on the unused exits. Any branch will have a maximum of 3 room traversals to reach a dead end to avoid frustration. The base structure of a dungeon cluster is a 10x10 grid. Anytime there is a wall which could hold a secret passage, i.e. it has two empty spaces in that direction.

I considered the best and worst case dungeon lengths to set optimization parameters for the genetic algorithm. The minimum length for a correct path is 1, and the maximum 100. I therefore figured that optimal length should be between 35 and 60 in length. This allows for a good amount of variability, making each dungeon cluster feel more distinct from one another. The range spans 25, a quarter of the distance between the potential min and max dungeon sizes. However it errs on the shorter side of things to allow for less frustration stemming from overly long dungeons. The other optimization parameter comes from the frequency of non required paths, or branches. There should be approximately 1 to 2 branches per every three rooms on the valid path. Additionally, 0 to 1 secret passageways per every three rooms on the valid path. The third and final optimization parameter involves the total number of rooms. The highest amount will be considered the most valid in terms of final selection.

Below is the spritesheet for the room layouts, with those on the bottom and right edges being secret passageway sprites. Upon further thinking, secret passageways might be a stretch goal for this project.

![spritesheet](/assets/RoomSpriteSheet.PNG)

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
