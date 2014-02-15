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