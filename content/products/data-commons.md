---
identifier: products/data-commons
title: Gen3 - Products - Data Commons
linktitle: /products/data-commons
date: 2021-01-08
g3Teaser:
  title: Data Commons
  detail: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
g3Feature:
  f1:
    title: Data Search
    fig: /figs/features/search.svg
    detail: Gen3 features a friendly GraphQL API for searching and discovering data. The GraphQL API enables faceted and precise searching through the flexible data model. Search capabilities enable quick and easy creation of virtual cohorts that can be exported to a manifest for data download.
  f2:
    title: Data Submission
    fig: /figs/features/submit-data.svg
    detail: Gen3 supports data submission including clinical attributes, phenotypic information, and data files. The submissions are validated against the data dictionary to ensure all required fields are present and have appropriate data values.
  f3:
    title: Data Portal
    fig: /figs/features/portal.svg
    detail: Gen3 includes a data portal as a default application over a commons. The portal is an interactive website that allows users to explore, submit, and download data. The data portal utilizes the public APIs offered by the data commons as a demonstration to the power of Gen3.
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
      </div>
    </div>
  </div>
</section>

<section>
  <div class="g3-space__margin-lg-bottom g3-inner-wrapper">
    <div class="g3-flex-content g3-space__margin-md-top-bottom g3-space__margin-sm-left-right">
      <div class="g3-col__35 g3-flex-content g3-flex-content_center">
        <img src="{{< param "g3Feature.f1.fig" >}}" />
      </div>
      <div class="g3-col__65 g3-flex-content g3-flex-content__col">
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f1.title" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f1.detail" >}}
        </p>
      </div>
    </div>
    <div class="g3-flex-content g3-space__margin-md-top-bottom g3-space__margin-sm-left-right">
      <div class="g3-col__65 g3-flex-content g3-flex-content__col">
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f2.title" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f2.detail" >}}
        </p>
      </div>
      <div class="g3-col__35 g3-flex-content g3-flex-content_center">
        <img src="{{< param "g3Feature.f2.fig" >}}" />
      </div>
    </div>
    <div class="g3-flex-content g3-space__margin-md-top-bottom g3-space__margin-sm-left-right">
      <div class="g3-col__35 g3-flex-content g3-flex-content_center">
        <img src="{{< param "g3Feature.f3.fig" >}}" />
      </div>
      <div class="g3-col__65 g3-flex-content g3-flex-content__col">
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
