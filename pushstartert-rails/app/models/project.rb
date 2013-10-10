class Project < ActiveRecord::Base
  belongs_to :user
  before_save :default_values
  
  def default_values
    self.state ||= 'freezed'
  end

  state_machine initial: :freezed do
    event :unfreeze do
      transition freezed: :unfreezed
    end
    event :freeze do
      transition unfreezed: :freezed
    end

    state :freezed
    state :unfreezed
  end
end
