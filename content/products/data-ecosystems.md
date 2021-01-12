---
identifier: products/data-ecosystems
title: Gen3 - Products - Data Ecosystems
linktitle: /products/data-ecosystems
date: 2021-01-08
g3Teaser:
  title: Gen3 Data Ecosystems
  detail: Some texts about Gen3 Data Ecosystems
  para1: Some texts about Gen3 Data Ecosystems
g3Feature:
  f1:
    title: Gen3 Framework Services
    detail: The Gen3 Framework Services are a minimal set of software services that provide open APIs for indexing data objects, associating metadata with the data objects, and controlling user access to data via a robust and flexible access control policy engine.
    fig1: /figs/features/index.svg
    fig2: /figs/features/auth.svg
    fig3: /figs/features/mds.svg
  f2:
    title: Gen3 Data Commons
    detail: Gen3 Data Commons are cyberinfrastructure that co-locates data analysis, exploration and visualization tools with data management services for import and export of structured information like clinical, phenotypic, or biospecimen data, and data objects, like genomics data files or medical images.
    fig1: /figs/features/search.svg
    fig2: /figs/features/submit-data.svg
    fig3: /figs/features/portal.svg
  f3:
    title: Workspaces
    detail: Gen3 workspaces are secure data analysis environments in the cloud that can access data from one or more data resources, including Gen3 Data Commons. Workspaces are often fully integrated with a specific data commons, and coming soon are workspaces as stand-alone analysis environments with a user pay model.
    fig1: /figs/features/rstudio.svg
    fig2: /figs/features/jupyter.svg
    fig3: /figs/features/visualization.svg
---

<section class="g3-bg__yellow">
  <div class="g3-outer-wrapper g3-flex-content">
    <div class="g3-space__padding-lg-top g3-space__padding-lg-bottom g3-col__65">
      <div class="g3-space__wrapper-gap-left">
        <h1 class="g3-space__margin-sm-bottom">
          {{< param "g3Teaser.title" >}}
        </h1>
        <p class="g3-space__margin-sm-bottom introduction">
          {{< param "g3Teaser.detail" >}}
        </p>
        <br>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="g3-space__margin-lg-bottom g3-inner-wrapper">
    <div class="g3-flex-content g3-space__margin-md-top-bottom g3-space__margin-sm-left-right">
      <div class="g3-col__35 g3-flex-content g3-flex-content_center g3-flex-content_space-between g3-space__padding-md-right">
        <img class="g3-col__25" src="{{< param "g3Feature.f1.fig1" >}}" />
        <img class="g3-col__25" src="{{< param "g3Feature.f1.fig2" >}}" />
        <img class="g3-col__25" src="{{< param "g3Feature.f1.fig3" >}}" />
      </div>
      <div class="g3-col__65 g3-flex-content g3-flex-content__col g3-flex-content__col-center">
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f1.title" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f1.detail" >}}
        </p>
      </div>
    </div>
    <div class="g3-flex-content g3-space__margin-md-top-bottom g3-space__margin-sm-left-right">
      <div class="g3-col__65 g3-flex-content g3-flex-content__col g3-flex-content__col-center">
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f2.title" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f2.detail" >}}
        </p>
      </div>
      <div class="g3-col__35 g3-flex-content g3-flex-content_center g3-flex-content_space-between g3-space__padding-md-left g3-flex-content__reverse">
        <img class="g3-col__25" src="{{< param "g3Feature.f2.fig1" >}}" />
        <img class="g3-col__25" src="{{< param "g3Feature.f2.fig2" >}}" />
        <img class="g3-col__25" src="{{< param "g3Feature.f2.fig3" >}}" />
      </div>
    </div>
    <div class="g3-flex-content g3-space__margin-md-top-bottom g3-space__margin-sm-left-right">
      <div class="g3-col__35 g3-flex-content g3-flex-content_center g3-flex-content_space-between g3-space__padding-md-right">
        <img class="g3-col__25" src="{{< param "g3Feature.f3.fig1" >}}" />
        <img class="g3-col__25" src="{{< param "g3Feature.f3.fig2" >}}" />
        <img class="g3-col__25" src="{{< param "g3Feature.f3.fig3" >}}" />
      </div>
      <div class="g3-col__65 g3-flex-content g3-flex-content__col g3-flex-content__col-center">
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f3.title" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f3.detail" >}}
        </p>
      </div>
    </div>
  </div>
</section>
