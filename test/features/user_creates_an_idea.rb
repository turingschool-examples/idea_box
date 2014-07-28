require_relative "./feature_test_helper"

class UserCreatesAnIdea < FeatureTest
  def test_user_can_visit_index
    visit '/'
    assert_equal 200, page.status_code
    assert page.has_content?('Feeling Inspired?')
    assert page.has_css?('h1#intro-header')
    assert page.has_css?('h4#intro-subheader')
    assert page.has_link?('IdeaBox')
    assert page.has_link?('Dashboard')
    assert page.has_submit_button?('Submit')
  end
end
