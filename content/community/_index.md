---
identifier: community
title: Gen3 - Resources
linktitle: community
date: 2021-01-14
g3Teaser:
  # fig: /figs/productkv.svg
  title: Gen3 Community
  detail: Welcome to the Gen3 Community! Learn from our Community members and engage in technical discussions. Find resources below to discover helpful information on the Gen3 Data Platform Community that strives to accelerate data-driven discoveries.
  # para1: Each of the Gen3 services is designed to accomplish a specific function in a data ecosystem, and that is achieved by providing a publicly-accessible application programming interface (API) that users, applications, and other services can send requests to.
  # para2: This page organizes and presents the Gen3 software services in terms of the different types of data resources mentioned above.
g3DataFeature:
  f0:
    title: Gen3 Code of Conduct
    subtitle: The Gen3 Community values respect and professionalism. Our purpose is to share knowledge and make everyone feel safe and included.
    button:
      link: https://forums.gen3.org/t/faq-guidelines/5
  f1:
    title: Join our Slack!
    subtitle: This is where we gather to ask questions and learn from others' experiences.
    button:
      link: https://docs.google.com/forms/d/e/1FAIpQLSczyhhOXeCK9FdVtpQpelOHYnRj1EAq1rwwnm9q6cPAe5a7ug/viewform
    # contents:
    #   c1:
    #     name: Object Indexing
    #     fig: /figs/features/index.svg
    #   c2:
    #     name: AuthN/AuthZ
    #     fig: /figs/features/auth.svg
    #   c3:
    #     name: Metadata Service
    #     fig: /figs/features/mds.svg
  f2:
    title: Help Desk
    subtitle: For assistance with urgent or project specific questions, please contact our help desk.
    button:
      link: https://gen3.org/resources/user/#contact-ctds-staff
    # contents:
    #   c1:
    #     name: Data Portal
    #     fig: /figs/features/portal.svg
    #   c2:
    #     name: Data Search
    #     fig: /figs/features/search.svg
    #   c3:
    #     name: Data Submission
    #     fig: /figs/features/submit-data.svg
  f3:
    title: Gen3 Projects
    subtitle: Gen3 is ever changing. Check out our current projects.
    button:
      link: https://stats.gen3.org
    # contents:
    #   c1:
    #     name: RStudio
    #     fig: /figs/features/rstudio.svg
    #   c2:
    #     name: Jupyter Notebooks
    #     fig: /figs/features/jupyter.svg
    #   c3:
    #     name: Custom Apps
    #     fig: /figs/features/visualization.svg
  f4:
    title: Gen3 Forum
    subtitle: Discuss use and development of the Gen3 software suite. Find different topics and answers for beginner and advanced stages.
    button:
      link: https://forums.gen3.org
  f5:
    title: Gen3 Videos
    subtitle: Dig deep into our videos and webinars to see Gen3 configurations and operations.
    button:
      link: https://www.youtube.com/channel/UCMCwQy4EDd1BaskzZgIOsNQ/featured
  f6:
    title: Open Source
    subtitle: Visit CTDS on GitHub or submit an open Pull Request to the code base.
    button:
      link: https://gen3.org/resources/developer/dev-introduction/pull-requests-prs
  f7:
    title: Gen3 Publications
    subtitle: Follow the discoveries being made by Gen3 researchers.
    button:
      link: https://ctds.uchicago.edu/publications
g3Entrance:
  e1:
    title: Frequently Asked Questions
    detail: Review the most common questions and answers
    button:
      caption: FAQ
      link: https://gen3.org/resources/faq/
  e2:
    title: Get Started Easily
    detail: View tutorials on using Gen3, including setup and configuration.
    button:
      caption: Easy Start
      link: /get-started
---

