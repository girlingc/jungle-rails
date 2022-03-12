class Sale < ActiveRecord::Base
  def finished?
  ends_on < Date.current
  end

  def upcoming?
  ends_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end
end
