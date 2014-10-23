class Todo < ActiveRecord::Base
  belongs_to :user

  scope :complete, -> { where(completed: true)}
  scope :incomplete, -> { where("completed IS NULL OR completed = ?", false) }

end
