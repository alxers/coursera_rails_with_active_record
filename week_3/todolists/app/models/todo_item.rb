class TodoItem < ActiveRecord::Base
  def self.items_count
    where(completed: true).count
  end
end
