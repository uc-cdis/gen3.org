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
    title: Data Search
    fig: /figs/features/search.svg
    detail: Some texts about Gen3 Data Ecosystems feature 1.
  f2:
    title: Data Management
    fig: /figs/features/submit-data.svg
    detail: Some texts about Gen3 Data Ecosystems feature 2.
  f3:
    title: Data Portal
    fig: /figs/features/portal.svg
    detail: Some texts about Gen3 Data Ecosystems feature 3.
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
        <p class="g3-space__margin-sm-bottom introduction">
          {{< param "g3Teaser.para1" >}}
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
      <div class="g3-col__65 g3-flex-content g3-flex-content__col g3-flex-content__col-center ">
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f1.title" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Feature.f1.detail" >}}
        </p>
      </div>
    </div>
    <div class="g3-flex-content g3-space__margin-md-top-bottom g3-space__margin-sm-left-right">
      <div class="g3-col__65 g3-flex-content g3-flex-content__col g3-flex-content__col-center ">
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
      <div class="g3-col__65 g3-flex-content g3-flex-content__col g3-flex-content__col-center ">
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
