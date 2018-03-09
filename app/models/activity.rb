# == Schema Information
#
# Table name: activities
#
#  id            :integer          not null, primary key
#  activity_type :integer          default("volunteer_activity")
#  title         :string
#  start_time    :datetime
#  end_time      :datetime
#  place         :string
#  content       :string           default("")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Activity < ApplicationRecord
  has_many :joinings
  has_many :people, through: :joinings
  has_many :media, as: :mediable

  enum activity_type: [:volunteer_activity, :bazaar_activity, :other_activity]
end
