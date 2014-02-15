class OrganizedStylesheet
  class << self

    def organized_view
      OrganizedView.new.tap do |ov|
        ov.backgroundColor = UIColor.redColor
      end
    end

    def header
      UIView.new.tap do |v|
        v.frame = [[0, 0], [320, 100]]
        v.backgroundColor = UIColor.blueColor
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
        b.backgroundColor = UIColor.greenColor
        b.layer.cornerRadius = 5.0
      end
    end

  end
end