# frozen_string_literal: true

class Thing < ActiveRecord::Base
  include RescueUniqueConstraint

  rescue_unique_constraint index: 'idx_things_on_name_unique', field: 'name'
  rescue_unique_constraint index: 'idx_things_on_code_and_score_unique', field: 'score'
end
