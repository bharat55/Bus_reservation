module BusOwnersHelper
  def experience_in_years(owner)
    "#{owner.experience} years".html_safe
  end


  def action_on_owner(owner)

    case owner.status
    when "approve"
      ["#{link_to t('.disapprove', :default => t('helpers.links.disapprove')),
                      disapprove_owner_path(owner), :class => 'btn btn-danger btn-xs'}","#{
        link_to t('.suspend', :default => t('helpers.links.suspend')),
                      suspend_owner_path(owner), :class => 'btn btn-warning btn-xs'}"]
    when "disapprove"
      ["#{link_to t('.approve', :default => t('helpers.links.approve')),
                            approve_owner_path(owner), :class => 'btn btn-success btn-xs'}"]

     when "suspend"
      ["#{link_to t('.approve', :default => t('helpers.links.approve')),
                            approve_owner_path(owner), :class => 'btn btn-success btn-xs'}"]
      end
  end




end







