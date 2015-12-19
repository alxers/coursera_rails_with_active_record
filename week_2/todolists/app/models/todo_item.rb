class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  has_one :user, through: :todo_lists

  default_scope { order('due_date ASC') }
end
