class AddRefsToSeengames < ActiveRecord::Migration
  def change
    add_reference :seengames, :user, index: true, foreign_key: true
    add_reference :seengames, :court, index: true, foreign_key: true
  end
end
