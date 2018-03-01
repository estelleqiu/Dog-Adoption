# == Schema Information
#
# Table name: reports
#
#  id              :integer          not null, primary key
#  title           :string
#  kind            :integer
#  type            :integer
#  quantity        :integer
#  information_url :string
#  benefactor      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Report < ApplicationRecord
end
