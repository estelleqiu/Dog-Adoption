# == Schema Information
#
# Table name: joinings
#
#  id          :integer          not null, primary key
#  activity_id :integer
#  person_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_joinings_on_activity_id  (activity_id)
#  index_joinings_on_person_id    (person_id)
#

require 'test_helper'

class JoiningTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
