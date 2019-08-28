module BusOwnersHelper
  def experience_in_years(owner)
    "#{owner.experience} years".html_safe
  end


  def   action_on_owner(owner)

    case owner.status
    when "approved"
      ["#{link_to t('.suspend', :default => t('helpers.links.suspend')),
                       suspend_admin_bus_owner_path(owner), :class => 'btn btn-warning btn-xs'}"]
    when "Approval_Pending"
      ["#{link_to t('.approve', :default => t('helpers.links.approve')),
                         approve_admin_bus_owner_path(owner), :class => 'btn btn-success btn-xs'}"]

     when "suspended"
      ["#{link_to t('.approve', :default => t('helpers.links.approve')),
                             approve_admin_bus_owner_path(owner), :class => 'btn btn-success btn-xs'}"]
      end
  end




end







