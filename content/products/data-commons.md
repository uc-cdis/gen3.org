---
identifier: products/data-commons
title: Gen3 - Products - Data Commons
linktitle: /products/data-commons
date: 2021-01-08
g3Teaser:
  title: Data Commons
  detail: Gen3 Data Commons are cyberinfrastructure that co-locates data analysis, exploration and visualization tools with data management services for import and export of structured information like clinical, phenotypic, or biospecimen data, and data objects, like genomics data files or medical images. Gen3 Data Commons are capable of interoperation with other resources in a data ecosystem by utilizing the Gen3 Framework Services for user authentication and authorization, data object indexing, and metadata services.
g3Feature:
  f1:
    title: Data Search
    fig: /figs/features/search.svg
    detail: Gen3 data commons offer several methods for finding and querying stored data. The data portal boasts a built-in data exploration GUI, featuring faceted search for quick and easy creation of virtual patient cohorts and data object subsets. There is also a GraphiQL query building interface, which allows users to create and send custom queries to the Gen3 databases. The open APIs that power these built-in user interfaces in the data portal can also be sent custom query requests, enabling programmatic data search and custom app development.
  f2:
    title: Data Management
    fig: /figs/features/submit-data.svg
    detail: Gen3 data commons support complete data management functionality, including data access control, ingestion, export, and quality control. Data access is controlled through an attribute-based access control (ABAC) policy engine. Data object indexing and associating objects with metadata is possible both within the web-based portal and from the command line by sending requests to the data submission API. Data quality is controlled through implementing a data model against which submissions are validated to ensure all required fields are present and have appropriate values.
  f3:
    title: Data Portal
    fig: /figs/features/portal.svg
    detail: Gen3 data commons include a data portal as a default application over a commons. The portal is an interactive website, accessible through standard web-browsers, that allows users to explore, submit, download, and analyze data. The data portal utilizes the open Gen3 APIs to offer a graphical user interface for the basic functionality of a Gen3 data commons.
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
