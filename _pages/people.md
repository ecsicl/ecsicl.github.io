---
title: "People"
layout: gridlay
sitemap: false
permalink: /people/
---

<style>
.team-student-photo {
  width: 144px;
  height: 144px;
  max-width: 144px;
  object-fit: cover;
  display: block;
}
.team-member-photo-frame {
  width: 144px;
  height: 144px;
  overflow: hidden;
  border-radius: 6px;
}
.team-student-photo--tight {
  transform: scale(1.1);
}
.team-profile-grid,
.team-student-grid {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 1.1rem;
  margin-bottom: 2rem;
}
.team-member-cell {
  min-width: 0;
}
.team-member-row {
  display: flex;
  align-items: flex-start;
  height: 100%;
  padding: 1.1rem;
  background: #fff;
  border: 1px solid #dfe4e8;
  border-radius: 8px;
  box-shadow: 0 5px 16px rgba(31, 42, 51, 0.07);
}
.team-member-row h4 {
  margin: 0 0 0.35rem;
  line-height: 1.25;
}
.team-member-photo-col p {
  margin: 0;
}
.team-inline-links {
  display: inline-flex;
  flex-wrap: wrap;
  gap: 0.18rem;
  margin-left: 0.45rem;
  vertical-align: middle;
}
.team-inline-links a {
  display: inline-block;
}
.team-student-section-title {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 0.55rem;
  margin: 0.25rem 0 1.2rem;
  font-size: 1.25rem;
}
.team-section-logo {
  width: 52px;
  height: 52px;
  object-fit: contain;
}
.team-member-education {
  font-size: 0.92rem;
  line-height: 1.4;
  margin: 0.35rem 0 0;
  padding-left: 1.2rem;
}
.team-member-education li {
  margin-bottom: 0.15rem;
}
.team-research-interest {
  font-size: 0.92rem;
  margin: 0.35rem 0 0;
}
.team-member-photo-col {
  flex: 0 0 156px;
}
.team-member-info-col {
  flex: 1;
  min-width: 0;
  overflow-wrap: anywhere;
}
.team-pi-photo {
  width: 160px;
  height: 160px;
  max-width: 160px;
  object-fit: cover;
  display: block;
  border-radius: 6px;
}
.team-pi-photo-col {
  flex: 0 0 172px;
}
@media (max-width: 991px) {
  .team-profile-grid,
  .team-student-grid {
    grid-template-columns: 1fr;
  }
}
@media (max-width: 575px) {
  .team-member-row {
    padding: 0.85rem;
  }
  .team-student-photo {
    width: 128px;
    height: 128px;
    max-width: 128px;
  }
  .team-member-photo-frame {
    width: 128px;
    height: 128px;
  }
  .team-member-photo-col {
    flex-basis: 140px;
  }
  .team-pi-photo {
    width: 144px;
    height: 144px;
    max-width: 144px;
  }
  .team-pi-photo-col {
    flex-basis: 156px;
  }
}
</style>

# People

