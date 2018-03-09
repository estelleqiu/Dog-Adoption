# == Schema Information
#
# Table name: experineces
#
#  id           :integer          not null, primary key
#  title        :string
#  body         :text
#  original_url :string
#  person_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_experineces_on_person_id  (person_id)
#

class Experinece < ApplicationRecord
  belongs_to :person
end
