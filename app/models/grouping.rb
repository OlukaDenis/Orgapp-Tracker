# frozen_string_literal: true

class Grouping < ApplicationRecord
  belongs_to :project
  belongs_to :group
end
