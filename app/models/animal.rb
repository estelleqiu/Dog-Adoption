# == Schema Information
#
# Table name: animals
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  animal_type        :integer          default("dog")
#  birth_date         :date
#  gender             :integer
#  variety            :string
#  character          :string
#  photo_url          :string           default("http://p4wgbyuaw.bkt.clouddn.com/default_avatar.jpg")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  slug               :string
#  description        :text
#  is_vaccined        :boolean          default(FALSE)
#  is_sterilizationed :boolean          default(FALSE)
#

class Animal < ApplicationRecord
  has_one :adoption
  has_one :person, through: :adoption

  enum animal_type: [:dog, :cat]
  enum gender: [:male, :female, :unknown]

  validates :slug, uniqueness: true, presence: true
end
