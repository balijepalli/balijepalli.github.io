title: Difference between Hashtable and ConcurrentHashmap
tags:
  - ConcurrentHashmap
  - Hashtable
  - Java
  - Map
  - 'NULL'
  - Programming
  - Thread safety
  - Threads
id: 696
categories:
  - Core Java
date: 2012-11-02 06:44:59
---

Prior one is part of Synchronised Collection classes <span>[Hashtable](http://en.wikipedia.org/wiki/Hash_table "Hash table")</span> and Vector are also Synchronised Wrapper classes

*   Allows NULL values
*   <span>Where,Collections.synchronizedMap and Collections.synchronizedList, provide a basic conditionally [thread-safe](http://en.wikipedia.org/wiki/Thread_safety "Thread safety") implementation of Map and List</span>
*   <span>Have to lock single collection wide lock to avoid ConcurrentModificationException and which would impediment to scalability</span>
*   Once the size of Hashtable increases , locking is done for longer duration to iteration, which would degrade the performance
Later one is introduced for the concept of segmentation ,so

*   Does not allow NULL values
*   Larger it becomes only certain part of it get locked to provide thread safety
*   Used for high volume low latency apps
*   Readers can access map without waiting for iterations to complete