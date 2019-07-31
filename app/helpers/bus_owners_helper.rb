module BusOwnersHelper
  def experience_in_years(owner)
    "#{owner.experience} years".html_safe
  end
end
