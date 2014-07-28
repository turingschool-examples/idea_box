require_relative "./model_test_helper"

class IdeaTest < Minitest::Test
  def attributes
    {
      "id"          => 0,
      "title"       => "bird internet",
      "description" => "lots of tweets",
      "rank"        => 1
    }
  end

  def test_it_creates_an_idea
    idea = Idea.new(attributes)

    assert_equal 0,                idea.id
    assert_equal "bird internet",  idea.title
    assert_equal "lots of tweets", idea.description
    assert_equal 1,                idea.rank
  end

  def test_it_likes_an_idea
    idea = Idea.new(attributes)
    idea.like!

    assert_equal 2, idea.rank
  end
end
