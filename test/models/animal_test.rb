# == Schema Information
#
# Table name: animals
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  animal_type :integer          default("dog")
#  birth_date  :date
#  gender      :integer
#  variety     :string
#  character   :string
#  life_detail :string
#  photo_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#

require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
