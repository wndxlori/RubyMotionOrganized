class OrganizedController < UIViewController
  def init
    super.tap do |oc|
      oc.title = "Organized"

      oc.edgesForExtendedLayout = UIRectEdgeNone

      oc.view = OrganizedStylesheet.organized_view
      oc.view.delegate = self.organized_view_delegate
    end
  end

  def organized_view_delegate
    @organized_view_delegate ||= OrganizedViewDelegate.new
  end
end