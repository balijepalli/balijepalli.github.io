title: Difference between ArrayList and LinkedList
id: 703
categories:
  - Core Java
date: 2012-11-02 07:11:26
tags:
---

*   ArrayList is implemented using re sizable array whereas,LinkedList is implemented using doubly LinkedList.
*   ArrayList insert needs re-size unlike LinkedList, It also warrants for index update if its not at the end of list.
*   Search Mechanism is Index based search in case of ArrayList which is not for LinkedList.
*   Removal of data is better in LinkedList compared to ArrayList
*   Hence,Insertion ore removal kind of application would be recommended with LinkedList, which does not re-size during the cycle.
*   ArrayList each index holds actual data  compared to LinkedList,which holds address of itself,next and previous node,so lesser memory overhead.
*   ArrayList is recommended for [random access](http://en.wikipedia.org/wiki/Random_access "Random access") of data compared to LinkedList, where, we need to traverse entire list.