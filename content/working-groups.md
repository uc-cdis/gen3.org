---
identifier: working-groups
title: Working Groups
linktitle: working-groups
date: 2024-10-14
g3Teaser:
  title: Gen3 Working Groups
  fig: /figs/grafana_screenshot.png
  detail: The Gen3 community periodically creates working groups to tackle strategic topics. These are typically temporary in nature and are catalyzed around a specific idea or feature that will come to a natural end. They are generally focused on topics of interest to the community, but that are not necessarily on the CTDS roadmap.  Such features can benefit from community input for both requirements and execution. Participation is open to the community. Let's all collaborate to bring improvements to Gen3!
  title1: CSOC Working Group
  detail1: The Gen3 CSOC Working group will focus on topics and Gen3 improvements to benefit those organizations managing multiple Gen3 systems. A commons services operations center (CSOC) is used by organizations that run more than one Gen3 system. A CSOC allows a team of engineering and security staff to set up, configure, secure, operate, and monitor two or more data commons or data meshes.  Part of the working group focus will be on the development of dashboards and tools that will enable an administrator to configure, launch, and monitor a data commons or mesh. We will also discuss and work on other improvements and topics of interest to multi-Gen3 organizations.
  detail4: Projects completed by the working group will be merged into the Gen3 source code and made available to the community.  As the Gen3 maintainer, CTDS will manage the working group, contribute code, and provide guidance to others on contributing to the Gen3 source code.  Other participants will help provide requirements and also contribute code to Gen3.
  detail2: Contact support@gen3.org for an invite to the slack channel and zoom meeting. We meet most months.  Agenda and minutes can be found in the Gen3 Community GitHub Repo (https://github.com/uc-cdis/gen3-community).
  title2: Member Institutions
---

<section class="g3-bg__mint">
  <div class="g3-outer-wrapper g3-flex-content">
    <div class="g3-space__padding-lg-top g3-space__padding-lg-bottom">
      <div class="g3-space__wrapper-gap-left g3-space__wrapper-gap-right">
        <h1 class="g3-space__margin-sm-bottom">
          {{< param "g3Teaser.title" >}}
        </h1>
        <p class="g3-space__margin-sm-bottom introduction">
          {{< param "g3Teaser.detail" >}}
        </p>
        <p class="g3-space__margin-sm-bottom introduction">
          Details for each working group can be found below and in the <a href="https://github.com/uc-cdis/gen3-community">Gen3 Community GitHub Repo.</a>
        </p>
    </div>
  </div>
</section>


<section class="g3-bg__white">
  <div class="g3-outer-wrapper g3-flex-content g3-flex-content__reverse">
    <div class="g3-col__50 g3-flex-content_align-self-flex-end g3-space__margin-sm-top-bottom g3-space__wrapper-gap-right" style="padding-top: 175px;">
      <a>
        <img class="g3-img__bottom_pad" src="{{< param "g3Teaser.fig" >}}">
      </a>
    </div>
    <div class="g3-space__padding-lg-top g3-space__wrapper-gap-right g3-col__45" style="padding-bottom: 0px" >
      <div class="g3-space__wrapper-gap-left">
        <h1 class="g3-space__margin-sm-bottom">
          {{< param "g3Teaser.title1" >}}
        </h1>
        <p class="g3-space__margin-sm-bottom introduction">
          {{< param "g3Teaser.detail1" >}}
          <br>
          <br>
          {{< param "g3Teaser.detail4" >}}
          <br>
        </p>
        <p class="g3-space__margin-sm-bottom introduction">
          Contact support@gen3.org for an invite to the slack channel and monthly zoom meeting. Agenda and minutes can be found in the <a href="https://github.com/uc-cdis/gen3-community">Gen3 Community GitHub Repo</a>
        </p>
      </div>
    </div>
  </div>
</section>

<section class="g3-bg__white">
  <div class="g3-outer-wrapper g3-flex-content">
    <div class="g3-space__padding-md-bottom"  style="padding-top: 0px;">
      <div class="g3-space__wrapper-gap-left">
        <h2 class="g3-space__margin-sm-bottom">
          {{< param "g3Teaser.title2" >}}
        </h2>
        <ul style="font-size: 18px;">
          <li>Center for Translational Data Science, University of Chicago</li>
          <li>Australian Biocommons</li>
          <li>Indiana University</li>
          <li>New Zealand eScience Infrastructure</li>
          <li>Open Commons Consortium</li>
          <li>Oregon Health and Science University</li>
        </ul>
      </div>
    </div>
  </div>
</section>
