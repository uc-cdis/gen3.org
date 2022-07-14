---
identifier: events
title: Gen3 - Events
linktitle:
date: 2022-06-22T22:16:21-05:00
g3Teaser:
  fig: /figs/webinar.svg
  title: Gen3 Community Events
  detail: The Gen3 team at University of Chicago hosts events in partnership with the community of developers, operators, and sponsors of Gen3 data resources that aim to share information about how to set up new commons, build a community that can help each other, and create clear paths for support from the Gen3 team.

g3Upcoming:
  - Title: First Gen3 Community Forum
    Date: Oct 10-12, 2022 US; Oct 11-13, 2022 AUS
    Description:  The Gen3 Community Forum consists of those developing and operating Gen3 data commons and data meshes, and other stakeholders involved with the Gen3 community.  The aims of the launch event are to jump start a community that will: Share information about how to set up and operate a Gen3 data commons; Build a community of Gen3 developers and operators; Engage with the Gen3 core team; Help develop and refine a Gen3 development roadmap. The virtual community forum is co-hosted by the University of Chicago and the Australian BioCommons.
    Image: /figs/gen3_new_logo.png
    Link: https://www.eventbrite.com/e/gen3-community-forum-2022-tickets-367673931627?aff=gen3
    button:
      caption: Data Contribution
      link: /community/events/gen3forum_202210
---

<section class="g3-bg__mint">
  <div class="g3-outer-wrapper g3-flex-content g3-flex-content__reverse">
    <div class="g3-col__65 g3-flex-content g3-mb-space__padding-lg-top g3-space__margin-md-top-bottom">
      <img class="g3-img__full-width" src="{{< param "g3Teaser.fig" >}}"/>
    </div>
    <div class="g3-space__padding-lg-top g3-space__padding-lg-bottom g3-col__35">
      <div class="g3-space__wrapper-gap-left">
        <h1 class="g3-space__margin-sm-bottom">
          {{< param "g3Teaser.title" >}}
        </h1>
        <p class="g3-space__margin-sm-bottom introduction">
          {{< param "g3Teaser.detail" >}}
        </p>
      </div>
    </div>
  </div>
</section>

<section class="g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-inner-wrapper">
        <h2>Upcoming Events</h2>
    </div>
</section>

{{< events "g3Upcoming" >}}
