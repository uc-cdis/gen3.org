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
- Title: Data submission - Perspectives and solutions from different Gen3 systems
  Date: July 10, 3:30-5:00 pm CDT; July 11, 2024, 6:30-8:00am am AEST
  Description: Gen3 data submission can be complex and will vary from project to project.  The specifics will depend on the data model, data type, use of graph-model and/or metadata service, centrally managed vs user driven, and other project-specific requirements.  At this event we will hear from a range of Gen3 operators on how their projects approach the topic of data submission and how they have managed this process.  
  Image: /figs/canine_data_commons.png
  Register2: https://uchicago.zoom.us/meeting/register/tJEtf-2hrjstHd0Cm4AxnXzEpm3rOoykS1LJ
  Agenda3: /community/events/gen3forum_20240710



g3past:
- Title: Gen3.2 - How to build a Gen3 data portal using the new frontend framework
  Date: May 1, 3:30-5:00 pm CDT; May 2, 2024, 6:30-8:00am am AEST
  Description: Gen3 has released a new frontend for the data portal. In this month's forum, we will walk you through the new features and capabilities and demonstrate how to configure the new frontend.  The first portion of the meeting will be led by CTDS Frontend and Visualization Manager, Craig Barnes.  Later we will hear from a team of Gen3 operators at the Oregon Health & Science University where they will share their experience of using the updated frontend.
  Youtube: 6dcEUmhB1kk
  Slides: Gen3 Forum May 2024 - Gen3.2.pdf
- Title: How to contribute to the Gen3 source code
  Date: March 20, 3:30-5:00 pm CDT; March 21, 2024, 7:30-9:00 am AEDT
  Description: Gen3 is an open-source project and benefits from active community contributions.  In this month's forum we will share an updated process for submitting external contributions to the Gen3 source code.  By following these guidelines developers will be able to understand submission requirements and it will enable the maintaining organization to efficiently review proposed contributions.
  Youtube: St04iaglLck
  Slides: Gen3 Forum March 2024 - Gen3 Open Source.pdf
- Title: Gen3 Development Roadmap
  Date: January 24, 3:30-5:00 pm CT; January 25, 2024, 8:30-10:00 am AEDT
  Description: We will introduce the 2024 Gen3 Development Roadmap, which will include known current priorities.  The first portion of the meeting will include a presentation by Robert Grossman, Director of CTDS.  The second portion will include an organized panel discussion by the Gen3 steering committee on the roadmap.  Please attend to provide your feedback and help prioritize roadmap items.
  Youtube: RWcB1hLPJfA
  Slides: Gen3 Forum Jan 24 2024 - Gen3 Roadmap.pdf
- Title: Gen3 Frontend Framework
  Date: November 1, 2023, 3:30-5:00 pm CDT; November 2, 2023, 7:30-9:00 am AEDT
  Description: We will introduce the soon-to-be-released Gen3 Frontend Framework, which is a replacement for the current Data Portal.  Improvements to the frontend will include simplifying the creation of custom content and integration of 3rd party apps as well as improving upon the performance, deployment, and maintenance of the existing system.  Craig Barnes, CTDS Visualization Manager, will speak about the upcoming release.
  Youtube: 1zJfHCr4_dc
  Slides:  Gen3 Forum Nov 1 2023 - Frontend Framework.pdf
- Title: Security and Compliance
  Date: September 6, 2023, 3:30-5:00 pm CDT; September 7, 2023, 6:30-8:00 am AEST
  Description: Gen3 is designed to enable secure and compliant data sharing and analysis for researchers around the world. However, security and compliance can be a complex topic and so we will focus our next event on security best practices.  The event will also include experiences from other Gen3 operators on setting up and maintaining a Gen3 Data Commons from a security perspective.
  Youtube: 7liOXTPcBP4
  Agenda2: /community/events/gen3forum_20230906
  Slides:  Gen3 Forum September 6 2023 - Security and Compliance.pdf
- Title: Data Modeling in Gen3 Data Commons
  Date: July 6, 2023, 3:30-5:00 pm CDT; July 7, 2023, 6:30-8:00 am AEST
  Description: Gen3 supports a flexible graph-based data model, which can be customized for a wide variety of projects and use cases.  At this community event we will hear from several data commons operators on how they have created their dictionaries and about any tools or processes they use for updating and configuring them.  
  Agenda2: /community/events/gen3forum_20230706
  Youtube: xjFUYa4C_hw
  Slides:  Gen3 Forum July 6 2023 - Data Models.pdf


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
        <h2>Recent Gen3 Events</h2>
    </div>
</section>

{{< events "g3past" >}}


<section class="g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-inner-wrapper">
        <a href="/community/events_archived"><h2>See Gen3 Events Archive</h2></a>
</section>
