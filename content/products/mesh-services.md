---
identifier: products/mesh-services
title: Gen3 - Products - Mesh Services
linktitle: /products/mesh-services
date: 2021-01-08
aliases: /products/framework-services
g3Teaser:
  title: Gen3 Mesh Services
  detail: The Gen3 Mesh Services are a minimal set of software services that provide open APIs for indexing data objects, associating metadata with the data objects, and controlling user access to data via a robust and flexible access control policy engine.
  para1: Data resources using the Gen3 Mesh Services get the minimal backend functionality necessary for managing data and controlling user access to it. Specifically, the services included in the Gen3 Mesh Services are those for data object indexing, storing and associating metadata with data objects, and user authentication and authorization.  Mesh services support both data commons and data meshes.
g3Feature:
  f1:
    title: Object Indexing
    fig: /figs/features/index.svg
    detail: The Gen3 data object indexing service mints permanent digital IDs, called data GUIDs (globally unique IDs), for data objects. The service tracks the physical locations and hash of every asset (file) in the data commons object store. The Gen3 platform includes landing pages which support FAIR descriptions of the data objects.
  f2:
    title: User Authentication and Authorization
    fig: /figs/features/auth.svg
    detail: The Gen3 Framework Services include software services for user authentication and fine-grained authorization to services, metadata, and data objects via a flexible access control policy engine. Gen3 utilizes OpenID Connect for providing AuthN services with AuthZ specified on a per commons basis. Currently supported identity providers include Google and Shibboleth, supporting providers such as NIH iTrust, InCommon Federation, and eduGAIN.
  f3:
    title: Metadata Service
    fig: /figs/features/mds.svg
    detail: The Gen3 metadata service provides support for arbitrary JSON blobs attached to globally unique identifiers (GUIDs). This provides a simple and flexible way to add additional, non-schema-enforced metadata into the system without the need for a fully-fledged, harmonized data model.
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
      <div class="g3-col__35 g3-flex-content g3-flex-content_center g3-flex-content_flex-start">
        <img class="g3-col__70" src="{{< param "g3Feature.f1.fig" >}}" />
      </div>
      <div class="g3-col__65 g3-flex-content g3-flex-content__col g3-flex-content__col-center">
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f1.title" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f1.detail" >}}
        </p>
        <br>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f1.para1" >}}
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
      <div class="g3-col__35 g3-flex-content g3-flex-content_center g3-flex-content_flex-start g3-flex-content__reverse">
        <img class="g3-col__70" src="{{< param "g3Feature.f2.fig" >}}" />
      </div>
    </div>
    <div class="g3-flex-content g3-space__margin-md-top-bottom g3-space__margin-sm-left-right">
      <div class="g3-col__35 g3-flex-content g3-flex-content_center g3-flex-content_flex-start">
        <img class="g3-col__70" src="{{< param "g3Feature.f3.fig" >}}" />
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
