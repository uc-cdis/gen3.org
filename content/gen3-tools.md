---
identifier: gen3-tools
title: Gen3 Tools
linktitle: gen3-tools
date: 2023-07-11
g3Teaser:
  title: Gen3 Tools
  detail: Gen3 community members have created tools that facilitate interactions with a Gen3 Data Commons. These tools may be of use to users or operators.
g3Starts:
  title: Get Started
  s1:
    name: Gen3 SDK for Python
    fig: /figs/UChicago_CTDS_Vertical_Color RGB.svg
    detail: The Gen3 Software Development Kit (SDK) for Python provides classes and functions for handling common tasks when interacting with a Gen3 commons. It also exposes a Command Line Interface (CLI).  Created by the Center for Translational Data Science at the University of Chicago.
    button:
      caption: GitHub
      link: https://github.com/uc-cdis/gen3sdk-python
  s2:
    name: gen3schemadev
    fig: /figs/Australian-Biocommons-Logo-Horizontal-144dpi-Transparent.png
    detail: A python tool that uses Google Sheets for simple, automated and efficient dictionary development.  The Gen3 schema mapping library enables an automated workflow to edit, test, validate and publish Gen3 Data Dictionaries, using a google sheet as input.  Created by the Australian BioCommons.
    button:
      caption: GitHub
      link: https://github.com/AustralianBioCommons/gen3schemadev



---

<section class="g3-bg__solight">
   <h1 class="g3-text__center g3-space__padding-md-top-bottom">
      {{< param "g3Teaser.title" >}}
   </h1>
   <h3 class="g3-text__center g3-space__padding-md-left g3-space__padding-md-bottom">
      {{< param "g3Teaser.detail" >}}
   </h3>
</section>
<section>
  <div class="g3-inner-wrapper g3-space__padding-md-top g3-space__padding-lg-bottom g3-mb-space__padding-lg-top g3-mb-space__padding-lg-bottom">
    <div class="g3-table g3-space__margin-lg-bottom g3-mb-space__margin-lg-bottom">
      <div class="g3-col__50 g3-text__center g3-space__padding-sm-left-right">
        <img class="g3-row__10vh g3-space__margin-sm-bottom" src="{{< param "g3Starts.s1.fig" >}}"/>
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Starts.s1.name" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom g3-text__desktop-left">
          {{< param "g3Starts.s1.detail" >}}
        </p>
        <a class="g3-button g3-button--primary g3-align__bottom" href="{{< param "g3Starts.s1.button.link" >}}">
          {{< param "g3Starts.s1.button.caption" >}}
        </a>
      </div>
      <div class="g3-table g3-space__margin-lg-bottom g3-mb-space__margin-lg-bottom">
        <div class="g3-col__50 g3-text__center g3-space__padding-sm-left-right">
          <img class="g3-row__10vh g3-space__margin-sm-bottom" src="{{< param "g3Starts.s2.fig" >}}"/>
          <h3 class="g3-space__margin-sm-bottom">
            {{< param "g3Starts.s2.name" >}}
          </h3>
          <p class="g3-space__margin-sm-bottom g3-text__desktop-left">
            {{< param "g3Starts.s2.detail" >}}
          </p>
          <a class="g3-button g3-button--primary g3-align__bottom" href="{{< param "g3Starts.s1.button.link" >}}">
            {{< param "g3Starts.s2.button.caption" >}}
          </a>
        </div>
    </div>
    </div>
  </div>
</section>
