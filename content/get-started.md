---
identifier: get-started
title: Gen3 - Get Started
linktitle: get-started
date: 2018-09-04T22:16:21-05:00
g3Starts:
  title: Get Started
  s1:
    name: Setup Gen3
    fig: /figs/features/set-up.svg
    detail: Gen3 features a friendly GraphQL API for searching and discovering data. The GraphQL API enables faceted and precise searching through the flexible data model. Search capabilities enable quick and easy creation of virtual cohorts that can be exported to a manifest for data download.
    button:
      caption: User Guide
      link: /resources/user
  s2:
    name: Submit Metadata & Data
    fig: /figs/features/submit-data.svg
    detail: Create your whitelist yaml, use Gen3’s Sheepdog microservice to begin submitting metadata, and download the cdis-data-client to begin submitting data to your commons. Or look into how to build your own submission apps.
    button:
      caption: Data Contribution
      link: /resources/user/submit-data
  s3:
    name: Access Metadata & Data
    fig: /figs/features/search.svg
    detail: Gen3 includes a data portal as a default application over a commons. The portal is an interactive website that allows users to explore, submit, and download data. The data portal utilizes the public APIs offered by the data commons as a demonstration to the power of Gen3. Or look into how to build your own submission apps.
    button:
      caption: Data Access
      link: /resources/user/access-data
  s4:
    name: Build Apps on Gen3
    fig: /figs/features/build-apps.svg
    detail: All of the Gen3 services support powerful APIs which allow them to interact with each other and external users. These APIs enable extensible application development for future services and users.
    button:
      caption: Developer
      link: /resources/developer/build-app
---

<section class="g3-bg__solight">
  <h1 class="g3-text__center g3-space__padding-md-top-bottom g3-mb-hide">{{< param "g3Starts.title" >}}</h1>
</section>
  
<section>
  <div class="g3-inner-wrapper g3-space__padding-md-top g3-space__padding-lg-bottom g3-mb-space__padding-lg-top g3-mb-space__padding-lg-bottom">
    <div class="g3-table g3-space__margin-lg-bottom g3-mb-space__margin-lg-bottom">
      <div class="g3-col__50 g3-text__center g3-space__padding-sm-left-right">
        <img class="g3-space__margin-sm-bottom" src="{{< param "g3Starts.s1.fig" >}}"/>
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Starts.s1.name" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom g3-text__desktop-left">
          {{< param "g3Starts.s1.detail" >}}
        </p>
        <a class="g3-button g3-button--primary g3-align__bottom" href="{{< param "g3Starts.s1.button.link" >}}">
          {{< param "g3Starts.s1.button.caption" >}}
        </a>
      </div>
      <div class="g3-col__50 g3-text__center g3-space__padding-sm-left-right">
        <img class="g3-space__margin-sm-bottom" src="{{< param "g3Starts.s2.fig" >}}"/>
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Starts.s2.name" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom g3-text__desktop-left">
          {{< param "g3Starts.s2.detail" >}}
        </p>
        <a class="g3-button g3-button--primary g3-align__bottom" href="{{< param "g3Starts.s2.button.link" >}}">
          {{< param "g3Starts.s2.button.caption" >}}
        </a>
      </div>
    </div>
    <div class="g3-table g3-space__margin-lg-bottom g3-mb-space__margin-lg-bottom">
      <div class="g3-col__50 g3-text__center g3-space__padding-sm-left-right">
        <img class="g3-space__margin-sm-bottom" src="{{< param "g3Starts.s3.fig" >}}"/>
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Starts.s3.name" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom g3-text__desktop-left">
          {{< param "g3Starts.s3.detail" >}}
        </p>
        <a class="g3-button g3-button--primary g3-align__bottom" href="{{< param "g3Starts.s3.button.link" >}}">
          {{< param "g3Starts.s3.button.caption" >}}
        </a>
      </div>
      <div class="g3-col__50 g3-text__center g3-space__padding-sm-left-right">
        <img class="g3-space__margin-sm-bottom" src="{{< param "g3Starts.s4.fig" >}}"/>
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Starts.s4.name" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom g3-text__desktop-left">
          {{< param "g3Starts.s4.detail" >}}
        </p>
        <a class="g3-button g3-button--primary g3-align__bottom" href="{{< param "g3Starts.s4.button.link" >}}">
          {{< param "g3Starts.s4.button.caption" >}}
        </a>
      </div>
    </div>
  </div>
</section>