---
identifier: events
title: Gen3 - Events
linktitle:
date: 2022-06-22T22:16:21-05:00
g3Teaser:
  fig: /figs/webinar.svg
  title: Gen3 Community Events
  detail: The Gen3 team at University of Chicago hosts events in partnership with the community of developers, operators, and sponsors of Gen3 data resources. These events aim to share information about how to set up new Gen3 instances, build a community that can help each other, and create clear paths for support from the Gen3 team.

g3Upcoming:
  - Title: Gen3 Community Forum 2022
    Date: Oct 10-12, 2022 US; Oct 11-13, 2022 AU
    Description:  "The Gen3 Community Forum consists of those developing and operating Gen3 data commons and data meshes, those considering developing Gen3 data commons and meshes, and other stakeholders involved with the Gen3 community. The four aims of the Forum are: to share knowledge about Gen3, its architecture, and the Gen3 roadmaps and priorities; to strengthen the connection between the Gen3 core team and those developing, operating and using Gen3 platforms; to design a set of ongoing community engagement activities; and to discuss and agree on key shared development priorities between the Gen3 core team and the Gen3 community. The virtual community forum is co-hosted by the University of Chicago and the Australian BioCommons."
    Image: /figs/gen3_new_logo.png
    Link: https://www.eventbrite.com/e/gen3-community-forum-2022-tickets-384218496867
    LocalLink:  /community/events/gen3forum_202210
    LocalLink2: /community/events/Gen3workshop

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
