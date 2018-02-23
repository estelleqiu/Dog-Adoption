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
#

class Animal < ApplicationRecord
  has_one :adoption
  has_one :person, through: :adoption

  enum animal_type: [:dog, :cat]
  enum gender: [:male, :female, :unknown]
end
