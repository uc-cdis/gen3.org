---
identifier: products
title: Gen3 - Products
linktitle: products
date: 2018-09-04T22:16:21-05:00
g3Teaser:
  fig: /figs/productkv.svg
  title: Gen3 Products
  detail: The Gen3 platform consists of a collection of open source software services for building and managing cloud-based data resources like interoperable nodes in a data ecosystem, data commons, and analysis workspaces. Each of the Gen3 services is designed to accomplish a specific function in a data ecosystem, and that is achieved by providing a publicly-accessible application programming interface (API) that users, applications, and other services can send requests to.
g3DataFeature:
  f1:
    title: Data Submission
    fig: /figs/features/submit-data.svg
    detail: Gen3 supports data submission including clinical attributes, phenotypic information, and data files. The submissions are validated against the data dictionary to ensure all required fields are present and have appropriate data values.
  f2:
    title: Object Index
    fig: /figs/features/index.svg
    detail: Gen3 provides permanent data GUIDs (globally unique IDs) for data objects. The service tracks the physical locations and hash of every asset (file) in the data commons object store. The Gen3 platform includes landing pages which support FAIR descriptions of the data objects.
  f3:
    title: Data Search
    fig: /figs/features/search.svg
    detail: Gen3 features a friendly GraphQL API for searching and discovering data. The GraphQL API enables faceted and precise searching through the flexible data model. Search capabilities enable quick and easy creation of virtual cohorts that can be exported to a manifest for data download.
  f4:
    title: AuthN/AuthZ
    fig: /figs/features/auth.svg
    detail: Gen3 utilizes OpenID Connect for providing authentication services with authorization specified on a per commons basis. Currently supported identity providers include Google and Shibboleth via NIH iTrust, InCommon Federation, and eduGAIN.
  f5:
    title: Data Portal
    fig: /figs/features/portal.svg
    detail: Gen3 includes a data portal as a default application over a commons. The portal is an interactive website that allows users to explore, submit, and download data. The data portal utilizes the public APIs offered by the data commons as a demonstration to the power of Gen3.
  f6:
    title: API
    fig: /figs/features/api.svg
    detail: All of the Gen3 services support powerful APIs which allow them to interact with each other and external users. These APIs enable extensible application development for future services and users.
g3Entrance:
  e1:
    title: Learn about Gen3's microservices
    detail: Look at the code repositories from GitHub
    button:
      caption: Learn
      link: https://github.com/uc-cdis
  e2:
    title: Get Started Easily
    detail: Follow the documentation to setup Gen3 from docker images.
    button:
      caption: Easy Start
      link: /get-started
---

<section class="g3-bg__mint">
  <div class="g3-outer-wrapper g3-flex-content g3-flex-content__reverse">
    <div class="g3-col__65 g3-flex-content g3-space__padding-md-top g3-mb-space__padding-lg-top">
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

<section>
  <div class="g3-space__margin-lg-bottom g3-inner-wrapper">
    <div class="g3-flex-content g3-space__margin-md-top-bottom">
      <div class="g3-space__margin-sm-left-right g3-col__50">
        <img class="g3-img__center" src="{{< param "g3DataFeature.f1.fig" >}}" />
        <h3 class="g3-text__center g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f1.title" >}}</h3>
        <p>
          {{< param "g3DataFeature.f1.detail" >}}
        </p>
      </div>
      <div class="g3-space__margin-sm-left-right g3-col__50">
        <img class="g3-img__center" src="{{< param "g3DataFeature.f2.fig" >}}" />
        <h3 class="g3-text__center g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f2.title" >}}</h3>
        <p>
          {{< param "g3DataFeature.f2.detail" >}}
        </p>
      </div>
    </div>
    <div class="g3-flex-content g3-space__margin-md-top-bottom">
      <div class="g3-space__margin-sm-left-right g3-col__50">
        <img class="g3-img__center" src="{{< param "g3DataFeature.f3.fig" >}}" />
        <h3 class="g3-text__center g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f3.title" >}}</h3>
        <p>
          {{< param "g3DataFeature.f3.detail" >}}
        </p>
      </div>
      <div class="g3-space__margin-sm-left-right g3-col__50">
        <img class="g3-img__center" src="{{< param "g3DataFeature.f4.fig" >}}" />
        <h3 class="g3-text__center g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f4.title" >}}</h3>
        <p>
          {{< param "g3DataFeature.f4.detail" >}}
        </p>
      </div>
    </div>
    <div class="g3-flex-content g3-space__margin-md-top-bottom">
      <div class="g3-space__margin-sm-left-right g3-col__50">
        <img class="g3-img__center" src="{{< param "g3DataFeature.f5.fig" >}}" />
        <h3 class="g3-text__center g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f5.title" >}}</h3>
        <p>
          {{< param "g3DataFeature.f5.detail" >}}
        </p>
      </div>
      <div class="g3-space__margin-sm-left-right g3-col__50">
        <img class="g3-img__center" src="{{< param "g3DataFeature.f6.fig" >}}" />
        <h3 class="g3-text__center g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f6.title" >}}</h3>
        <p>
          {{< param "g3DataFeature.f6.detail" >}}
        </p>
      </div>
    </div>
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
