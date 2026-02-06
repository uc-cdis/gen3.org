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
- Title:  Managing Gen3 Deployments
  Date: March 4, 2026 3:30-5:30 pm CST (March 5, 2026, 8:30-10:00 am AEDT)
  Description: Deployment and monitoring of a Gen3 system takes significant cloud expertise.  Over the past year, the Gen3 Commons Services Operations Center (CSOC) working group has been meeting to share knowledge and build new capabilities in order to simplify and improve Gen3 deployment and monitoring.  At our March community forum meeting we will share some of the work that has come out of this group's efforts.
  Image: /figs/gen3_new_logo.png
  Registration: https://uchicago.zoom.us/meeting/register/W9_l7_uQQFeCV7u-86Wx9Q
  Agenda2: gen3forum_20260304

g3past:
- Title:  Gen3 Development Roadmap for 2026
  Date: January 21, 2026 3:30-5:30 pm CST (January 21, 2026, 8:30-10:00 am AEDT)
  Description: We will introduce the 2026 Gen3 Development Roadmap, which will include current priorities for the next year.  The first portion of the meeting will include a presentation by Robert Grossman, Director of CTDS.  The second portion will include an organized panel discussion by the Gen3 steering committee on the roadmap.  Please attend to provide your feedback and help prioritize roadmap items.
  Youtube: ugVMYIgYSQs
  Slides: Gen3 Forum Jan 2026 - Gen3 Roadmap.pdf
- Title: Integrating AI tools into Gen3
  Date: November 5, 2025 3:30-5:30 pm CST (November 6, 2025, 8:30-10:00 am AEDT)
  Description: Director of CTDS, Robert Grossman, will share with the community the roadmap for AI in Gen3.  Planned features include model inference, training, and fine tuning using data in a commons, vector store for embeddings, chat-like query interface, and federated AI in Gen3 meshes.
  Youtube: Ia_Im-3kgrI
- Title: Understanding ETL and ETL mapping to power the Gen3 Exploration Page
  Date: September 3, 2025 4:00-5:30 pm CT (September 4, 2025, 6:30-8:00 am AEST)
  Description: The Gen3 Exploration page is where users build cohorts and identify files of interest to their research goals. ETL mapping allows you to customize how your data can be searched on this page. Different mapping strategies will produce different search options on the Exploration page. Dan Biber, of the Gen3 User Services team, will explain how to think about ETL mapping in order to create the elasticsearch indices necessary for Guppy to be able to provide your desired search capabilities in the frontend. He will demonstrate the microservice Tube, which runs ETL, and provide several examples using different use cases for how one may want the the data to be represented and searchable in the Exploration Page.
  Slides: Gen3 Forum September 2025 - ETL.pdf
  Youtube: KRF89c4UHKU
- Title: Gen3 Deployment Options
  Date: July 2, 2025 4:00-5:15 pm CT (July 3, 2025, 7:00-8:15 am AEST)
  Description: Gen3 is cloud agnostic and can be deployed on a variety of infrastructures.  Many of our talks and much of our documentation focuses on AWS, but in this session we will highlight other solutions including on-prem, local on a laptop, and other cloud providers such as GCP and Azure.  Please come with your questions for our panel of speakers.
  Image: /figs/July_2025_forum.png
  Slides: Gen3 Forum July 2025 - Deployment Options.pdf
- Title: Data Analysis in Gen3 Systems
  Date: May 7, 2025 3:30-5:00 pm CT (May 8, 2025, 6:30-8:00 am AEST)
  Description: This meeting will showcase a variety of Gen3 systems to highlight both the types of data these systems include and also details of how users for each system analyze their data.  Analysis solutions may include Gen3 workspaces, local download, or export to third-party analysis systems.  Review the Full Agenda for the detailed list of speakers and topics.
  Youtube: zRAv8U5fMYk
  Slides: Gen3 Forum May 2025 - Data Analysis.pdf
  Agenda2: gen3forum_20250507
- Title: Gen3 Development Roadmap for 2025
  Date: February 26, 2025 3:30-5:00 pm CT (February 27, 2025, 8:30-10:00 am AEDT)
  Description: We will introduce the 2025 Gen3 Development Roadmap, which will include known current priorities.  The first portion of the meeting will include a presentation by Robert Grossman, Director of CTDS.  The second portion will include an organized panel discussion by the Gen3 steering committee on the roadmap.  Please attend to provide your feedback and help prioritize roadmap items.
  Youtube: dh7FWSqx-1w
  Slides: Gen3 Forum Feb 26 2025 - Gen3 Roadmap.pdf


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

<!--
<section class="g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-inner-wrapper">
        <h2>Upcoming Events</h2>
    </div>
</section>
-->

{{< events "g3Upcoming" >}}

<section class="g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-inner-wrapper">
    </div>
</section>

{{< events "g3past" >}}


<section class="g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-inner-wrapper">
        <a href="/community/events_archived"><h2>See Gen3 Events Archive</h2></a>
</section>
