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



g3Past:

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


- Title: How to Build a Data Mesh Using Gen3
  Date: May 1, 2023, 3:30-5:00 pm CST; May 2, 2023, 6:30-8:00 am AEST
  Description:  "Data meshes or ecosystems consist of an interconnected network of data resources (e.g. data commons, repositories, or knowledgebases) that are integrated by utilizing a common set of software services. Each component data resource may have many of its own systems and separate governance, but they are all connected via framework or mesh services such as authentication and authorization, data indexing, and metadata services. In this Gen3 community event we'll describe the Gen3 Mesh Services, and you will hear from a few projects and applications that are utilizing the Gen3 mesh functionality. As always we will leave plenty of time for questions and discussion."
  Youtube: K5ld3V5AslE
  Slides: Gen3 Forum May 1 2023 - Data Meshes.pdf

- Title: Gen3 Forum Office Hours - Helm Charts
  Date: April 5, 2023, 4:00-5:00 pm CST; April 6, 2023, 7:00-8:00 am AEST
  Description:  "Join us for an informal session where a platform engineer from the Center for Translational Data Science (CTDS) will be on hand to answer your questions about using Helm Charts for setting up a Gen3 Data Commons."
  Youtube: y8ZFiQYzkg8
  Slides:


- Title: How to Set Up a Gen3 Data Commons Using Helm Charts
  Date: March 1, 2023, 3:30-5:00 pm CST; March 2, 2023, 8:30-10:00 am AEST
  Description:  "We will take you through the current best practices for setting up and configuring your own Gen3 Data Commons in multiple clouds by using Helm Charts. Helm is a tool that streamlines installing and managing Kubernetes applications, which is a system for automating deployment, scaling, and management of containerized applications. The use of Helm will greatly simplify standing up, configuring, and maintaining your own Gen3 Data Commons. This is the first of a series of community events through 2023."
  Youtube: 0WCKOJtj3RM
  Slides: Gen3 Forum March 1 2023 - Helm Charts.pdf

- Title: Gen3 Community Forum 2022
  Date: Oct 10-12, 2022 US; Oct 11-13, 2022 AU
  Description:  "The Gen3 Community Forum consists of those developing and operating Gen3 data commons and data meshes, those considering developing Gen3 data commons and meshes, and other stakeholders involved with the Gen3 community. The four aims of the Forum are: to share knowledge about Gen3, its architecture, and the Gen3 roadmaps and priorities; to strengthen the connection between the Gen3 core team and those developing, operating and using Gen3 platforms; to design a set of ongoing community engagement activities; and to discuss and agree on key shared development priorities between the Gen3 core team and the Gen3 community. The virtual community forum is co-hosted by the University of Chicago and the Australian BioCommons."
  Playlist: https://www.youtube.com/playlist?list=PLZtKC_lqcLhKfSthym1ZKcDKf1n0wLzuH
  Image: /figs/community_forum_2022.png
  Agenda: /community/events/gen3forum_202210_post


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
        <h2>Previous Events</h2>
    </div>
</section>

{{< events "g3past" >}}
