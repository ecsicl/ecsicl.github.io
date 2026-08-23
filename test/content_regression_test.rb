require "minitest/autorun"
require "yaml"

class ContentRegressionTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)

  def read(path)
    File.read(File.join(ROOT, path))
  end

  def test_about_does_not_repeat_the_student_roster
    about = read("_pages/about.md")

    refute_includes about, "Active Students"
    refute_includes about, "site.data.people"
    refute File.exist?(File.join(ROOT, "_data/people.yml"))
  end

  def test_recent_publications_are_canonical_and_not_duplicated
    publications = read("_pages/publications.md")
    glsvlsi_title = ">Educational Tool-spaces for Convolutional Neural Network FPGA Design Space Exploration Using High-Level Synthesis</a>"

    assert_equal 1, publications.scan(glsvlsi_title).length
    refute_includes publications, "[NSF Award'24]"
    refute_includes publications, "[arXiv'25] Mhaske"
    refute_includes publications, "[arXiv'24] Luo"
    assert_includes publications, "https://doi.org/10.1109/ACDSA67686.2026.11468028"
    assert_includes publications, "pp. 1-6"
    assert_includes publications, "https://doi.org/10.1109/TGRS.2024.3431517"
    assert_includes publications, "vol. 62, pp. 1-14"
  end

  def test_news_leads_with_current_yu_bai_updates
    news = YAML.safe_load(read("_data/news.yml"))

    assert_equal [
      "CSUF Students Use AI to Train a Robotic Dog for Real-World Applications",
      "Engineering Students Earn Top Honors at International Research Competition",
      "Yu Bai Promoted to Professor of Electrical and Computer Engineering"
    ], news.first(3).map { |item| item.fetch("headline") }
  end

  def test_navigation_and_profile_links_are_labeled_correctly
    config = YAML.safe_load(read("_config.yml"))
    funding = config.fetch("nav_pages").find { |page| page["name"] == "fundings" }
    yifeng = YAML.safe_load(read("_data/pi.yml")).find { |member| member["name"] == "Dr. Yifeng Yu" }

    assert_equal "Funding", funding["label"]
    assert_includes read("_includes/header.html"), "page.label | default: page.name | capitalize"
    assert_includes config.fetch("contact"), "ai-google-scholar-square"
    refute_includes config.fetch("contact"), "fa-github"
    assert_includes yifeng.fetch("scholar"), "scholar.google.com"
    refute_equal yifeng.fetch("researchgate"), yifeng.fetch("scholar")
  end

  def test_obvious_public_text_typos_are_fixed
    assert_includes read("_pages/fundings.md"), "# Funding"
    assert_includes read("_pages/fundings.md"), "Binarized Neural Networks"
    assert_includes read("_pages/people.md"), "Tesla Inc."
  end
end
