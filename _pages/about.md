---
title: "About"
layout: gridlay
sitemap: false
permalink: /about/
---

<style>
.about-profile-links {
  display: inline-flex;
  align-items: center;
  flex-wrap: nowrap;
  gap: 0.25rem;
  white-space: nowrap;
}
.about-profile-links a {
  display: inline-flex;
}
</style>

# About

{% for member in site.data.pi %}

<div class="jumbotron">
<div class="row">
<div class="col-sm-4">
  <img src="{{ site.url }}{{ site.baseurl }}/images/{{ member.photo }}" width="100%" style="max-width:250px"/>
</div>
<div class="col-sm-8 col-xs-12">
  <h3>{{ member.name }}</h3>
  <h4><i>{{ member.info }}</i></h4>
  <span class="about-profile-links">{% if member.email %}<a href="mailto:{{ member.email }}" target="_blank"><i class="fa fa-envelope-square fa-3x"></i></a>{% endif %}{% if member.cv %}<a href="{{ member.cv }}" target="_blank"><i class="ai ai-cv-square ai-3x"></i></a>{% endif %}{% if member.scholar %}<a href="{{ member.scholar }}" target="_blank"><i class="ai ai-google-scholar-square ai-3x"></i></a>{% endif %}{% if member.github %}<a href="{{ member.github }}" target="_blank"><i class="fa fa-github-square fa-3x"></i></a>{% endif %}{% if member.researchgate %}<a href="{{ member.researchgate }}" target="_blank"><i class="ai ai-researchgate-square ai-3x"></i></a>{% endif %}</span>

  <ul style="overflow: hidden">
    {% for education in member.education %}
      <li>{{ education | replace: "-","&#8211;" }}</li>
    {% endfor %}
  </ul>

</div>
</div>
</div>
{% endfor %}

{% if site.data.grants %}

<div class="jumbotron">
  <h3>Grants</h3>
  <ul>
    {% for grant in site.data.grants %}
      <li>{{ grant.name }}</li>
    {% endfor %}
  </ul>
</div>
{% endif %}

{% if site.data.awards %}

<div class="jumbotron">
  <h3>Awards</h3>
  <ul>
    {% for award in site.data.awards %}
      <li>{{ award.name | replace: "-","&#8211;" }}</li>
    {% endfor %}
  </ul>
</div>
{% endif %}
