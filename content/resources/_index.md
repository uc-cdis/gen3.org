---
identifier: resources
title: Gen3 - Resources
linktitle: resources
date: 2018-09-04T22:16:21-05:00
g3Resources:
  title: Gen3 Resources
  r1:
    name: Gen3 User Guide
    fig: /figs/roles/icon-bio.svg
    detail: You’re using a Gen3 data commons for research or cohort discovery.
    button:
      caption: Documentation
      link: /resources/user
    lists:
      - title: User Introduction
        ul:
          - name: How to contribute a data project to a Gen3 Data Commons
            link: /resources/user/submit-data
          - name: How to access data in a Gen3 Data Commons
            link: /resources/user/access-data
          - name: How to analyze data in the Jupyter Workspace
            link: /resources/user/analyze-data
      - title: Appendices
        ul:
          - name: Types of data in a Gen3 Data Commons
            link: /resources/user/data-types
          - name: Using the gen3-client command-line tool
            link: /resources/user/gen3-client
          - name: Working with the API
            link: /resources/user/using-api
          - name: Data Dictionary
            link: /resources/user/dictionary
          - name: Template Metadata TSVs
            link: /resources/user/template-tsvs
          - name: Managing Submission Timepoints
            link: /resources/user/manage-submission
          - name: Query the Data
            link: /resources/user/query-data
  r2:
    name: Gen3 Operator
    fig: /figs/roles/icon-research.svg
    detail: You’re setting up or maintaining your own Gen3 data commons or ecosystem.
    button:
      caption: Documentation
      link: /resources/operator
    lists:
      - title: Technical Introduction
        ul:
          - name: How to Setup Gen3
            link: /resources/operator
  r3:
    name: Developer
    fig: /figs/roles/icon-devs.svg
    detail: You’re interested in contributing to Gen3’s open source code or developing an app.
    button:
      caption: Documentation
      link: /resources/developer
    lists:
      - title: Technical Introduction
        ul:
          - name: Introduction of Gen3’s microservices
            link: /resources/developer/microservice
          - name: Introduction of technology
            link: /resources/developer/
      - title: Build Apps on Gen3
        ul:
          - name: Authentication
            link: /resources/developer/build-app#1-authentication
          - name: GraphQL Queries
            link: /resources/developer/build-app#2-graphql-queries
          - name: Retrieve the Dictionary JSON Schema
            link: /resources/developer/build-app#4-retrieve-the-dictionary-json-schema
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
