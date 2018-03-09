# == Schema Information
#
# Table name: experineces
#
#  id           :integer          not null, primary key
#  title        :string
#  body         :text
#  original_url :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Experinece < ApplicationRecord
  belongs_to :person
end
