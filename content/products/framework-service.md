---
identifier: products/framework-service
title: Gen3 - Products - Framework Services
linktitle: products/framework-service
date: 2021-01-08
g3Teaser:
  title: Framework Services
  detail: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
g3Feature:
  f1:
    title: Object Index
    fig: /figs/features/index.svg
    detail: Gen3 provides permanent data GUIDs (globally unique IDs) for data objects. The service tracks the physical locations and hash of every asset (file) in the data commons object store. The Gen3 platform includes landing pages which support FAIR descriptions of the data objects.
  f2:
    title: AuthN/AuthZ
    fig: /figs/features/auth.svg
    detail: Gen3 utilizes OpenID Connect for providing AuthN services with AuthZ specified on a per commons basis. Currently supported identity providers include Google and Shibboleth, supporting providers such as NIH iTrust, InCommon Federation, and eduGAIN.
  f3:
    title: Metadata Service
    fig: /figs/features/mds.svg
    detail: Gen3 utilizes OpenID Connect for providing AuthN services with AuthZ specified on a per commons basis. Currently supported identity providers include Google and Shibboleth, supporting providers such as NIH iTrust, InCommon Federation, and eduGAIN.
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
