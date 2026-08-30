---
title: "publications"
layout: gridlay
sitemap: false
permalink: /publications/
---

<style>
.publication-content {
  font-size: 1rem;
  line-height: 1.6;
}
.publication-list {
  margin-bottom: 2.25rem;
}
.publication-entry {
  margin: 0 0 1.1rem;
  overflow-wrap: anywhere;
  padding-left: 1.1rem;
  position: relative;
}
.publication-entry::before {
  content: "\2022";
  left: 0;
  position: absolute;
}
.publication-entry a:focus-visible,
.project-paper-list a:focus-visible {
  outline: 2px solid #145da0;
  outline-offset: 2px;
}
.publication-entry a,
.project-paper-list a {
  overflow-wrap: anywhere;
}
.project-paper-list {
  line-height: 1.8;
  padding-left: 1.25rem;
}
</style>

# Full List of Publications

<div class="jumbotron">
<div class="col-md-12 col-sm-12 publication-content">

<h2>Book Chapters</h2>
{% include publication_list.html entries=site.data.publications.book_chapters %}

<h2>Journal Papers</h2>
{% include publication_list.html entries=site.data.publications.journal_papers %}

<h2>Conference Papers</h2>
{% include publication_list.html entries=site.data.publications.conference_papers %}

<h2>Papers</h2>
<ul class="project-paper-list">
{% for paper in site.data.publications.project_papers %}
  <li><a href="{{ site.url }}{{ site.baseurl }}/papers/{{ paper.file | uri_escape }}" target="_blank" rel="noopener noreferrer" title="Open {{ paper.title }}" aria-label="Open {{ paper.title }} PDF">{{ paper.title }}</a></li>
{% endfor %}
</ul>

</div>
</div>
