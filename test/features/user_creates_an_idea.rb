require_relative "./feature_test_helper"

class UserCreatesAnIdea < FeatureTest
  def teardown
    File.delete(File.expand_path("~/Dropbox/projects/tutorials/idea_box/db/ideabox"))
    super
  end

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

  def test_user_can_create_idea
    # Capybara.current_driver = :selenium

    visit '/'
    assert page.has_field?('Title')
    assert page.has_field?('Description')
    fill_in('Title',       with: 'One great title')
    fill_in('Description', with: 'One great description')
    click_button('Submit')

    assert page.has_content?('One great title')
    assert page.has_content?('One great description')
  end
end
