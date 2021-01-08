---
identifier: products
title: Gen3 - Products
linktitle: products
date: 2021-01-08
g3Teaser:
  fig: /figs/productkv.svg
  title: Gen3 Features
  detail: Gen3 is an open source software with Apache 2.0 or similar licenses, collocating compute and storage in a data commons. It is agnostic to the data type and the storage location, needing, minimally, a data model, data, a secure landing page for the portal, and research goals.
g3DataFeature:
  f1:
    title: Framework Services
    subtitle: Backend etc etc
    button:
      link: /products/framework-service
    contents:
      c1:
        name: Object Index
        fig: /figs/features/index.svg
      c2:
        name: AuthN/AuthZ
        fig: /figs/features/auth.svg
      c3:
        name: Metadata Service
        fig: /figs/features/api.svg
  f2:
    title: Data Commons
    subtitle: Interface etc etc
    button:
      link: /products/data-commons
    contents:
      c1:
        name: Data Portal
        fig: /figs/features/portal.svg
      c2:
        name: Data Search
        fig: /figs/features/search.svg
      c3:
        name: Data Submission
        fig: /figs/features/submit-data.svg
  f3:
    title: Workspaces
    subtitle: Current with future being...
    button:
      link: /products/workspace
    contents:
      c1:
        name: RStudio
        fig: /figs/features/rstudio.svg
      c2:
        name: Jupyter
        fig: /figs/features/jupyter.svg
      c3:
        name: Visualization Apps
        fig: /figs/features/visualization.svg
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
    <div class="g3-space__padding-lg-top g3-space__padding-lg-bottom g3-col_35">
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
      <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
        <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f1.title" >}}</h3>
        <p>
          {{< param "g3DataFeature.f1.subTitle" >}}
        </p>
        <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
        <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center">
          <img class="g3-row__10vh" src="{{< param "g3DataFeature.f1.contents.c1.fig" >}}" />
          <p class="introduction">
            {{< param "g3DataFeature.f1.contents.c1.name" >}}
          </p>
        </div>
        <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center">
          <img class="g3-row__10vh" src="{{< param "g3DataFeature.f1.contents.c2.fig" >}}" />
          <p class="introduction">
            {{< param "g3DataFeature.f1.contents.c2.name" >}}
          </p>
        </div>
        <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center">
          <img class="g3-row__10vh" src="{{< param "g3DataFeature.f1.contents.c3.fig" >}}" />
          <p class="introduction">
            {{< param "g3DataFeature.f1.contents.c3.name" >}}
          </p>
        </div>
        <div class="g3-flex-content g3-flex-content_center">
          <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f1.button.link" >}}" ">
            Learn More
          </a>
        </div>
      </div>
      <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
        <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f2.title" >}}</h3>
        <p>
          {{< param "g3DataFeature.f2.subTitle" >}}
        </p>
        <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
        <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center">
          <img class="g3-row__10vh" src="{{< param "g3DataFeature.f2.contents.c1.fig" >}}" />
          <p class="introduction">
            {{< param "g3DataFeature.f2.contents.c1.name" >}}
          </p>
        </div>
        <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center">
          <img class="g3-row__10vh" src="{{< param "g3DataFeature.f2.contents.c2.fig" >}}" />
          <p class="introduction">
            {{< param "g3DataFeature.f2.contents.c2.name" >}}
          </p>
        </div>
        <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center">
          <img class="g3-row__10vh" src="{{< param "g3DataFeature.f2.contents.c3.fig" >}}" />
          <p class="introduction">
            {{< param "g3DataFeature.f2.contents.c3.name" >}}
          </p>
        </div>
        <div class="g3-flex-content g3-flex-content_center">
          <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f2.button.link" >}}" ">
            Learn More
          </a>
        </div>
      </div>
      <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
        <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f3.title" >}}</h3>
        <p>
          {{< param "g3DataFeature.f3.subTitle" >}}
        </p>
        <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
        <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center">
          <img class="g3-row__10vh" src="{{< param "g3DataFeature.f3.contents.c1.fig" >}}" />
          <p class="introduction">
            {{< param "g3DataFeature.f3.contents.c1.name" >}}
          </p>
        </div>
        <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center">
          <img class="g3-row__10vh" src="{{< param "g3DataFeature.f3.contents.c2.fig" >}}" />
          <p class="introduction">
            {{< param "g3DataFeature.f3.contents.c2.name" >}}
          </p>
        </div>
        <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center">
          <img class="g3-row__10vh" src="{{< param "g3DataFeature.f3.contents.c3.fig" >}}" />
          <p class="introduction">
            {{< param "g3DataFeature.f3.contents.c3.name" >}}
          </p>
        </div>
        <div class="g3-flex-content g3-flex-content_center">
          <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f3.button.link" >}}" ">
            Learn More
          </a>
        </div>
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