**We are looking for new team members** [see openings](https://mp.weixin.qq.com/s?__biz=Mzg4NjAzNjA2MQ==&mid=2247483797&idx=1&sn=21ec18f61d2146a31bc9d34dec094fef&chksm=cf9e82a7f8e90bb1c2b906e3cc02fe49e3fcf176863b0d4237ff2d76e2f288e31969313f4f56&token=2133957464&lang=zh_CN#rd) **!**

## Principal Investigators

<div class="team-profile-grid team-pi-grid">
{% for member in site.data.pi %}

<div class="team-member-cell">
<div class="team-member-row team-pi-card">
<div class="team-pi-photo-col">
  <img class="team-pi-photo" src="{{ site.url }}{{ site.baseurl }}/images/{{ member.photo }}" alt="{{ member.name }}"/>
</div>
<div class="team-member-info-col">
<h4>{{ member.name }}{% if member.scholar or member.researchgate or member.email or member.cv or member.github %}<span class="team-inline-links">{% if member.scholar %}<a href="{{ member.scholar }}" target="_blank"><i class="ai ai-google-scholar-square ai-2x"></i></a>{% endif %}{% if member.researchgate %}<a href="{{ member.researchgate }}" target="_blank"><i class="ai ai-researchgate-square ai-2x"></i></a>{% endif %}{% if member.email %}<a href="mailto:{{ member.email }}" target="_blank"><i class="fa fa-envelope-square fa-2x"></i></a>{% endif %}{% if member.cv %}<a href="{{ member.cv }}" target="_blank"><i class="ai ai-cv-square ai-2x"></i></a>{% endif %}{% if member.github %}<a href="{{ member.github }}" target="_blank"><i class="fa fa-github-square fa-2x"></i></a>{% endif %}</span>{% endif %}</h4>
<i>{{ member.info }}</i><br>

<ul class="team-member-education">
<li> {{ member.education[0] }} </li>
<li> {{ member.education[1] }} </li>
</ul>
</div>
</div>
</div>

{% endfor %}
</div>

## Current Students

<h3 class="team-student-section-title">Ph.D. Students <img class="team-section-logo" src="{{ site.url }}{{ site.baseurl }}/images/uci.jpg" alt="UC Irvine logo"/></h3>
<div class="team-student-grid team-phd-grid">
{% for member in site.data.team_members %}
{% if member.info contains "Ph.D." %}

<div class="team-member-cell">
<div class="team-member-row">

<div class="team-member-photo-col">
<div class="team-member-photo-frame">
<img class="team-student-photo{% if member.photo_crop %} team-student-photo--{{ member.photo_crop }}{% endif %}" src="{{ site.url }}{{ site.baseurl }}/images/{{ member.photo }}" alt="{{ member.name }}"/>
</div>
</div>
<div class="team-member-info-col">
  <h4>{{ member.name }}{% if member.scholar or member.researchgate or member.email or member.cv or member.github %}<span class="team-inline-links">{% if member.scholar %}<a href="{{ member.scholar }}" target="_blank"><i class="ai ai-google-scholar-square ai-2x"></i></a>{% endif %}{% if member.researchgate %}<a href="{{ member.researchgate }}" target="_blank"><i class="ai ai-researchgate-square ai-2x"></i></a>{% endif %}{% if member.email %}<a href="mailto:{{ member.email }}" target="_blank"><i class="fa fa-envelope-square fa-2x"></i></a>{% endif %}{% if member.cv %}<a href="{{ member.cv }}" target="_blank"><i class="ai ai-cv-square ai-2x"></i></a>{% endif %}{% if member.github %}<a href="{{ member.github }}" target="_blank"><i class="fa fa-github-square fa-2x"></i></a>{% endif %}</span>{% endif %}</h4>
  <i>{{ member.info }}<br></i>
  {% if member.education %}
  <ul class="team-member-education">
  {% for education in member.education %}
    <li>{{ education }}</li>
  {% endfor %}
  </ul>
  {% endif %}
  {% if member.research_interests %}
  <p class="team-research-interest"><strong>Research Interest:</strong> {{ member.research_interests }}</p>
  {% endif %}

</div>
</div>
</div>

{% endif %}
{% endfor %}
</div>

<h3 class="team-student-section-title">Master Students <img class="team-section-logo" src="{{ site.url }}{{ site.baseurl }}/images/csuf.jpg" alt="Cal State Fullerton logo"/></h3>
<div class="team-student-grid team-master-grid">
{% for member in site.data.team_members %}
{% if member.info contains "M.S." %}

<div class="team-member-cell">
<div class="team-member-row">

<div class="team-member-photo-col">
<div class="team-member-photo-frame">
<img class="team-student-photo{% if member.photo_crop %} team-student-photo--{{ member.photo_crop }}{% endif %}" src="{{ site.url }}{{ site.baseurl }}/images/{{ member.photo }}" alt="{{ member.name }}"/>
</div>
</div>
<div class="team-member-info-col">
  <h4>{{ member.name }}{% if member.scholar or member.researchgate or member.email or member.cv or member.github %}<span class="team-inline-links">{% if member.scholar %}<a href="{{ member.scholar }}" target="_blank"><i class="ai ai-google-scholar-square ai-2x"></i></a>{% endif %}{% if member.researchgate %}<a href="{{ member.researchgate }}" target="_blank"><i class="ai ai-researchgate-square ai-2x"></i></a>{% endif %}{% if member.email %}<a href="mailto:{{ member.email }}" target="_blank"><i class="fa fa-envelope-square fa-2x"></i></a>{% endif %}{% if member.cv %}<a href="{{ member.cv }}" target="_blank"><i class="ai ai-cv-square ai-2x"></i></a>{% endif %}{% if member.github %}<a href="{{ member.github }}" target="_blank"><i class="fa fa-github-square fa-2x"></i></a>{% endif %}</span>{% endif %}</h4>
  <i>{{ member.info }}<br></i>
  {% if member.education %}
  <ul class="team-member-education">
  {% for education in member.education %}
    <li>{{ education }}</li>
  {% endfor %}
  </ul>
  {% endif %}
  {% if member.research_interests %}
  <p class="team-research-interest"><strong>Research Interest:</strong> {{ member.research_interests }}</p>
  {% endif %}

</div>
</div>
</div>

{% endif %}
{% endfor %}
</div>

## Lab Alumni

<br>

Giovanni Martinez, Electrical & Electronics Engineer at Raytheon, Tucson, Arizona, USA.

Jiaqi Tang, Software Engineer at Pac-dent, Brea, CA, USA.

Xiaotian Ma, Database Administrator at Pac-dent, Brea, CA, USA.

Simon Yang, Manager at Ecotron, Whittier, CA, USA.

Payal Borulkar, Senior Engineer at Google, Mountain View, CA, USA.

Ashkan Samiee, Senior Engineer at Tesla Inc., CA, USA.

John Gawlik, Scientist at Department of Defense (DOD) Research Lab, USA.

Azadeh Famili, Currently Ph.D. Candidate at Clemson University, SC, USA.

Jonathan Schinowsky, Engineer at Department of Defense (DOD) Research Lab, USA. 

<br>
## Visiting Lab Member

<br>

Yuga Ono, SoftBank Group

Carlye Favella, Golden West College

Aimee Guzman, Santa Ana College

Maria Moreno Lopez, Santiago Canyon College