<section class="g3-bg__mint">
  <div class="g3-outer-wrapper g3-flex-content g3-flex-content__reverse">
    <div class="g3-col__50 g3-flex-content">
      <img class="g3-img__full-width" src="{{< param "g3Teaser.fig" >}}"/>
    </div>
    <div class="g3-space__padding-lg-top g3-space__padding-lg-bottom g3-col__50">
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
    <div class="g3-flex-content g3-flex-content__col g3-space__margin-md-top-bottom">
      <div class="g3-flex-content g3-flex-content__col g3-space__margin-sm-left-right g3-box">
        <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f0.title" >}}</h3>
        <p>
          {{< param "g3DataFeature.f0.subTitle" >}}
        </p>
        <a class="g3-button g3-button--tertiary g3-flex-content_alien-self-flex-end" href="{{< param "g3DataFeature.f0.button.link" >}}" ">
            Read further
        </a>
      </div>
      <div class="g3-flex-content g3-space__margin-md-top-bottom">
        <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
          <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f1.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f1.subTitle" >}}
          </p>
          <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
          <div class="g3-flex-content g3-flex-content_center">
            <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f1.button.link" >}}" ">
              Sign up
            </a>
          </div>
        </div>
        <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
          <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f2.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f2.subTitle" >}}
          </p>
          <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
          <div class="g3-flex-content g3-flex-content_center">
            <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f2.button.link" >}}" ">
              Get Help!
            </a>
          </div>
        </div>
        <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
          <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f3.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f3.subTitle" >}}
          </p>
          <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
          <div class="g3-flex-content g3-flex-content_center">
            <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f3.button.link" >}}" ">
              Learn More
            </a>
          </div>
        </div>
      </div>
      <div class="g3-flex-content g3-flex-content__col">
      <div class="g3-flex-content g3-flex-content__col">
      <div class="g3-flex-content g3-flex-content__col g3-space__margin-sm-left-right g3-box">
        <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f4.title" >}}</h3>
        <p>
          {{< param "g3DataFeature.f4.subTitle" >}}
        </p>
        <a class="g3-button g3-button--tertiary g3-flex-content_alien-self-flex-end" href="{{< param "g3DataFeature.f4.button.link" >}}" ">
            Explore
        </a>
      </div>
      <div class="g3-flex-content g3-space__margin-md-top-bottom">
        <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
          <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f5.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f5.subTitle" >}}
          </p>
          <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
          <div class="g3-flex-content g3-flex-content_center">
            <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f5.button.link" >}}" ">
              Watch
            </a>
          </div>
        </div>
        <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
          <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f6.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f6.subTitle" >}}
          </p>
          <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
          <div class="g3-flex-content g3-flex-content_center">
            <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f6.button.link" >}}" ">
              Contribute
            </a>
          </div>
        </div>
        <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
          <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f7.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f7.subTitle" >}}
          </p>
          <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
          <div class="g3-flex-content g3-flex-content_center">
            <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f7.button.link" >}}" ">
              Read
            </a>
          </div>
    </div>
  </div>
</section>

<section>
  <div class="g3-inner-wrapper g3-flex-content g3-space__margin-md-bottom">
    <div class="g3-bg__solight g3-space__padding-md g3-col__50 g3-text__center g3-space__margin-sm-left-right">
      <h2 class="g3-space__margin-sm-bottom">
        {{< param "g3Entrance.e1.title" >}}
      </h2>
      <p class="g3-space__margin-sm-bottom">
        {{< param "g3Entrance.e1.detail" >}}
      </p>
      <a class="g3-button--secondary g3-button" href="{{< param "g3Entrance.e1.button.link" >}}">
        {{< param "g3Entrance.e1.button.caption" >}}
      </a>
    </div>
    <div class="g3-bg__solight g3-space__padding-md g3-col__50 g3-text__center g3-space__margin-sm-left-right">
      <h2 class="g3-space__margin-sm-bottom">
        {{< param "g3Entrance.e2.title" >}}
      </h2>
      <p class="g3-space__margin-sm-bottom">
        {{< param "g3Entrance.e2.detail" >}}
      </p>
      <a class="g3-button--secondary g3-button" href="{{< param "g3Entrance.e2.button.link" >}}">
        {{< param "g3Entrance.e2.button.caption" >}}
      </a>
    </div>
  </div>
</section>
