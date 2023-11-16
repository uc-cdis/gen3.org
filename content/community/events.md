---
identifier: events
title: Gen3 - Events
linktitle:
date: 2022-06-22T22:16:21-05:00
g3Teaser:
  fig: /figs/webinar.svg
  title: Gen3 Community Events
  detail: About every other month, there is a virtual Gen3 Forum for the community of Gen3 developers, operators, sponsors and users of Gen3 data platforms. These events aim to share information about how to set up new Gen3 instances, build a community that can help each other, and create clear paths for support from the Gen3 core development team.

g3Upcoming:
- Title: Gen3 Development Roadmap
  Date: January 24, 3:30-5:00 pm CT; January 25, 2023, 8:30-10:00 am AEDT
  Description: We will introduce the 2024 Gen3 Development Roadmap, which will include known sponsor priorities and other products plans.  The first portion of the meeting will include a presentation by Robert Grossman, Director of CTDS.  The second portion will include an organized panel discussion by the steering committee on the relative priorities of the items.  Attendee participation to add new items or to help prioritize existing items is appreciated!
  Image: /figs/gen3_new_logo.png
  Register: https://uchicago.zoom.us/meeting/register/tJUuf-2rrzouGN2C8ty22yKrYrMDHkmKU24c



g3past:


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

<section class="g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-inner-wrapper">
        <h2>Previous 2024 Gen3 Events</h2>
    </div>
</section>

{{< events "g3past" >}}


<section class="g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-inner-wrapper">
        <h2>See Past Gen3 Events</h2>
    </div>
    <div class="g3-inner-wrapper g3-space__margin-sm-top-bottom g3-space__padding-md-left">
        <strong><a href="https://gen3.org/community/events_archived">See Gen3 Events Archive</a></strong>
    </div>
</section>
