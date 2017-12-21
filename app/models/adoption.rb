# == Schema Information
#
# Table name: adoptions
#
#  id         :integer          not null, primary key
#  animal_id  :integer
#  person_id  :integer
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_adoptions_on_animal_id  (animal_id)
#  index_adoptions_on_person_id  (person_id)
#

class Adoption < ApplicationRecord
    has_one :animal
    belongs_to :person
end
