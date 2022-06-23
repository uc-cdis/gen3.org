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
    Date: Aug 1-3, 2022 US; Aug 2-4, 2022 Australia
    Description: The key goal of this meeting is to kick start the AU/US/NZ international user community, which consists of developers, operators, sponsors, and other stakeholders who want to exchange ideas on the code and shape of Gen3. The virtual community forum is co-hosted by the University of Chicago and the University of Melbourne. The forum will meet for three days, three hours each day, and will include presentations from various Gen3 operators, developers, and breakout sessions to craft ideas for new features.
    Image: coming_soon.svg
    Link: https://www.eventbrite.com/e/gen3-community-forum-2022-tickets-367673931627?aff=gen3
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
