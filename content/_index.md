---
identifier: about
title: Welcome to Gen3
linktitle: about
date: 2018-09-04T22:16:21-05:00
g3Teaser:
  fig: figs/kv.svg
  title: Gen3 is how data commons are made.
  detail: A data commons is a cloud-based software platform for managing, analyzing, harmonizing, and sharing large datasets. Gen3 is an open source platform for developing data commons. Data commons accelerate and democratize the process of scientific discovery, especially over large or complex datasets.
  button1:
    caption: Experience Demo
    link: https://caninedc.org/
    target: _blank
  button2:
    caption: Get Started
    link: /get-started
    target: _self
g3Feature:
  f1:
    title: Host, Manage, and Share your Data
    detail: Gen3 enables you to receive, manage, and share data which is valuable to researchers, developers and health organizations. With Gen3, you can receive data, quality control data, generate globally unique IDs, share datasets with authorized individuals or any authenticated individual, and compute over that data.
  f2:
    title: Customize Your Gen3 Experience
    detail: Multiple Gen3 data commons can work together to create an interoperable ecosystem. Gen3 can be used to power APIs for a “thin middle” of framework services. These framework services provide the foundation on which you and your community can develop new tools for sharing and analyzing data with your group, collaborators, or the broader Gen3 community.
  f3:
    title: Facilitate Translational Data Science
    detail: Use Gen3’s built in tools to find your virtual cohort, and analyze the cohort in notebooks within a cloud environment to hasten your hypotheses testing and discoveries.
  f4:
    title: Scale Your Large Dataset with Any File Types
    detail: Gen3 APIs enable support for importing data from a variaty of platforms including from common clinical to genomic data platforms. Since Gen3 is a growing community, you could repurpose another person’s tools with your data, data commons, or data ecosystem.
g3Roles:
  title: Gen3 helps you as...
  r1:
    name: Bioinformaticians
    fig: /figs/roles/icon-bio.svg
    detail: Organized data allows you to focus on creating unique pipelines and analyses for your projects.
    button:
      caption: Pipeline Library
      target: _blank
      link: https://github.com/uc-cdis/ndh-demo
  r2:
    name: Researchers
    fig: /figs/roles/icon-research.svg
    detail: Use our smart dashboard to explore and find data from multiple sources to meet the needs of your research.
    button:
      caption: Gen3 User Guide
      target: _self
      link: /resources/user
  r3:
    name: Developers
    fig: /figs/roles/icon-devs.svg
    detail: Integrate Gen3 APIs into your services and utilize our open-source software libraries so you can focus on your tools.
    button:
      caption: Gen3 Developer
      target: _self
      link: /resources/developer
g3User:
  quote: “From the perspective of setting up a basic Gen3 ecosystem with all the services running, it was a breeze and the Github docs are pretty awesome.”
  by: Amit, Cloud Solutions Architect with Leidos
  title: Who's using Gen3?
  detail: Federal agencies, not-for-profits, and consortiums with members spanning the globe use Gen3 and its framework services to support their research communities, access and index their data, and facilitate scientific discoveries that impact the world.
  button:
    caption: Experience Sandbox
    link: https://caninedc.org/
    target: _blank
  fig: figs/app-mockup.png
g3Commons:
  c1:
    fig: figs/commons/kid-first.svg
    link: https://kidsfirstdrc.org/
  c2:
    fig: figs/commons/blood-pac.png
    link: https://www.bloodpac.org/
  c3:
    fig: figs/commons/pdc.png
    link: /
  c4:
    fig: figs/commons/braincommons.png
    link: https://www.braincommons.org/
g3Intro:
  title: Introduction to Gen3
  detail: Gen3 is an open source software with Apache 2.0 or similar licenses, colocating compute and storage in a data commons. It is agnostic to the data type and the storage location, requiring  minimally, a data model, data, a secure landing page for the portal, and research goals.
  fig: figs/productkv.svg
  button:
    caption: Technical Overview
    link: resources/user
