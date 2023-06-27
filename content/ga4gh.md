---
identifier: ga4gh
title: GA4GH standards employed by Gen3
linktitle: ga4gh
date: 2023-06-20
g3Teaser:
  title: GA4GH Standards
  fig: /figs/ga4gh.svg
  detail: Text entered in html below
g3Feature:
  f1:
    title: Data Repository Service (DRS)
    detail: See html below
  f2:
    title: Passports and Visas
    detail: See html below
  f3:
    title: Data Connect
    detail: See html below
  f4:
    title: Task Execution Service (TES)
    detail: See html below

---

<section class="g3-bg__white">
  <div class="g3-outer-wrapper g3-flex-content g3-flex-content__reverse">
    <div class="g3-col__50 g3-flex-content_alien-self-flex-end g3-space__padding-md-bottom g3-space__margin-lg-top-bottom g3-space__wrapper-gap-right">
    <a href="https://www.ga4gh.org/"> <img class="g3-img__bottom_pad" src="{{< param "g3Teaser.fig" >}}" > </a>
    </div>
    <div class="g3-space__padding-lg-top g3-space__padding-lg-bottom g3-col__45">
      <div class="g3-space__wrapper-gap-left">
        <h1 class="g3-space__margin-sm-bottom">
          {{< param "g3Teaser.title" >}}
        </h1>
        <p class="g3-space__margin-sm-bottom introduction g3-space__margin-sm-right">
          GA4GH is an international standards setting body for Genomics and Health. Gen3 aims to follow GA4GH standards whenever possible in order to improve our interoperability with other systems and to simplify the use of a Gen3 Data Commons. Gen3 works closely with GA4GH in multiple ways:  first, through its use by the Data Commons Framework Services project, which underpins interoperability within the Cancer Research Data Commons (a GA4GH driver project) and second, through our close relationship with a sister project - the NCI Genomic Data Commons (also a GA4GH driver project).  Some of the areas where we are active are highlighted below.
        </p>
      </div>
    </div>
  </div>
</section>


<section>
  <div class="g3-inner-wrapper">
    <h1> GA4GH Products Included in Gen3</h1>
  </div>
  <div class="g3-inner-wrapper g3-flex-content g3-space__padding-sm-top ">
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left">
        <h3>{{< param "g3Feature.f1.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          The <a href="https://www.ga4gh.org/product/data-repository-service-drs/">Data Repository Service (DRS)</a> API provides a generic interface to data repositories so data consumers, including workflow systems, can access data in a single, standard way regardless of where it is stored and how it is managed. The DRS standard is incorporated into our fence and IndexD services.
        </p>
      </div>
    </div>
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left">
        <h3>{{< param "g3Feature.f2.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          The <a href="https://www.ga4gh.org/product/ga4gh-passports/">Passports</a> specification provides a data model for encoding information about the researcher, along with their acquired data access permissions, in a way that cannot be tampered with and enables data access between platforms. Once a platform has issued a visa to your passport you can use that passport to bring your data to yet another platform.  Our Fence service supports RAS, which is an NIH implementation of Passports
        </p>
      </div>
    </div>
  </div>
  <div class="g3-inner-wrapper g3-flex-content g3-space__padding-sm-top">
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left">
        <h3>{{< param "g3Feature.f3.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          <a href="https://www.ga4gh.org/product/data-connect/">Data Connect</a> is a standard for discovery and search of biomedical data.  It shares metadata about an identifier. The Gen3 Metadata Service (MDS) is very close to this standard and will be fully compatible soon.
        </p>
      </div>
    </div>
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left">
        <h3>{{< param "g3Feature.f4.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          The <a href="https://www.ga4gh.org/product/task-execution-service-tes/">Task Execution Service (TES)</a> API is a standardized schema and API for describing and executing batch execution tasks.  Gen3 is working to incorporate this standard into our own workflow execution service.
        </p>
      </div>
    </div>
  </div>
  <div class="g3-inner-wrapper g3-flex-content g3-space__padding-lg-bottom">
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left g3-space__margin-sm-right">
        <h3>{{< param "g3Feature.f5.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          {{< param "g3Feature.f5.detail" >}}
        </p>
      </div>
    </div>
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left g3-space__margin-sm-right">
        <h3>{{< param "g3Feature.f6.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          {{< param "g3Feature.f6.detail" >}}
        </p>
      </div>
    </div>
  </div>
</section>
