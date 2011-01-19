require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  subject { Factory(:photo) }
  should validate_uniqueness_of(:title)
  should validate_presence_of(:description)
  should validate_presence_of(:title)
  should validate_presence_of(:date)
  should validate_presence_of(:path)
end
