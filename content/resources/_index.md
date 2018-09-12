---
identifier: resources
title: GEN3 resources
linktitle: resources
date: 2018-09-04T22:16:21-05:00
draft: true
g3Roles:
  title: Gen3 helps you as...
  r1:
    name: Gen3 User Guide
    fig: /img/fig/about/icon-bio.svg
    detail: Ask biomedical questions, report issues, discuss Gen3, or reach our for helps.
    button:
      caption: Documentation
      link: http://localhost
  r2:
    name: Gen3 Operator
    fig: /img/fig/about/icon-research.svg
    detail: Ask biomedical questions, report issues, discuss Gen3, or reach our for helps.
    button:
      caption: Documentation
      link: http://localhost
  r3:
    name: Developer
    fig: /img/fig/about/icon-devs.svg
    detail: Follow the documentation to setup Gen3 easily to benefit your research.
    button:
      caption: Gen3 Developer
      link: http://localhost
---

<section >
  <div class="g3-inner-wrapper g3-space__padding-md-top g3-space__padding-lg-bottom g3-mb-space__padding-lg-top g3-mb-space__padding-lg-bottom">
    <div class="g3-flex-content">
      <div class="g3-col__33 g3-text__center g3-space__margin-sm-left-right">
        <img class="g3-space__margin-sm-bottom" src="{{< param "g3Roles.r1.fig" >}}"/>
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r1.name" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r1.detail" >}}
        </p>
        <a class="g3-button g3-button--primary" href="{{< param "g3Roles.r1.button.link" >}}">
          {{< param "g3Roles.r1.button.caption" >}}
        </a>
      </div>
      <div class="g3-col__33 g3-text__center g3-space__margin-sm-left-right">
        <img class="g3-space__margin-sm-bottom" src="{{< param "g3Roles.r2.fig" >}}"/>
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r2.name" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r2.detail" >}}
        </p>
        <a class="g3-button g3-button--primary" href="{{< param "g3Roles.r2.button.link" >}}">
          {{< param "g3Roles.r2.button.caption" >}}
        </a>
      </div>
      <div class="g3-col__33 g3-text__center g3-space__margin-sm-left-right">
        <img class="g3-space__margin-sm-bottom" src="{{< param "g3Roles.r3.fig" >}}"/>
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r3.name" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r3.detail" >}}
        </p>
        <a class="g3-button g3-button--primary" href="{{< param "g3Roles.r3.button.link" >}}">
          {{< param "g3Roles.r3.button.caption" >}}
        </a>
      </div>
    </div>
  </div>
</section>