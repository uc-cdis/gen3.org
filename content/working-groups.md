---
identifier: working-groups
title: Working Groups
linktitle: working-groups
date: 2024-10-14
g3Teaser:
  title: Gen3 Working Groups
  fig: /figs/grafana_screenshot.png
  detail: The Gen3 community periodically creates working groups to tackle strategic topics.  These are for initiatives or features that can benefit from community input for both requirements and execution. Participation is open to the community with contact information included for each working group below.  
  title1: CSOC Working Group
  detail1: A commons services operations center (CSOC) is required for organizations that run more than one Gen3 system.  This includes the ability to manage the infrastructure, security, and Gen3 services across multiple commons or data meshes.  The working group includes knowledge sharing, requirements gathering, and opportunities for members to work directly on Gen3 code to improve the CSOC experience.
  detail2: Contact Michael Fitzsimons (fitz@uchicago.edu) or Sara Volk de Garcia (smvgarcia@uchicago.edu) for an invite to the slack channel and zoom meeting.  We meet most months on X, Y, and Z.
  title2: Member Institutions

---

<section class="g3-bg__mint">
  <div class="g3-outer-wrapper g3-flex-content  g3-space__margin-sm-right">
    <div class="g3-space__padding-lg-top g3-space__padding-md-bottom">
      <div class="g3-space__wrapper-gap-left g3-space__margin-sm-right">
        <h1 class="g3-space__margin-sm-bottom ">
          {{< param "g3Teaser.title" >}}
        </h1>
        <p class="g3-space__margin-sm-bottom introduction">
          {{< param "g3Teaser.detail" >}}
        </p>
      </div>
    </div>
  </div>
</section>

<section class="g3-bg__white">
  <div class="g3-outer-wrapper g3-flex-content g3-flex-content__reverse">
    <div class="g3-col__50 g3-flex-content_alien-self-flex-end g3-space__padding-sm-bottom g3-space__margin-sm-top-bottom g3-space__wrapper-gap-right">
    <a > <img class="g3-img__bottom_pad" src="{{< param "g3Teaser.fig" >}}" > </a>
    </div>
    <div class="g3-space__padding-lg-top g3-space__padding-lg-bottom g3-space__wrapper-gap-right g3-col__45">
      <div class="g3-space__wrapper-gap-left">
        <h1 class="g3-space__margin-sm-bottom">
          {{< param "g3Teaser.title1" >}}
        </h1>
        <p class="g3-space__margin-sm-bottom introduction">
          {{< param "g3Teaser.detail1" >}}
          </br>
          </br>
          {{< param "g3Teaser.detail2" >}}
        </p>
      </div>
    </div>
  </div>
</section>

<section class="g3-bg__white">
  <div class="g3-outer-wrapper g3-flex-content">
    <div class="g3-space__padding-md-bottom">
      <div class="g3-space__wrapper-gap-left">
        <h2 class="g3-space__margin-sm-bottom">
          {{< param "g3Teaser.title2" >}}
        </h2>
        <p>
          <ul>
            <li>Center for Translational Data Science, University of Chicago</li>
            <li>Australian Biocommonsa</li>
            <li>Indiana University</li>
            <li>New Zealand eScience Infrastructure</li>
            <li>Open Commons Consortium</li>
            <li>Oregon Health and Science University</li>
          </ul>
        </p
      </div>
    </div>
  </div>
</section>
