title: Fail-Fast and Safe
tags:
  - Business
  - C++
  - Container (data structure)
  - Exception handling
  - Iterator
  - Languages
  - Programming
  - Structural
id: 707
categories:
  - Core Java
date: 2012-11-02 08:53:15
---

Fail-Fast [Iterators](http://en.wikipedia.org/wiki/Iterator "Iterator") fail as soon as they realized a thread is iterating over it,Structure of [Collection](http://en.wikipedia.org/wiki/Container_%28data_structure%29 "Container (data structure)") has been changed since iteration has begun

Structural changes like Create,Update,Delete
> <span>Fail-Fast collections throw throws <span>ConcurrentModificationException</span></span>
Whereas

,[![Fail Safe (2000 TV)](http://upload.wikimedia.org/wikipedia/en/thumb/c/c1/Failsafe2000.JPG/75px-Failsafe2000.JPG "Fail Safe (2000 TV)")](http://en.wikipedia.org/wiki/File:Failsafe2000.JPG)Iterator do not throw any Exception if collection is modified structurally,as they work on clone of collection instead of original collection.

Which all are [fail-safe](http://en.wikipedia.org/wiki/Fail-safe "Fail-safe") collections?

*   <span><span>CopyOnWriteArrayList</span></span>
*   ConcurrentHashMap