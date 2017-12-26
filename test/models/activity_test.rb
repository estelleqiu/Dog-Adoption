# == Schema Information
#
# Table name: activities
#
#  id            :integer          not null, primary key
#  activity_type :integer          default(0)
#  title         :string
#  time          :datetime
#  place         :string
#  content       :string           default("")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
