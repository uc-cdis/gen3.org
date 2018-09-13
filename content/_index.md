---
identifier: about
title: Welcome to Gen3
linktitle: about
date: 2018-09-04T22:16:21-05:00
g3Teaser:
  fig: figs/kv.svg
  title: Help Biomedical researchers get scientific-discovery on clouds easily and quickly.
  detail: Gen3 helps bioinformaticians accelerate scientific discovery with fast, secure, and collaborative genomic and clinical data-analytics.
  button1:
    caption: Experience Demo
    link: https://nci-crdc-demo.datacommons.io/
  button2: 
    caption: Get Started
    link: /get-started
g3Feature:
  f1:
    title: Host, Manage, and Share your Data.
    detail: You create and collect lots of data that is valuable to researchers, developers and health organizations. With GCP, you can better monetize the access and usage of your genomics data by hosting it in a storage bucket where operations, network and 20prextrieval costs are easily billed to your clients.
  f2:
    title: Optimize Remote Cooperaton with tech.
    detail: Share your tools and data with your group, collaborators, or the broader community on clouds
  f3: 
    title: Get Results Sooner.
    detail: You create and collect lots of data that is valuable to researchers, developers and health organizations. With GCP, you can better monetize the access and usage of your genomics data by hosting it in a storage bucket where operations, network and 20prextrieval costs are easily billed to your clients.
  f4:
    title: Scale your large dataset with any File Types
    detail: Share your tools and data with your group, collaborators, or the broader community on clouds
g3Roles:
  title: Gen3 helps you as...
  r1:
    name: Bioinformaticians
    fig: /figs/icon-bio.svg
    detail: Hormanized data allowes you to focus on create unique piplines for your projects.
    button:
      caption: Pipeline Library
      link: /resources/user
  r2:
    name: Researchers
    fig: /figs/icon-research.svg
    detail: Use our smart dashboard to explore and find data you are interested in from multiple sources to meet the needs of your research.
    button:
      caption: Gen3 User Guide
      link: /resources/user
  r3:
    name: Developers
    fig: /figs/icon-devs.svg
    detail: Integrate API into your services with open- sources softwares and supported UI library so you can focus on important coding.
    button:
      caption: Gen3 Developer
      link: /resources/developer
g3User:
  quote: “This is great. I spend only 1 day to setup Gen3, and I save a lot of time with my research-partner world wide!”
  by: bioinformaticians, University of Alabama
  title: Who's using Gen3?
  detail: You create and collect lots of data that is valuable to researchers, developers and health organizations. With Gen3, you can better monetize the access and usage of your genomics data by hosting it in a storage bucket.
  button: 
    caption: Experience Sandbox
    link: https://nci-crdc-demo.datacommons.io/
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
  detail: Gen3 is an open source software with an Apache 2.0 license for colocating compute and storage in a data commons. Gen3 is agnostic to the data type and the storage location, needing, minimally, a data model, data, a secure landing page for the portal, and, a research goal in mind.
  fig: figs/productkv.svg
  button:
    caption: Technical Overview
    link: resources/user
g3DataFeature:
  f1: 
    title: Easy Data Submission
    detail: Whether you are working with one genome or one million, Google Genomics provides access to the power and flexibility you need to advance your work.
  f2:
    title: Data Storage with High Scalability
    detail: Google's infrastructure provides reliable information security that can meet or exceed the requirements of HIPAA and protected health information.
  f3: 
    title: Open-Source Community
    detail: Whether you are working with one genome or one million, Google Genomics provides access to the power and flexibility you need to advance your work.
  f4:
    title: Smart Dashboard for Data Search
    detail: Google's infrastructure provides reliable information security that can meet or exceed the requirements of HIPAA and protected health information.
  f5: 
    title: Security & Compliance
    detail: Whether you are working with one genome or one million, Google Genomics provides access to the power and flexibility you need to advance your work.
  f6:
    title: Security & Compliance
    detail: Covered by our HIPAA Business Associates Agreement. Available via FedRAMP ATO for the National Cancer Institute Cancer Cloud Pilots.
g3Contributor:
  title: Contributor
  fig: figs/cdis-logo.svg
  link: https://cdis.uchicago.edu/
g3Entrance:
  e1:
    title: Join the Discussion
    detail: Ask biomedical questions, report issues, discuss Gen3, or reach our for helps.
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
          <a class="g3-button g3-button--primary" href="{{< param "g3Teaser.button1.link" >}}">{{< param "g3Teaser.button1.caption" >}}</a>
          <a class="g3-button g3-button--secondary" href="{{< param "g3Teaser.button2.link" >}}">{{< param "g3Teaser.button2.caption" >}}</a>
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
        <a class="g3-button g3-button--secondary g3-align__bottom" href="{{< param "g3Roles.r1.button.link" >}}">
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
        <a class="g3-button g3-button--secondary g3-align__bottom" href="{{< param "g3Roles.r2.button.link" >}}">
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
        <a class="g3-button g3-button--secondary g3-align__bottom" href="{{< param "g3Roles.r3.button.link" >}}">
          {{< param "g3Roles.r3.button.caption" >}}
        </a>
      </div>
    </div>
  </div>
</section>

<section>
  <h4 class="g3-text__center g3-minimum-wrapper g3-space__margin-sm-top">
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
          <a class="g3-button g3-button--primary" href="{{< param "g3User.button.link" >}}">
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
    <div class="g3-text__center g3-space__margin-sm-top">
      <a class="g3-button g3-button--primary" href="{{< param "g3Intro.button.link" >}}">{{< param "g3Intro.button.caption" >}}</a>
    </div>
  </div>
</section>

<section>
  <div class="g3-space__margin-lg-bottom g3-border__top-bottom">
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
    <a href="{{< param "g3Contributor.link" >}}">
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











