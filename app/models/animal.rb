# == Schema Information
#
# Table name: animals
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  type        :integer          default(0)
#  year        :integer
#  gender      :integer
#  variety     :string
#  character   :string
#  life_detail :string
#  photo       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Animal < ApplicationRecord
  has_one :adoption
  has_one :person, through: :adoption
end
