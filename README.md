# Organized RubyMotion
## Analyzing ways to better structure RubyMotion apps

I'm currently spending a lot of time looking for the best way to structure RubyMotion applications so classes follow the single responsibility principle (or at least as close as possible), without moving too far away from how traditional iOS and OS X projects are structured.

My aims are:

1. Have all classes follow as closely with the single responsibility principle as possible
2. Keep within Apple's design patterns, trying to just extend them, not replace them
3. Make our code easier to test with unit tests
4. Make our code loosely coupled
5. Keep things flexible / structure stays out of the way of requirements
6. DRY up our code
7. Fix common view and controller code smells like Long Method and Large Class
8. Not require any gems, but allow for them to be used

## Please Contribute

I can come up with as much as possible on my own, but to really get something solid going, we need to test this out in the wild. If you could try out writing applications using the structure and code in this repo, then forking the project and submitting a pull request with your suggestions, we can make a standard way of doing things that everyone will be familiar with.