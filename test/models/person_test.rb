# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  person_type :integer
#  name        :string
#  gender      :integer
#  phone       :string
#  password    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
