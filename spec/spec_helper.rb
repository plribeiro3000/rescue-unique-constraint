# frozen_string_literal: true

require 'rspec'
require 'jazz_fingers'

RSpec.configure do |config|
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before do
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
    ActiveRecord::Schema.verbose = false

    ActiveRecord::Schema.define(version: 1) do
      create_table :things do |t|
        t.string :name
        t.integer :code
        t.integer :score
      end

      add_index :things, :name, unique: true, name: 'idx_things_on_name_unique'
      add_index :things, %i[code score], unique: true, name: 'idx_things_on_code_and_score_unique'
    end
  end
end

JazzFingers.configure do |config|
  config.colored_prompt = false
  config.amazing_print = false
  config.coolline = false
end

require File.expand_path('lib/rescue_unique_constraint-p')
require File.expand_path('spec/fake_app/thing')
