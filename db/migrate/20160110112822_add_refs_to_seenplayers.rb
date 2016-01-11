class AddRefsToSeenplayers < ActiveRecord::Migration
  def change
    add_reference :seenplayers, :user, index: true, foreign_key: true
    add_reference :seenplayers, :court, index: true, foreign_key: true
  end
end
