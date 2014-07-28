require_relative "./feature_test_helper"

class UserCreatesAnIdea < FeatureTest
  def test_user_can_create_article
    visit '/'
  end
end
