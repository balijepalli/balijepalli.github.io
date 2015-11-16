title: "How to Make a Java\_Class\_Immutable"
id: 190
categories:
  - Patterns and Refactoring
date: 2010-03-12 09:25:00
tags:
---

<!--more-->====DRAFT VERSION IN EDIT/PUBLISH MODE====
In Object oriented and functional programming like java we have:

*   Immutable objects
Example: Strings are considered immutable because the values contained in the reference variable cannot be changed.

*   Mutable objects
Example: String Buffer is considered mutable because the value in a string buffer can be changed (i.e. mutable)

How to make our user defined classes as immutable?

*   To make a class immutable we must restrict changing the state of the class object by any means. This in turn means avoiding an assignment to a variable. We can achieve this through a final modifier.
*   To further restrict the access we can use a private access modifier. Above do not provide any method where we modify the instance variables.
**Example One:**
> class ImmutableCart {> 
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; private final List items;> 
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public ImmutableCart(List items) {> 
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.items = Collections.unmodifiableList(new ArrayList(items));> 
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }> 
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public List getItems() {> 
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; return items;> 
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }> 
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public int total() {&nbsp;&nbsp;&nbsp;&nbsp; /* return sum of the prices */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}> 
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
**Example Two:**
> /*This code demonstrates the way to make a class immutable*/> 
> // The immutable class which is made final> 
> final class MyImmutableClass> 
> {> 
> // instance var are made private &amp; final to restrict the access> 
> private final int idx;> 
> private final double val;> 
> // Constructor where we can provide the constant value> 
> public MyImmutableClass(int index,double value)> 
> {> 
> idx = index;> 
> val = value;> 
> }> 
> // provide only methods which return the instance var &amp; not change the values> 
> public int getIdx()> 
> {> 
> return idx;> 
> }> 
> public double getVal ()> 
> {> 
> return val;> 
> }> 
> }
> // class TestImmutable> 
> 
> public class TestImmutable> 
> 
> {> 
> 
> public static void main(String[] args)> 
> 
> {> 
> 
> MyImmutableClass obj1 = new MyImmutableClass(3,5);> 
> 
> System.out.println(obj1.getIdx());> 
> 
> System.out.println(obj1.getVal ());> 
> 
> // there is no way to change the values of index &amp; value-> 
> 
> // no method to call besides getXX, no subclassing, no public access to var -&gt; Immutable> 
> 
> }> 
> }
**Pro/Con of making an object immutable**
Immutable objects are often useful because some costly operations for copying and comparing can be omitted, simplifying the program code and speeding execution.
However, making an object immutable is usually inappropriate if the object contains a large amount of changeable data. Because of this, many languages allow for both immutable and mutable objects.
Additionally, all of the primitive wrapper classes in Java are immutable.
**Copy-on-write**
A technique which blends the advantages of mutable and immutable objects, and is supported directly in almost all modern hardware, is copy-on-write (COW). Using this technique, when a user asks the system to copy an object, it will instead merely create a new reference which still points to the same object. As soon as a user modifies the object through a particular reference, the system makes a real copy and sets the reference to refer to the new copy. The other users are unaffected, because they still refer to the original object. Therefore, under COW, all users appear to have a mutable version of their objects, although in the case that users do not modify their objects, the space-saving and speed advantages of immutable objects are preserved. Copy-on-write is popular in virtual memory systems because it allows them to save memory space while still correctly handling anything an application program might do.