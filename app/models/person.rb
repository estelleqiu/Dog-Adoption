# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  person_type :integer
#  name        :string
#  gender      :integer
#  phone       :string
#  story       :string
#  password    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Person < ApplicationRecord
  has_many :activities
  has_many :animals

  enum  person_type: [:admin, :edit, :adopter, :sponsor, :volunteer]
end
