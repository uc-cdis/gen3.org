---
identifier: tutorials
title: Gen3 - Tutorials
linktitle:
date: 2022-06-22T22:16:21-05:00
g3Teaser:
  fig: /figs/webinar.svg
  title: Gen3 Tutorials
  detail: Tutorials of interest to the Gen3 community will be periodically created and posted here.  If you would like to contribute your own tutorial or have ideas for a tutorial please reach out!


g3past:
- Title: "Gen3 Helm Charts: SSL, Permissions, Test Data, and Tabs Explained!"
  Date: December 9, 2024
  Description: |
     <p>Dive deep into Gen3 Helm Charts in this comprehensive guide! In this video, we’ll cover everything you need to know, including:</p>
     <ul>
       <li>How to generate SSL certificates for secure communication</li>
       <li>Updating permissions to ensure seamless access control</li>
       <li>Submitting test data to validate your configurations</li>
       <li>Enabling persistence for data continuity</li>
       <li>Configuring the Workspace Tab for launching notebooks</li>
       <li>Configuring the Exploration Tab for advanced data discovery</li>
     </ul>
  Youtube: MnBxqE9gm6I
- Title: Install Gen3 with Kind & Helm
  Date: December 6, 2024
  Description: Quickly set up a Gen3 data commons on your laptop using Kind and Gen3 Helm charts! This easy-to-follow guide walks you through deploying a fully functional data commons locally.
  Youtube: CFxdmFt-nIw
- Title: Install Gen3 with Minikube & Helm
  Date: December 6, 2024
  Description: Quickly set up a Gen3 data commons on your laptop using Minikube and Gen3 Helm charts! This easy-to-follow guide walks you through deploying a fully functional data commons locally.
  Youtube: nDL1DrtJqBk



---

<section class="g3-bg__mint">
  <div class="g3-outer-wrapper g3-flex-content g3-flex-content__reverse">
    <div class="g3-col__65 g3-flex-content g3-mb-space__padding-lg-top g3-space__margin-md-top-bottom">
      <img class="g3-img__full-height" src="{{< param "g3Teaser.fig" >}}"/>
    </div>
    <div class="g3-space__padding-lg-top g3-space__padding-lg-bottom g3-col__65">
      <div class="g3-space__wrapper-gap-left g3-space__wrapper-gap-right">
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


<!--
<section class="g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-inner-wrapper">
        <h2>Upcoming Events</h2>
    </div>
</section>
-->


{{< events "g3past" >}}
