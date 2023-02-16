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
  - Title: How to Set Up a Gen3 Data Commons Using Helm Charts
    Date: March 1, 2023; 3:30-5:00 pm CST
    Description:  "We will take you through the current best practices for setting up and configuring your own Gen3 Data Commons in multiple clouds by using Helm Charts.
Helm is a tool that streamlines installing and managing Kubernetes applications, which is a system for automating deployment, scaling, and management of containerized applications. The use of Helm will greatly simplify standing up, configuring, and maintaining your own Gen3 Data Commons.  





This is the first of a series of community events through 2023."
    Image: /figs/gen3_new_logo.png
    HelmzoomLink: https://uchicagomedicine.zoom.us/meeting/register/tJ0tc-qvrDgtG9N0jRgBCCwIpQDzK-0LsX__
    Helmagendalink:  /community/events/gen3forum_20230301

g3Past:
      - Titleold: Gen3 Community Forum 2022
        Dateold: Oct 10-12, 2022 US; Oct 11-13, 2022 AU
        Descriptionold:  "The Gen3 Community Forum consists of those developing and operating Gen3 data commons and data meshes, those considering developing Gen3 data commons and meshes, and other stakeholders involved with the Gen3 community. The four aims of the Forum are: to share knowledge about Gen3, its architecture, and the Gen3 roadmaps and priorities; to strengthen the connection between the Gen3 core team and those developing, operating and using Gen3 platforms; to design a set of ongoing community engagement activities; and to discuss and agree on key shared development priorities between the Gen3 core team and the Gen3 community. The virtual community forum is co-hosted by the University of Chicago and the Australian BioCommons."
        Image_kickoff: /figs/community_forum_2022.png
        Link: https://www.eventbrite.com/e/gen3-community-forum-2022-tickets-384218496867
        LocalLink1old:  https://www.youtube.com/playlist?list=PLZtKC_lqcLhKfSthym1ZKcDKf1n0wLzuH
        LocalLink2old: /community/events/gen3forum_202210_post

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
        <h1>Upcoming Events</h1>
    </div>
</section>

{{< events "g3Upcoming" >}}


<section class="g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-inner-wrapper">
        <h1>Past Events</h1>
    </div>
</section>

{{< events "g3past" >}}
