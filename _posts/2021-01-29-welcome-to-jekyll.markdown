---
layout: post
title:  "First post"
date:   2021-01-29 02:39:38 -0700
categories: Procedural Content Generation Independent Study
---
This is the first post of the project, and as such it contains everything I took to be especially notable. Of course, some things are left out for the sake of brevity. My work for this first week consisted of reading both the introductory chapter and the search based methods chapters closely, as well as setting up this jekyll blog. My notes on the first and 2nd chapter are as follow:

Introduction:
Procedural Content Generation(PCG): the algorithmic creation of game content with limited or indirect user input

Examples: levels, maps, game rules, textures, stories, items, quests, music, weapons, vehicles, characters

Within their definition of games, generated content must meet the following: Levels are completable, items and environment should be affordably interactable(such as ascending a generated staircase or using a generated weapon), and you must be able to win a generated game

Uses: Removes need for a human designer or artist to generate content. The high costs of developers promotes risk avoidance and less diversity of the marketplace. Additionally can be used to augment human creators, allowing for designers and artists to create content with greater ease.

Proposed endless game, which generates faster than it’s played, and even models after the players’ behaviour to be tailored to them

One initial use was to overcome the physical limits of older games.

Classic examples: Rogue, dwarf fortress, elite, minecraft, diablo ii, civilization iv, spelunky

Currently pursued for PCG: 1:Generation with a minor framework, such as the capability to generate skyrim, story elements, landscape, and items, but not including mechanics
2: Genres which are completely reliant on PCG, unrecognizable without.
3: Generation of a whole game procedurally.

Desirable Properties:
Speed varies as needed, if generated in game or prior to shipping.
Reliability: varies as needed, where visuals might need less reliability but mapping needs more.
Control: level of creator defined control
Diversity: ensuring that the content doesn’t result in feeling “samey”
Believability: how much it looks like a PCG vs a human generation

Metaphors for PCG Systems: Tools to enhance the design process, materials to allow working with design in new ways, designers who create the levels themselves, or a critic who makes modifications based on a precedent.

Search based:
Evolutionary algorithm or other stochastic search/optimization looks for desirable qualities.
Theory is if we keep iterating and adding positive traits and killing negative ones, we will reach a desired solution.

Core components:
Search algorithm, content representation, and an evaluation function

Evolutionary Search:
Start with randomly generated units with highly varied attributes, and then set constraints upon them, weeding out those unfit. Then, create a new sample from mixing the survivors, who will now face a new set constraint. This often includes a mutation factor to prevent pigeonholeing of a “correct” solution, which might be samey.

Steps: mu+lambda population size
Permute randomly
Evaluate all members granting them a fitness score
Sort in ascending fitness
Remote the lambda worst individuals
Replace those removed with with copies of mu(the survivors)
Mutate the mu offspring randomly(gaussian mutation)
If the population has an individual considered above a certain fitness, or max generations, end. Otherwise return to the permutation step.



[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
