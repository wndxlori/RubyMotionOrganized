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

## Explaining the structure and code

### Views

The `views` folder in this structure is mainly for custom views (I'd say custom table view cells would go in a `cells` folder). Views should be focused on structure and user event handling, though I would like to see event handling possibly moved out too so the actions can be tested seperately, just like HTML and JavaScript.

Implementation is fairly simple, and is just taking advantage of `tap` to create a hierarchy in the code.

```ruby
class OrganizedView < UIView
  attr_accessor :delegate, :title

  def init
    super.tap do |ov|
      ov.addSubview(
        OrganizedStylesheet.header.tap do |header|
          header.addSubview(@title = OrganizedStylesheet.title)
        end
      )

      ov.addSubview(
        OrganizedStylesheet.button.tap do |b|
          b.addTarget(ov, action: 'button_clicked', forControlEvents: UIControlEventTouchUpInside)
        end
      )

      ov.addSubview(
        OrganizedStylesheet.other_button.tap do |b|
          b.addTarget(ov, action: 'button_clicked', forControlEvents: UIControlEventTouchUpInside)
        end
      )
    end
  end

  def button_clicked
    self.delegate.buttonPressedForOrganizedView(self)
  end
end
```

By calling `tap` on super, we can just jump straight into setting things up. There is also no styling code needed because this view would be created in a stylesheet, and it's subviews are coming from a stylesheet too, so lets look at stylesheets.

### Stylesheets

Stylesheets are really simple. All we're doing is created defining class methods for each of the styles we need, and then those styles create and configure the view. This also makes inheritance stupidly easy, because we can just call `tap` on another style. A lot of the structuring is based around `tap`.

```ruby
class OrganizedStylesheet
  class << self

    def organized_view
      OrganizedView.new.tap do |ov|
        ov.backgroundColor = UIColor.blackColor
      end
    end

    def header
      UIView.new.tap do |v|
        v.frame = [[0, 0], [320, 100]]
        v.backgroundColor = UIColor.purpleColor
      end
    end

    def title
      UILabel.new.tap do |l|
        l.frame = [[20, 25], [280, 50]]
        l.font = UIFont.boldSystemFontOfSize(24)
        l.textAlignment = NSTextAlignmentCenter
        l.textColor = UIColor.whiteColor
        l.text = "Hello World!"
      end
    end

    def button
      UIButton.new.tap do |b|
        b.frame = [[20, 200], [280, 50]]
        b.setTitle("Press Me", forState: UIControlStateNormal)
        b.backgroundColor = UIColor.grayColor
        b.layer.cornerRadius = 5.0
      end
    end

    # style inheritance
    def other_button
      button.tap do |ob|
        ob.frame = [[20, 275], [280, 50]]
        ob.setTitle("Or me", forState: UIControlStateNormal)
      end
    end

  end
end
```

### Delegates

Instead of making our controllers our delegates and filling them up with code that deals with a thousand different things, we create small, testable, delegate classes, and use our controller to set them on a view.

```ruby
class OrganizedViewDelegate

  def buttonPressedForOrganizedView(ov)
    ov.title.text = "Goodbye!"
  end

end
```

```ruby
class OrganizedController < UIViewController
  def init
    super

    self.title = "Organized"

    self.edgesForExtendedLayout = UIRectEdgeNone

    self.view = OrganizedStylesheet.organized_view
    self.view.delegate = OrganizedViewDelegate.new

    self
  end
end
```