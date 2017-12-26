# == Schema Information
#
# Table name: animals
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  animal_type :integer          default(0)
#  year        :integer
#  gender      :integer
#  variety     :string
#  character   :string
#  life_detail :string
#  photo       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
