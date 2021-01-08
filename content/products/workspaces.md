---
identifier: products/workspaces
title: Gen3 - Products - Workspaces
linktitle: /products/workspaces
date: 2021-01-08
g3Teaser:
  title: Workspaces
  detail: Gen3 workspaces are secure data analysis environments in the cloud that can access data from one or more data resources, including Gen3 Data Commons. Workspaces are often fully integrated with a specific data commons, and coming soon are workspaces as stand-alone analysis environments with a user pay model.
  para1: Gen3 Workspaces use the Gen3 Framework Services for user authentication and authorization and for retrieving data objects and metadata from data resources, like Gen3 Data Commons.
  para2: By default Gen3 Workspaces include Jupyter notebooks and RStudio. Workspaces can be further configured to offer a variety of analysis environment "flavors", pre-loaded with various custom applications. Virtually any application can be integrated into a Gen3 Workspace, like analysis workflows, data processing pipelines, or data visualization apps.
g3Feature:
  f1:
    title: RStudio
    fig: /figs/features/rstudio.svg
    detail: Gen3 Workspaces come pre-configured with RStudio, a development environment for the statistical programming language R. Scripts saved in the workspace persist after logging out and can be shared with colleagues for collaborative analyses.
  f2:
    title: Jupyter Notebooks
    fig: /figs/features/jupyter.svg
    detail: Gen3 Workspaces come with the ability to create, upload, modify and run Jupyter Notebooks by default, which are interactive documents that allow you to create and share live code, equations, visualizations and narrative text.
  f3:
    title: Custom Applications
    fig: /figs/features/visualization.svg
    detail: When a user logs into a Gen3 Workspace, they have the option to spin up on of a variety of docker images pre-loaded with tools for various analysis functions. Virtually any custom application that can be loaded onto a virtual machine (VM) image can be integrated into a Gen3 Workspace, including analysis workflows, processing pipelines, and visualization apps.
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