g3DataAccess:
  title: Data Access Control on Gen3
  para1: Gen3 manages data access via internal access control lists stored in a database. It is capable of pulling authorization information from multiple lists, as well as syncing with external sources such as dbGaP. Gen3 supports both users and groups defined in these access control lists - a user that is associated with a group will inherit that group’s permissions.
  para2: Data is either stored in S3/Google buckets or in our graph database. Only users with "read-storage" and "write-storage" permissions will be able to access stored object data (files) within these buckets, and users with "read" and "write" permissions will be able to access data (clinical data and data that describes a file) in the graph database. These policies prevent public access. Gen3 is also capable of issuing presigned urls for authorized users to directly access objects within buckets, and both the generation of these presigned urls as well as the object downloads themselves are logged.
  para2Fig: img/figs/data-access-diagram.png
  para3: Gen3 also has an Attribute Based Access Control (ABAC) engine. It can be used to define data access controls and permissions on a more granular level, and can determine if a user is able to access a specific piece of data. Data in our graph database is modeled as a hierarchy that starts with Programs and Projects. A Program is the root of the tree, and represents an overall group for the data. A Program will have Projects underneath it that consist of any subgroups. Projects can then have many subgroups, and so on. Permissions are generally given on the Program level, but with the ABAC engine, Gen3 can provide more specific authorization that applies to nodes further down the tree.
  para3Fig: img/figs/data-model-diagram.png
g3DataFeature:
  f1:
    title: Easy Data Submission
    detail: Use one of the microservices or community tools to submit data objects and metadata to a Gen3 Commons. Or develop your own tools specific to your user community.
  f2:
    title: Easily Find Your Data in an Ecosystem
    detail: Gen3 will automatically index your data and provide globally unique identifiers (GUIDs). GUIDs can also be resolved at dataguids.org to find out where a data object lives within your data ecosystem.
  f3:
    title: Open-Source Community
    detail: Engage Gen3’s broad user community. Ask a question, answer a question, request a new feature, or see if anyone else has approached a technical or scientific problem like yours in their Gen3 data commons.
  f4:
    title: Customizable Options for Data Queries
    detail: Gen3’s UI includes a data exploration tool you can customize for your data. You can choose the queries or faceted searches your user community wants; decide whether the data is able to leave the cloud or not; or develop your own apps over Gen3 APIs.
  f5:
    title: Security & Compliance
    detail: Gen3 can be deployed with various levels of security and compliance. Deploy your data commons or ecosystem with the controls needed for your data and your user community.
  f6:
    title: Control Data Access—Or Not
    detail: You can leave your data open to the Internet or control access at deeper levels within your own data use ontology, from the core data to the data objects.
g3Contributor:
  title: Contributor
  fig: figs/cdis-logo.svg
  target: _blank
  link: https://cdis.uchicago.edu/
g3Entrance:
  e1:
    title: Join the Discussion
    detail: Ask questions, report issues, discuss Gen3, or reach out for advice.
    button:
      caption: Community
      link: https://forums.gen3.org/
  e2:
    title: Get Started Easily
    detail: Follow the documentation to setup Gen3 easily to benefit your research.
    button:
      caption: Easy Start
      link: /get-started

---

