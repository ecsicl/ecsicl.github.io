---
title: "Team"
layout: gridlay
sitemap: false
permalink: /team/
---

<style>
.team-student-photo {
  width: 150px;
  height: 150px;
  max-width: 150px;
  object-fit: cover;
  display: block;
}
.team-member-row {
  margin-bottom: 2.25rem;
}
.team-inline-links {
  display: inline-block;
  margin-left: 0.45rem;
  vertical-align: middle;
}
.team-inline-links a {
  display: inline-block;
  margin: 0 0.12rem;
}
.team-affiliation-logo {
  float: right;
  width: 72px;
  height: 72px;
  object-fit: contain;
  margin-left: 1rem;
}
.team-affiliation-badge {
  float: right;
  width: 118px;
  min-height: 72px;
  margin-left: 1rem;
  border: 1px solid #f08a24;
  border-radius: 6px;
  background: #fff8ef;
  color: #00244e;
  text-align: center;
  padding: 0.55rem 0.5rem;
  line-height: 1.15;
  box-sizing: border-box;
}
.team-affiliation-badge::before {
  content: "CSUF";
  display: block;
  font-size: 1.2rem;
  font-weight: 700;
  letter-spacing: 0;
}
.team-affiliation-badge::after {
  content: "Cal State Fullerton";
  display: block;
  margin-top: 0.15rem;
  font-size: 0.76rem;
  color: #7a4a14;
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
</style>

# Team

**We are looking for new team members** [see openings](https://mp.weixin.qq.com/s?__biz=Mzg4NjAzNjA2MQ==&mid=2247483797&idx=1&sn=21ec18f61d2146a31bc9d34dec094fef&chksm=cf9e82a7f8e90bb1c2b906e3cc02fe49e3fcf176863b0d4237ff2d76e2f288e31969313f4f56&token=2133957464&lang=zh_CN#rd) **!**


{% for member in site.data.pi %}

<div class="jumbotron">
<div class="row">
<div class="col-sm-2">
  <img src="{{ site.url }}{{ site.baseurl }}/images/{{ member.photo }}" width="100%" style="max-width:250px"/>
</div>
<div class="col-sm-9 col-xs-12">
<h4>{{ member.name }}{% if member.scholar or member.researchgate or member.email or member.cv or member.github %}<span class="team-inline-links">{% if member.scholar %}<a href="{{ member.scholar }}" target="_blank"><i class="ai ai-google-scholar-square ai-2x"></i></a>{% endif %}{% if member.researchgate %}<a href="{{ member.researchgate }}" target="_blank"><i class="ai ai-researchgate-square ai-2x"></i></a>{% endif %}{% if member.email %}<a href="mailto:{{ member.email }}" target="_blank"><i class="fa fa-envelope-square fa-2x"></i></a>{% endif %}{% if member.cv %}<a href="{{ member.cv }}" target="_blank"><i class="ai ai-cv-square ai-2x"></i></a>{% endif %}{% if member.github %}<a href="{{ member.github }}" target="_blank"><i class="fa fa-github-square fa-2x"></i></a>{% endif %}</span>{% endif %}</h4>
<i>{{ member.info }}</i><br>

<ul style="overflow: hidden">
<li> {{ member.education[0] }} </li>
<li> {{ member.education[1] }} </li>
</ul>
</div>
</div>
</div>

{% endfor %}

## Current Students

<div class='jumbotron'>
{% for member in site.data.team_members %}

<div class="row team-member-row">

<div class="col-sm-2">
<img class="team-student-photo" src="{{ site.url }}{{ site.baseurl }}/images/{{ member.photo }}" alt="{{ member.name }}"/>
</div>
<div class="col-sm-10 col-xs-12">
  {% if member.affiliation_logo %}<img class="team-affiliation-logo" src="{{ site.url }}{{ site.baseurl }}/images/{{ member.affiliation_logo }}" alt="Affiliation logo"/>{% endif %}
{% if member.affiliation_badge == "csuf" %}
<div class="team-affiliation-badge" aria-label="California State University, Fullerton"></div>
{% endif %}
  <h4>{{ member.name }}{% if member.scholar or member.researchgate or member.email or member.cv or member.github %}<span class="team-inline-links">{% if member.scholar %}<a href="{{ member.scholar }}" target="_blank"><i class="ai ai-google-scholar-square ai-2x"></i></a>{% endif %}{% if member.researchgate %}<a href="{{ member.researchgate }}" target="_blank"><i class="ai ai-researchgate-square ai-2x"></i></a>{% endif %}{% if member.email %}<a href="mailto:{{ member.email }}" target="_blank"><i class="fa fa-envelope-square fa-2x"></i></a>{% endif %}{% if member.cv %}<a href="{{ member.cv }}" target="_blank"><i class="ai ai-cv-square ai-2x"></i></a>{% endif %}{% if member.github %}<a href="{{ member.github }}" target="_blank"><i class="fa fa-github-square fa-2x"></i></a>{% endif %}</span>{% endif %}</h4>
  <i>{{ member.info }}<br></i>
  {% if member.education %}
  <ul class="team-member-education">
  {% for education in member.education %}
    <li>{{ education }}</li>
  {% endfor %}
  </ul>
  {% endif %}

</div>
</div>

{% endfor %}
</div>

## Lab Alumni

<br>

Giovanni Martinez, Electrical & Electronics Engineer at Raytheon, Tucson, Arizona, USA.

Jiaqi Tang, Software Engineer at Pac-dent, Brea, CA, USA.

Xiaotian Ma, IT Specialist at Pac-dent, Brea, CA, USA.

Simon Yang, Manager at Ecotron, Whittier, CA, USA.

Payal Borulkar, Senior Engineer at Google, Mountain View, CA, USA.

Ashkan Samiee, Senior Engineer at Telsa Inc., CA, USA.

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
