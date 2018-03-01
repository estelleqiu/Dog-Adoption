# == Schema Information
#
# Table name: fee_reports
#
#  id              :integer          not null, primary key
#  item_name       :string
#  item_kind       :integer
#  fee_type        :integer
#  quantity        :integer
#  information_url :string
#  director        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class FeeReport < ApplicationRecord
end
