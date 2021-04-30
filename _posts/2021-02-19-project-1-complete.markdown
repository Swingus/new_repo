---
layout: post
title:  "Project 1 Completion"
date:   2021-02-19 02:39:38 -0700
categories: Procedural Content Generation Independent Study
---
My implementation wound up being in Godot rather than Unity. I'd initially planned for Unity, but wound up disliking it a lot. Realistically, I should have given myself a week to mess around with different developement environments before I started working on the project, but regardless I'm happy to have settled into something I'm comfortable with.

My implementation involves using a tunneler of sorts, which I borrowed the idea for from the 3rd chapter of the PCGbook. My tunneler makes a check at each step to prevent moving back the way it came, and to prevent going outside the preset bounds we've made. It does this in the form of a queue which holds the four cardinal directions. Each time a direction is chosen which doesn't meet the criteria, we pop if off the queue, reshuffle the queue, and then check the new head of the queue. The vector location of each tile tunneled through is stored in an array, and this array will compare against likewise constructed arrays in the genetic step.

The genetic step optimizes for distance from entrance to exit, or head to tail of the array. The mutation factor involves running additional steps of the array to find a new tail from which to base this distance on. Below is an example of a dungeon layout, and also a codesnippet of the tunneler.

![tunneler](/assets/tunneler.png)

![layout](/assets/layout.png)

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/

