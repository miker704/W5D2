# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT Distinct yr
    FROM Nobels
    WHERE subject= 'Physics'
    AND yr NOT IN
    (
    SELECT yr
    FROM Nobels
     WHERE subject = 'Chemistry'
    )
    
    
  SQL
end
