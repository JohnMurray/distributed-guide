<#!! book/template.html !!#>
--CONTENT--

<div class="chapter-title">Introduction</div>

# Pre-Requisites

Before starting this book, you should be comfortable with programming applications on a single
machine. This guide will attempt to be as language agnostic as possible and will use a pseudo
language for any examples (although specific open source projects may be linked). It would also be
helpful (but not required) to be familiar with at least one concurrent programming model as well
as network programming (such as talking to an external web-service).

todo: Include some links for concurrent programming
todo: Include some links for network programming


# Topic Information

### TL;DR

If you are looking for the short and sweet answer to the question "what is a distributed system," then
the quote by [Leslie Lamport][4] summarizes this quite nicely:

> A distributed system is one in which the failure of a computer
> you didn't even know existed can render your own computer
> unusable.

This suggests that a single algorithm or program is dependent up on more than a single machine to operate
and that the machine may be distributed in a location that is remote from your computer's location. If we
consider this to be the sole definition of a distributed system, then you can see that even simple programs
can be distributed. Let's imagine that you are using a corporate accounting system that runs on your local
computer. This system on your computer is likely distributed in that it talks to, and relies on, many external
services such as:

  - Database to store accounting information
  - HR service to pull employee information
  - Business Systems services to pull daily revenue information
  - Etc.

From this definition, we can then define a distributed algorithm as one that runs across many machines
in order to solve a single question or serve a common purpose. In some cases, such as the one described
above, this is fairly straight forward since all coordination can be done from a single node. In the more
interesting case, and likely the reason you are reading this guide, we require things like
coordination in the tasks that we are performing and membership to keep track of which machines can perform those
tasks. This requires that each node in the distributed system work together in some way rather than just being
independent components that have no knowledge of the distributed system they live in.

### The More Formal Answer

Before we can learn about distributed algorithms, we need to have a basic understanding of what a distributed
system is. We can start with some basic terminology that we will use in this section.

<dl class="dl-horizontal">
  <dt>node</dt>
  <dd>talk about a node and stuffs...</dd>

  <dt>vertex</dt>
  <dd>talk about a vertex and stuffs...</dd>

  <dt>configuration / state</dt>
  <dd>talk about configuration and stuffs</dd>

  <dt>tx of state</dt>
  <dd>talk about how we transform state and stuffs...</dd>

  <dt>initial configuration</dt>
  <dd>talk about initial configurations and stuffs...</dd>
</dl>


- talk about nodes and processes working together
- categorize distributed systems into the various categories (membership, coordination, event ordering, etc)


# Further Readings

Given that this is a guide to distributed programming, I would highly recommend that you continue
reading to delve deeper into the various topics. In addition there are other sources of information
that you might find useful to use in tandem with (or possibly in lieu of) this material such as
Coursera's [Cloud Computing Concepts][1] and [Cloud Computing Concepts: Part 2][2] courses and the
[Distributed Algorithms][3] YouTube playlist by Seif Haridi.



  [1]: https://www.coursera.org/course/cloudcomputing
  [2]: https://www.coursera.org/course/cloudcomputing2
  [3]: https://www.youtube.com/playlist?list=PL700757A5D4B3F368
  [4]: http://www.lamport.org/
