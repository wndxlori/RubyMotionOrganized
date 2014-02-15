# Organized RubyMotion
## Analyzing ways to better structure RubyMotion apps

I'm currently spending a lot of time looking for the best way to structure RubyMotion applications so classes follow the single responsibility principle (or at least as close as possible), without moving too far away from how traditional iOS and OS X projects are structured.

My aims are:

1. Have all classes follow as closely with the single responsibility principle
2. Keep within Apple's design patterns, trying to just extend them, not replace them
3. Make our code easier to test
4. Make our code loosely coupled
5. Keep things flexible
6. DRY up our code
7. Fix common view and controller code smells like Long Method and Large Class
8. Not require any gems, but allow for them to be used