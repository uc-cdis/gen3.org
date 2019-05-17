---
identifier: webinars
title: Gen3 - Webinars
linktitle:
date: 2018-09-04T22:16:21-05:00
g3Teaser:
  fig: /figs/webinar.svg
  title: Gen3 Webinars
  detail: The Gen3 webinars are focused on helping the community understand what Gen3 does, what the Data Commons Framework Services (DCFS) are, and how both can be used to aid in the construction and operation of data commons.
g3Upcoming:
  - Title: Data Science with Gen3 - Using Jupyter Notebooks
    Date: June 13th, 2019 at 1 PM U.S. Central Time.
    Description: Join us as we walk through Gen3’s services and demonstrate how researchers can bring data into Gen3 and get access to a data ecosystem with open-source tools to drive scientific discovery. During this webinar we will dive into the details of data science with Gen3 and how Jupyter Notebooks work with Gen3.
    Image: coming_soon.svg
    Link: https://www.eventbrite.com/e/data-science-with-gen3-using-jupyter-notebooks-tickets-58824297056?aff=gen3
g3Previous:
  - Title: Gen3 Data Modeling - Herding Data Submissions & Hunting Down Data (Sheepdog & Peregrine)
    Date: May 9th, 2019
    Description: This webinar will cover the creation of data models, and data dictionaries in Gen3.
    Youtube: cVTvzP-li0M
    Slides: Webinar_20190509.pdf
  - Title: DCF Services Webinar - Authentication, Authorization and Data Access
    Date: Mar. 13th, 2019
    Description: During this webinar we will dive into technical details of the services that Data Commons Framework created such as Authentication, Authorization and Indexing with Fence & Indexd.
    Slides: Webinar_20190313.pdf
    Youtube: 3sjkTG6XP4Y
  - Title: Introduction to Gen3
    Date: Feb. 14th, 2019
    Description: We will introduce attendees to the Gen3 platform and data commons more broadly. Join us as we walk through Gen3’s components and demonstrate how researchers can bring data into Gen3 and use our suite of open-source tools to drive scientific discovery.
    Slides: Webinar_20190214.pdf
    Youtube: i_-e0jpJCK4
---

<section class="g3-bg__mint">
  <div class="g3-outer-wrapper g3-flex-content g3-flex-content__reverse">
    <div class="g3-col__65 g3-flex-content g3-mb-space__padding-lg-top g3-space__margin-md-top-bottom">
      <img class="g3-img__full-width" src="{{< param "g3Teaser.fig" >}}"/>
    </div>
    <div class="g3-space__padding-lg-top g3-space__padding-lg-bottom g3-col__35">
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

<section class="g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-inner-wrapper">
        <h2>Upcoming Webinars</h2>
    </div>
</section>

{{< webinar "g3Upcoming" >}}

<section class="g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-inner-wrapper">
        <h2>Previous Webinars</h2>
    </div>
</section>

{{< webinar "g3Previous" >}}