<section class="g3-bg__solight">
  <div class="g3-outer-wrapper g3-flex-content g3-flex-content__reverse">
    <div class="g3-col__55 g3-flex-content g3-mb-space__padding-lg-top">
      <img class="g3-img__max-full-width" src="{{< param "g3Teaser.fig" >}}"/>
    </div>
    <div class="g3-space__padding-lg-top g3-space__padding-lg-bottom g3-col__45">
      <div class="g3-space__wrapper-gap-left">
        <h1 class="g3-space__margin-sm-bottom">
          {{< param "g3Teaser.title" >}}
        </h1>
        <p class="introduction">
          {{< param "g3Teaser.detail" >}}
        </p>
        <div class="g3-button-groups g3-mb-space__padding-lg-bottom">
          <a class="g3-button g3-button--primary" target="{{< param "g3Teaser.button1.target" >}}" href="{{< param "g3Teaser.button1.link" >}}">{{< param "g3Teaser.button1.caption" >}}</a>
          <a class="g3-button g3-button--secondary" target="{{< param "g3Teaser.button2.target" >}}" href="{{< param "g3Teaser.button2.link" >}}">{{< param "g3Teaser.button2.caption" >}}</a>
        </div>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="g3-inner-wrapper g3-flex-content g3-space__padding-lg-top g3-space__padding-md-bottom">
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left g3-space__margin-sm-right">
        <h3>{{< param "g3Feature.f1.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          {{< param "g3Feature.f1.detail" >}}
        </p>
      </div>
    </div>
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left g3-space__margin-sm-right">
        <h3>{{< param "g3Feature.f2.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          {{< param "g3Feature.f2.detail" >}}
        </p>
      </div>
    </div>
  </div>
  <div class="g3-inner-wrapper g3-flex-content g3-space__padding-lg-bottom">
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left g3-space__margin-sm-right">
        <h3>{{< param "g3Feature.f3.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          {{< param "g3Feature.f3.detail" >}}
        </p>
      </div>
    </div>
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left g3-space__margin-sm-right">
        <h3>{{< param "g3Feature.f4.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          {{< param "g3Feature.f4.detail" >}}
        </p>
      </div>
    </div>
  </div>
</section>

<h2 class="g3-text__center g3-space__margin-sm-bottom">
  {{< param "g3Roles.title" >}}
</h2>

<section class="g3-bg__solight">
  <div class="g3-inner-wrapper g3-space__padding-md-top g3-space__padding-lg-bottom g3-mb-space__padding-lg-top g3-mb-space__padding-lg-bottom">
    <div class="g3-table-row">
      <div class="g3-col__33 g3-text__center g3-space__margin-sm-left-right">
        <img class="g3-space__margin-sm-bottom" src="{{< param "g3Roles.r1.fig" >}}"/>
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r1.name" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r1.detail" >}}
        </p>
        <a class="g3-button g3-button--secondary g3-align__bottom" href="{{< param "g3Roles.r1.button.link" >}}" target="{{< param "g3Roles.r1.button.target" >}}">
          {{< param "g3Roles.r1.button.caption" >}}
        </a>
      </div>
      <div class="g3-col__33 g3-text__center g3-space__margin-sm-left-right">
        <img class="g3-space__margin-sm-bottom" src="{{< param "g3Roles.r2.fig" >}}"/>
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r2.name" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r2.detail" >}}
        </p>
        <a class="g3-button g3-button--secondary g3-align__bottom" href="{{< param "g3Roles.r2.button.link" >}}" target="{{< param "g3Roles.r2.button.target" >}}">
          {{< param "g3Roles.r2.button.caption" >}}
        </a>
      </div>
      <div class="g3-col__33 g3-text__center g3-space__margin-sm-left-right">
        <img class="g3-space__margin-sm-bottom" src="{{< param "g3Roles.r3.fig" >}}"/>
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r3.name" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r3.detail" >}}
        </p>
        <a class="g3-button g3-button--secondary g3-align__bottom" href="{{< param "g3Roles.r3.button.link" >}}" target="{{< param "g3Roles.r3.button.target" >}}">
          {{< param "g3Roles.r3.button.caption" >}}
        </a>
      </div>
    </div>
  </div>
</section>

<section>
  <h4 class="g3-text__center g3-minimum-wrapper g3-space__padding-lg-top">
    {{< param "g3User.quote" >}}
  </h4>
  <p class="g3-text__center g3-minimum-wrapper g3-space__margin-sm-top g3-space__padding-lg-bottom">
    - {{< param "g3User.by" >}}
  </p>
</section>

<section class="g3-bg__mint">
  <div class="g3-outer-wrapper g3-flex-content g3-mb-space__padding-lg-bottom g3-mb-space__padding-lg-top">
    <div class="g3-col__45 g3-space__margin-lg-top g3-space__margin-lg-bottom">
      <div class="g3-space__wrapper-gap-left">
        <h1>{{< param "g3User.title" >}}</h1>
        <p class="introduction g3-space__margin-sm-top-bottom">
          {{< param "g3User.detail" >}}
        </p>
        <div class="g3-mb-text__center">
          <a class="g3-button g3-button--primary" href="{{< param "g3User.button.link" >}}" target="{{< param "g3User.button.target" >}}">
            {{< param "g3User.button.caption" >}}
          </a>
        </div>
      </div>
    </div>
    <div class="g3-col__55 g3-space__padding-md">
      <img class="g3-img__center g3-img__full-width" src="{{< param "g3User.fig" >}}" />
    </div>
  </div>
</section>

<section class="g3-bg__solight">
  <div class="g3-inner-wrapper g3-flex-content g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-col__25">
      <a href="{{< param "g3Commons.c1.link" >}}">
        <img class="g3-img__center" style="max-height: 52px; max-width: 100%;" src="{{< param "g3Commons.c1.fig" >}}" />
      </a>
    </div>
    <div class="g3-col__25">
      <a href="{{< param "g3Commons.c2.link" >}}">
        <img class="g3-img__center" style="max-height: 52px; max-width: 100%;" src="{{< param "g3Commons.c2.fig" >}}" />
      </a>
    </div>
    <div class="g3-col__25">
      <a href="{{< param "g3Commons.c3.link" >}}">
        <img class="g3-img__center" style="max-height: 52px; max-width: 100%;" src="{{< param "g3Commons.c3.fig" >}}" />
      </a>
    </div>
    <div class="g3-col__25">
      <a href="{{< param "g3Commons.c4.link" >}}">
        <img class="g3-img__center" style="max-height: 52px; max-width: 100%;" src="{{< param "g3Commons.c4.fig" >}}" />
      </a>
    </div>
  </div>
</section>

<section>
  <div class="g3-inner-wrapper g3-space__padding-lg-top g3-space__padding-lg-bottom">
    <h2 class="g3-text__center">{{< param "g3Intro.title" >}}</h2>
    <p class="introduction g3-mini-wrapper g3-text__center g3-space__margin-sm-top g3-space__padding-md-bottom">
      {{< param "g3Intro.detail" >}}
    </p>
    <img class="g3-img__center g3-img" src="{{< param "g3Intro.fig" >}}"/>
    <div class="g3-space__padding-md-top-bottom g3-mini-wrapper">
      <h3 class="g3-text__center">{{< param "g3DataAccess.title" >}}</h3>
      <p class="introduction g3-text__center g3-space__margin-sm-top">
        {{< param "g3DataAccess.para1" >}}
      </p>
      <img class="g3-img__center g3-img__full-width" src="{{< param "g3DataAccess.para2Fig" >}}" />
      <p class="introduction g3-text__center g3-space__margin-sm-top">
        {{< param "g3DataAccess.para2" >}}
      </p>
      <img class="g3-img__center g3-img__full-width" src="{{< param "g3DataAccess.para3Fig" >}}" />
      <p class="introduction g3-text__center g3-space__margin-sm-top">
        {{< param "g3DataAccess.para3" >}}
      </p>
    </div>
    <div class="g3-text__center g3-space__margin-sm-top">
      <a class="g3-button g3-button--primary" href="{{< param "g3Intro.button.link" >}}">{{< param "g3Intro.button.caption" >}}</a>
    </div>
  </div>
</section>

<section>
  <div class="g3-space__padding-md-top g3-space__padding-md-bottom g3-space__margin-lg-bottom g3-bg__solight">
    <div class="g3-inner-wrapper">
      <div class="g3-flex-content g3-space__margin-md-top-bottom">
        <div class="g3-space__margin-sm-left-right g3-col__50">
          <h3>{{< param "g3DataFeature.f1.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f1.detail" >}}
          </p>
        </div>
        <div class="g3-space__margin-sm-left-right g3-col__50">
          <h3>{{< param "g3DataFeature.f2.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f2.detail" >}}
          </p>
        </div>
      </div>
      <div class="g3-flex-content g3-space__margin-md-top-bottom">
        <div class="g3-space__margin-sm-left-right g3-col__50">
          <h3>{{< param "g3DataFeature.f3.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f3.detail" >}}
          </p>
        </div>
        <div class="g3-space__margin-sm-left-right g3-col__50">
          <h3>{{< param "g3DataFeature.f4.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f4.detail" >}}
          </p>
        </div>
      </div>
      <div class="g3-flex-content g3-space__margin-md-top-bottom">
        <div class="g3-space__margin-sm-left-right g3-col__50">
          <h3>{{< param "g3DataFeature.f5.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f5.detail" >}}
          </p>
        </div>
        <div class="g3-space__margin-sm-left-right g3-col__50">
          <h3>{{< param "g3DataFeature.f6.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f6.detail" >}}
          </p>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="g3-space__margin-lg-bottom g3-text__center">
  <h2>{{< param "g3Contributor.title" >}}</h2>
  <div class="g3-mini-wrapper g3-space__margin-sm-top">
    <a href="{{< param "g3Contributor.link" >}}" target="{{< param "g3Contributor.target" >}}">
      <img src="{{< param "g3Contributor.fig" >}}" class="g3-img__full-width" />
    </a>
  </div>
</section>

<section>
  <div class="g3-inner-wrapper g3-flex-content g3-space__margin-md-bottom">
    <div class="g3-bg__solight g3-space__padding-md g3-col__50 g3-text__center g3-space__margin-sm-left-right">
      <h2 class="g3-space__margin-sm-bottom">
        {{< param "g3Entrance.e1.title" >}}
      </h2>
      <p class="g3-space__margin-sm-bottom">
        {{< param "g3Entrance.e1.detail" >}}
      </p>
      <a class="g3-button--secondary g3-button" href="{{< param "g3Entrance.e1.button.link" >}}">
        {{< param "g3Entrance.e1.button.caption" >}}
      </a>
    </div>
    <div class="g3-bg__solight g3-space__padding-md g3-col__50 g3-text__center g3-space__margin-sm-left-right">
      <h2 class="g3-space__margin-sm-bottom">
        {{< param "g3Entrance.e2.title" >}}
      </h2>
      <p class="g3-space__margin-sm-bottom">
        {{< param "g3Entrance.e2.detail" >}}
      </p>
      <a class="g3-button--secondary g3-button" href="{{< param "g3Entrance.e2.button.link" >}}">
        {{< param "g3Entrance.e2.button.caption" >}}
      </a>
    </div>
  </div>
</section>
