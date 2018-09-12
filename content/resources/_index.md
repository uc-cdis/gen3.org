---
identifier: resources
title: GEN3 resources
linktitle: resources
date: 2018-09-04T22:16:21-05:00
g3Resources:
  title: Gen3 Resources
  r1:
    name: Gen3 User Guide
    fig: /img/fig/about/icon-bio.svg
    detail: Ask biomedical questions, report issues, discuss Gen3, or reach our for helps.
    button:
      caption: Documentation
      link: http://localhost
    lists:
      - title: User Intro
        ul: 
          - name: How to contribute a data project to a Gen3 Data Commons
            link: http://localhost
          - name: How to access data in a Gen3 Data Commons
            link: http://localhost
          - name: How to analyze data in the Jupyter Workspace
            link: http://localhost
      - title: Appendices
        ul:
          - name: Using the CDIS data client
            link: http://localhost
          - name: Working with the API
            link: http://localhost
          - name: Working with the Proxy and Whitelist
            link: http://localhost
          - name: Data Dictionary Viewer
            link: http://localhost
          - name: Template Metadata TSVs
            link: http://localhost
          - name: Managing Submission Timepoints
            link: http://localhost
  r2:
    name: Gen3 Operator
    fig: /img/fig/about/icon-research.svg
    detail: Ask biomedical questions, report issues, discuss Gen3, or reach our for helps.
    button:
      caption: Documentation
      link: http://localhost
    lists:
      - title: Techniques Intro
        ul: 
          - name: How to Setup Gen3
            link: http://localhost
          - name: Meduim
            link: http://localhost
  r3:
    name: Developer
    fig: /img/fig/about/icon-devs.svg
    detail: Follow the documentation to setup Gen3 easily to benefit your research.
    button:
      caption: Gen3 Developer
      link: http://localhost
    lists:
      - title: Techniques Intro
        ul: 
          - name: Introduction of Gen3’s micro services
            link: http://localhost
          - name: Introduction of technology
            link: http://localhost
          - name: UI Library
            link: http://localhost
      - title: Build Apps on Gen3
        ul: 
          - name: Authentication
            link: http://localhost
          - name: GraphQL Queries
            link: http://localhost
          - name: Retrieve the Dictionary JSON Schema
            link: http://localhost
          - name: Using SDK
            link: http://localhost
---

<section >
  <div class="g3-inner-wrapper g3-space__padding-md-top g3-space__padding-lg-bottom g3-mb-space__padding-lg-top g3-mb-space__padding-lg-bottom">
    <div class="g3-flex-content">
      <div class="g3-col__33 g3-space__margin-sm-left-right">
        <div class="g3-text__center g3-border__wider g3-space__padding-sm">
          <img class="g3-space__margin-sm-bottom g3-space__margin-sm-top" src="{{< param "g3Resources.r1.fig" >}}"/>
          <h3 class="g3-space__margin-sm-bottom">
            {{< param "g3Resources.r1.name" >}}
          </h3>
          <p class="g3-space__margin-sm-bottom">
            {{< param "g3Resources.r1.detail" >}}
          </p>
          <a class="g3-button g3-button--primary g3-space__margin-sm-bottom" href="{{< param "g3Resources.r1.button.link" >}}">
            {{< param "g3Resources.r1.button.caption" >}}
          </a>
        </div>
        <div class="g3-bg__solight g3-space__padding-sm">
            {{< makelist "g3Resources.r1.lists" >}}
        </div>
      </div>
      <div class="g3-col__33 g3-space__margin-sm-left-right">
        <div class="g3-text__center g3-border__wider g3-space__padding-sm">
          <img class="g3-space__margin-sm-bottom g3-space__margin-sm-top" src="{{< param "g3Resources.r2.fig" >}}"/>
          <h3 class="g3-space__margin-sm-bottom">
            {{< param "g3Resources.r2.name" >}}
          </h3>
          <p class="g3-space__margin-sm-bottom">
            {{< param "g3Resources.r2.detail" >}}
          </p>
          <a class="g3-button g3-button--primary g3-space__margin-sm-bottom" href="{{< param "g3Resources.r2.button.link" >}}">
            {{< param "g3Resources.r2.button.caption" >}}
          </a>
        </div>
        <div class="g3-bg__solight g3-space__padding-sm">
          {{< makelist "g3Resources.r2.lists" >}}
        </div>
      </div>
      <div class="g3-col__33 g3-space__margin-sm-left-right">
        <div class="g3-text__center g3-border__wider g3-space__padding-sm">
          <img class="g3-space__margin-sm-bottom g3-space__margin-sm-top" src="{{< param "g3Resources.r3.fig" >}}"/>
          <h3 class="g3-space__margin-sm-bottom">
            {{< param "g3Resources.r3.name" >}}
          </h3>
          <p class="g3-space__margin-sm-bottom">
            {{< param "g3Resources.r3.detail" >}}
          </p>
          <a class="g3-button g3-button--primary g3-space__margin-sm-bottom" href="{{< param "g3Resources.r3.button.link" >}}">
            {{< param "g3Resources.r3.button.caption" >}}
          </a>
        </div>
        <div class="g3-bg__solight g3-space__padding-sm">
            {{< makelist "g3Resources.r3.lists" >}}
        </div>
      </div>
    </div>
  </div>
</section>