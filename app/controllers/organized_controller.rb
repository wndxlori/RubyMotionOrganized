class OrganizedController < UIViewController
  def init
    super

    self.view = OrganizedStylesheet.organized_view
    self.view.delegate = OrganizedViewDelegate.new

    self
  end
end