---
identifier: products
title: Gen3 - Products
linktitle: products
date: 2021-01-08
g3Teaser:
  fig: /figs/productkv.svg
  title: Gen3 Products
  detail: The Gen3 platform consists of a collection of open source software services for building and managing cloud-based data resources, namely, interoperable nodes in a data mesh, data commons, and analysis workspaces.
  para1: Each of the Gen3 services is designed to accomplish a specific function in a data ecosystem, and that is achieved by providing a publicly-accessible application programming interface (API) that users, applications, and other services can send requests to.
  para2: This page organizes and presents the Gen3 software services in terms of the different types of data resources mentioned above.
g3DataFeature:
  f0:
    title: Gen3 Data Meshes
    subtitle: Data meshes consist of an interconnected network of data resources that are integrated by utilizing a common set of software services called the Gen3 Framework Services.  Meshes may also be referred to as fabrics or ecosystems. The framework services support the emergence of data meshes by empowering data resources to interoperate through providing common protocols for user authentication and authorization, data indexing, and metadata services.
    button:
      link: /products/data-mesh
  f1:
    title: Gen3 Framework Services
    subtitle: User authentication with data object and metadata indexing.
    button:
      link: /products/framework-services
    contents:
      c1:
        name: Object Indexing
        fig: /figs/features/index.svg
      c2:
        name: AuthN/AuthZ
        fig: /figs/features/auth.svg
      c3:
        name: Metadata Service
        fig: /figs/features/mds.svg
  f2:
    title: Gen3 Data Commons
    subtitle: Data management with web portal and integrated workspaces.
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
    title: Gen3 Workspaces
    subtitle: Secure, cloud-based data analysis environments.
    button:
      link: /products/workspaces
    contents:
      c1:
        name: RStudio
        fig: /figs/features/rstudio.svg
      c2:
        name: Jupyter Notebooks
        fig: /figs/features/jupyter.svg
      c3:
        name: Custom Apps
        fig: /figs/features/visualization.svg
g3Entrance:
  e1:
    title: View the Gen3 Codebase
    detail: Visit the code repositories in GitHub
    button:
      caption: Learn
      link: https://github.com/uc-cdis
  e2:
    title: Get Started Easily
    detail: View tutorials on using Gen3, including setup and configuration.
    button:
      caption: Easy Start
      link: /get-started
---

<section class="g3-bg__mint">
  <div class="g3-outer-wrapper g3-flex-content g3-flex-content__reverse">
    <div class="g3-col__50 g3-flex-content g3-space__padding-md-top g3-mb-space__padding-lg-top">
      <img class="g3-img__full-width" src="{{< param "g3Teaser.fig" >}}"/>
    </div>
    <div class="g3-space__padding-lg-top g3-space__padding-lg-bottom g3-col__50">
      <div class="g3-space__wrapper-gap-left">
        <h1 class="g3-space__margin-sm-bottom">
          {{< param "g3Teaser.title" >}}
        </h1>
        <p class="g3-space__margin-sm-bottom introduction">
          {{< param "g3Teaser.detail" >}}
        </p>
        <br>
        <p class="g3-space__margin-sm-bottom introduction">
          {{< param "g3Teaser.para1" >}}
        </p>
        <br>
        <p class="g3-space__margin-sm-bottom introduction">
          {{< param "g3Teaser.para2" >}}
        </p>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="g3-space__margin-lg-bottom g3-inner-wrapper">
    <div class="g3-flex-content g3-flex-content__col g3-space__margin-md-top-bottom">
      <div class="g3-flex-content g3-flex-content__col g3-space__margin-sm-left-right g3-box">
        <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f0.title" >}}</h3>
        <p>
          {{< param "g3DataFeature.f0.subTitle" >}}
        </p>
        <a class="g3-button g3-button--tertiary g3-flex-content_alien-self-flex-end" href="{{< param "g3DataFeature.f0.button.link" >}}" ">
            Learn More
        </a>
      </div>
      <div class="g3-flex-content g3-space__margin-md-top-bottom">
        <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
          <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f1.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f1.subTitle" >}}
          </p>
          <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
          <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center g3-flex-content_space-between">
            <img class="g3-row__10vh" src="{{< param "g3DataFeature.f1.contents.c1.fig" >}}" />
            <p class="introduction">
              {{< param "g3DataFeature.f1.contents.c1.name" >}}
            </p>
          </div>
          <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center g3-flex-content_space-between">
            <img class="g3-row__10vh" src="{{< param "g3DataFeature.f1.contents.c2.fig" >}}" />
            <p class="introduction">
              {{< param "g3DataFeature.f1.contents.c2.name" >}}
            </p>
          </div>
          <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center g3-flex-content_space-between">
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
          <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center g3-flex-content_space-between">
            <img class="g3-row__10vh" src="{{< param "g3DataFeature.f2.contents.c1.fig" >}}" />
            <p class="introduction">
              {{< param "g3DataFeature.f2.contents.c1.name" >}}
            </p>
          </div>
          <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center g3-flex-content_space-between">
            <img class="g3-row__10vh" src="{{< param "g3DataFeature.f2.contents.c2.fig" >}}" />
            <p class="introduction">
              {{< param "g3DataFeature.f2.contents.c2.name" >}}
            </p>
          </div>
          <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center g3-flex-content_space-between">
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
          <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center g3-flex-content_space-between">
            <img class="g3-row__10vh" src="{{< param "g3DataFeature.f3.contents.c1.fig" >}}" />
            <p class="introduction">
              {{< param "g3DataFeature.f3.contents.c1.name" >}}
            </p>
          </div>
          <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center g3-flex-content_space-between">
            <img class="g3-row__10vh" src="{{< param "g3DataFeature.f3.contents.c2.fig" >}}" />
            <p class="introduction">
              {{< param "g3DataFeature.f3.contents.c2.name" >}}
            </p>
          </div>
          <div class="g3-space__margin-md-top-bottom g3-flex-content g3-flex-content_center g3-flex-content_space-between">
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
