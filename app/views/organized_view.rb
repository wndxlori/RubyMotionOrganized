class OrganizedView < UIScrollView

  # using UIScrollView to fix navigation bar overlap problem
  # http://blog.motioninmotion.tv/fixing-the-ios-7-navigation-bar-overlap-problem

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
