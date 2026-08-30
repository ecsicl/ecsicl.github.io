require "minitest/autorun"
require "yaml"

class ContentRegressionTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)

  def read(path)
    File.read(File.join(ROOT, path))
  end

  def publications
    YAML.safe_load(read("_data/publications.yml"))
  end

  def publication_entries
    publications.values.flatten
  end

  def test_about_does_not_repeat_the_student_roster
    about = read("_pages/about.md")

    refute_includes about, "Active Students"
    refute_includes about, "site.data.people"
    refute File.exist?(File.join(ROOT, "_data/people.yml"))
  end

  def test_recent_publications_are_canonical_and_not_duplicated
    entries = publication_entries
    titles = entries.filter_map { |entry| entry["title"] }
    serialized = entries.to_s
    glsvlsi_title = "Educational Tool-spaces for Convolutional Neural Network FPGA Design Space Exploration Using High-Level Synthesis"

    assert_equal 1, titles.count(glsvlsi_title)
    refute_includes serialized, "NSF Award'24"
    refute_includes serialized, "arXiv'25"
    refute_includes serialized, "arXiv'24"
    assert_includes serialized, "https://doi.org/10.1109/ACDSA67686.2026.11468028"
    assert_includes serialized, "pp. 1-6"
    assert_includes serialized, "https://doi.org/10.1109/TGRS.2024.3431517"
    assert_includes serialized, "62 (2024): 1-14"
  end

  def test_publications_are_data_driven_and_legacy_entries_are_sourced
    page = read("_pages/publications.md")
    data = publications

    assert_equal %w[book_chapters journal_papers conference_papers project_papers], data.keys
    assert_includes page, "site.data.publications"
    refute_includes page, "• ["
    assert_operator data.fetch("journal_papers").length, :>=, 25
    assert_operator data.fetch("conference_papers").length, :>=, 45

    data.except("project_papers").values.flatten.each do |entry|
      %w[authors title url citation].each { |field| assert entry.fetch(field) }
      if entry["doi"]
        assert_equal "https://doi.org/#{entry.fetch("doi")}", entry.fetch("url")
      end
      if entry["year"] && (2011..2023).cover?(entry.fetch("year"))
        assert_match(%r{\Ahttps://}, entry.fetch("verified_url"), entry.fetch("title"))
      end
    end

    serialized = publication_entries.to_s
    refute_includes serialized, "Twenty Second Annual Hawaii International Conference on Education"
    refute_includes serialized, "Design and Implementation of 32-Channel ADPCM CODEC"
    assert_includes serialized, "10.1007/s00779-019-01278-1"
    refute_includes serialized, "10.1007/s00779-020-01461-9"
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
    service = config.fetch("nav_pages").find { |page| page["name"] == "services" }
    yifeng = YAML.safe_load(read("_data/pi.yml")).find { |member| member["name"] == "Dr. Yifeng Yu" }

    assert_equal "Funding", funding["label"]
    assert_equal "Service", service["label"]
    assert_includes read("_includes/header.html"), "page.label | default: page.name | capitalize"
    assert_includes config.fetch("contact"), "ai-google-scholar-square"
    refute_includes config.fetch("contact"), "fa-github"
    assert_includes yifeng.fetch("scholar"), "scholar.google.com"
    refute_equal yifeng.fetch("researchgate"), yifeng.fetch("scholar")
  end

  def test_obvious_public_text_typos_are_fixed
    assert_includes read("_pages/fundings.md"), "# Funding"
    assert_includes read("_pages/fundings.md"), "Binarized Neural Networks"
    assert_includes read("_data/alumni.yml"), "Tesla Inc."
  end

  def test_people_content_is_data_driven_and_profile_links_are_accessible
    people = read("_pages/people.md")
    profile_links = read("_includes/profile_links.html")
    pi = YAML.safe_load(read("_data/pi.yml"))
    alumni = YAML.safe_load(read("_data/alumni.yml"))
    visitors = YAML.safe_load(read("_data/visiting_members.yml"))

    assert_equal "Professor of Electrical and Computer Engineering, California State University, Fullerton", pi[0].fetch("info")
    assert_equal "Professor of Mathematics, University of California, Irvine", pi[1].fetch("info")
    assert_equal "Giovanni Martinez", alumni.first.fetch("name")
    assert_equal 9, alumni.length
    assert_equal 4, visitors.length
    assert_includes people, "site.data.alumni"
    assert_includes people, "site.data.visiting_members"
    assert_equal 3, people.scan("include profile_links.html").length
    refute_includes people, "ai-google-scholar-square ai-2x"
    assert_includes profile_links, 'rel="noopener noreferrer"'
    assert_includes profile_links, 'aria-label='
    assert_includes profile_links, 'title='
    assert_includes profile_links, 'aria-hidden="true"'
  end

  def test_people_cards_stack_cleanly_on_small_screens
    people = read("_pages/people.md")
    mobile_rules = people[/@media \(max-width: 575px\).*?\n}/m]

    assert_includes mobile_rules, "flex-direction: column"
    assert_includes mobile_rules, "width: 100%"
  end

  def test_student_groups_and_people_labels_are_explicit
    members = YAML.safe_load(read("_data/team_members.yml"))
    abhishek = members.find { |member| member["name"] == "Abhishek Annadurai" }
    students = members.reject { |member| member["name"] == "Welcome to join our team!" }
    people = read("_pages/people.md")

    assert_equal "Research Assistant", abhishek.fetch("info")
    assert_equal "ms", abhishek.fetch("group")
    assert students.all? { |member| %w[phd ms].include?(member["group"]) }
    assert_includes people, 'member.group == "phd"'
    assert_includes people, 'member.group == "ms"'
    assert_includes people, "M.S. Students"
    assert_includes people, "Research Interests:"
    refute_includes people, "Master Students"
    refute_includes people, "<strong>Research Interest:</strong>"
  end

  def test_publication_citations_do_not_expose_draft_metadata
    publications = read("_data/publications.yml")
    broken_fragments = [
      "Bio-metrics", "Op- timization", "Spin- Orbit", "Comput-ing",
      "Ac- celeration", "Asyn- chronous", "Hyper- spectral", "De- composition",
      "Proceed- ings", "Educa- tion", "Hard- ware", "Architec- tures",
      "Aca- demic", "Kurwad- kar", "Proceedingsof", "Com- munication",
      "Net- work", "con- vention", "Field- Programmable", "Liv- erpool",
      "Interna- tional", "par- allelism", "reconfig- urable", "Sympo- sium"
    ]

    refute_match(/\bIF\s*=/i, publications)
    refute_match(/Impact Factor/i, publications)
    refute_match(/Acceptance rate/i, publications)
    refute_includes publications, "Accepted(?)"
    refute_includes publications, "27rd"
    refute_includes publications, "26rd"
    refute_includes publications, "DOI="
    refute_includes publications, "doi>"
    refute_includes publications, "10.1109/ CCWC"
    refute_includes publications, "10.1109/FCCM.2013. 39"
    broken_fragments.each { |fragment| refute_includes publications, fragment }
    assert_equal 1, publications.scan("Multi-object tracking by mutual supervision of CNN and particle filter").length
  end

  def test_professional_service_is_current_and_concise
    services = read("_pages/services.md")

    assert_includes services, 'title: "Professional Service"'
    assert_includes services, "# Professional Service"
    assert_includes services, "IIKI 2024"
    assert_includes services, "ISQED 2023"
    assert_includes services, "DAC), 2021-2022"
    refute_includes services, "Invited Reviewer"
    refute_match(/\bIF\s*=/i, services)
  end

  def test_footer_remains_uci_only
    config = YAML.safe_load(read("_config.yml"))
    footer = "#{config.fetch("affiliation")} #{config.fetch("location")}"

    assert_includes footer, "University of California, Irvine"
    refute_includes footer, "California State University, Fullerton"
  end
end
