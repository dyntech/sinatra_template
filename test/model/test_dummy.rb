require_relative '../test_helper'

class TestDummy < Minitest::Test

  def test_it_queries_table
    dummy = Dummy.all
    refute_empty dummy
  end


end

