# == Schema Information
#
# Table name: animals
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  animal_type   :integer          default("dog")
#  birth_date    :date
#  gender        :integer
#  variety       :string
#  character     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :text
#  is_vaccined   :boolean          default(FALSE)
#  is_sterilized :boolean          default(FALSE)
#  size          :string
#

class Animal < ApplicationRecord
  has_one :adoption
  has_one :person, through: :adoption
  has_many :media, as: :mediable

  enum animal_type: [:dog, :cat]
  enum gender: [:male, :female, :unknown]

  accepts_nested_attributes_for :media, allow_destroy: true
end
