title: "Naming conflicts\_inside\_interface"
id: 241
categories:
  - Patterns and Refactoring
date: 2010-06-21 11:16:21
tags:
---

**Case#1:**_**If two interfaces have the two are more same methods, ****and then**** only one method implementation is enough from both interfaces.**_

`interface Left { public void m1(); }

interface Right{public void m1();}

class Central implement Left, Right
{
public static void main(String arg[])

{
public void m1(){ }
}
}`

**Case#2:**_**The interface having same method name but different arguments.
**_`Interface Inter

{

public void m1();

public void m1(int x);

}`

**Case#3:**_**Same method name, same arguments but different written types.
**_`Interface Left{public void m1();}

Interface Right{public int m1();}

class Central implement Left, Right

{

public static void main(String arg[])

{

public void m1() {}// error

public int m1(){}// error

}

}
`
In the above class same method signature m1 is not allow .violation leads to compile time error.

**Exceptional case: **_**We can’t provide implementation at a time for two or more interfaces having methods with same signature but different return ****type.**_

_**Variable Naming conflicts:
**_`interface Left{int x=10;}

interface Right{int x=100;}

class Central implement Left, Right

{
public static void Main(String arg[])

{

System.out.println(x); // reference to x is ambiguous both variables
System.out.println(Right.x);

System.out.println(Left.x);

}

}`

we can resolve variable naming conflicts using interface name.(i.e instead of x we have to specify left.x or right.x).

* One of my friend wanted the answers so posted this content