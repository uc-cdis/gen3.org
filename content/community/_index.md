---
identifier: community
title: Gen3 - Community
linktitle: community
date: 2021-01-14
g3Teaser:
  fig: /figs/community.png
  title: Gen3 Community
  detail: Welcome to the Gen3 Community! Learn from our Community members and engage in technical discussions. Find resources below to discover helpful information on the Gen3 Data Platform Community that strives to accelerate data-driven discoveries.
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
  f2:
    title: Help Desk
    subtitle: For assistance with urgent or project specific questions, please contact our help desk.
    button:
      link: https://gen3.org/resources/user/#contact-ctds-staff
  f3:
    title: Gen3 Projects
    subtitle: Gen3 is ever changing. Check out our current projects.
    button:
      link: /powered-by-gen3
  f4:
    title: Discussion Board
    subtitle: Discuss use and development of the Gen3 software suite. Find different topics and answers.
    button:
      link: https://forums.gen3.org
  f5:
    title: Gen3 Videos
    subtitle: Dig deep into our videos and webinars to see Gen3 configurations and operations.
    button:
      link: https://www.youtube.com/channel/UCMCwQy4EDd1BaskzZgIOsNQ/featured
  f6:
    title: Source Code
    subtitle: View repositories for all Gen3 services on GitHub.
    button:
      link: https://github.com/uc-cdis
  f7:
    title: Gen3 Publications
    subtitle: Follow the discoveries being made by Gen3 researchers.
    button:
      link: /gen3refs/
  f8:
    title: Community Events
    subtitle: View information about and register for upcoming Gen3 developer community events.
    button:
      link: /community/events/
  f9:
    title: Release Notes
    subtitle: Learn what improvements were found in the latest releases.
    button:
      link: https://github.com/uc-cdis/cdis-manifest/tree/master/releases
  f10:
    title: Contribute to Gen3
    subtitle: Learn how to contribute code improvements to Gen3.
    button:
      link: https://docs.gen3.org/gen3-resources/developer-guide/contribute/

---

<section class="g3-bg__mint">
  <div class="g3-outer-wrapper g3-flex-content g3-flex-content__reverse">
    <div class="g3-col__50 g3-flex-content">
      <img class="g3-img__full-width" src="{{< param "g3Teaser.fig" >}}"/>
    </div>
    <div class="g3-space__padding-lg-top g3-col__50">
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
      <div class="g3-flex-content g3-space__margin-md-top">
              <h2>Gen3 Community</h2>
      </div>
      <div class="g3-flex-content g3-space__margin-sm-top-bottom">
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
          <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f4.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f4.subTitle" >}}
          </p>
          <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
          <div class="g3-flex-content g3-flex-content_center">
            <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f4.button.link" >}}" ">
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
          <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f8.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f8.subTitle" >}}
          </p>
          <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
          <div class="g3-flex-content g3-flex-content_center">
            <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f8.button.link" >}}" ">
              Learn More
            </a>
          </div>
        </div>
      </div>
      <div class="g3-flex-content g3-space__margin-md-top">
              <h2>Gen3 on GitHub</h2>
      </div>
      <div class="g3-flex-content g3-space__margin-sm-top-bottom">
        <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
          <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f6.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f6.subTitle" >}}
          </p>
          <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
          <div class="g3-flex-content g3-flex-content_center">
            <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f6.button.link" >}}" ">
              Learn More
            </a>
          </div>
        </div>
        <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
          <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f9.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f9.subTitle" >}}
          </p>
          <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
          <div class="g3-flex-content g3-flex-content_center">
            <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f9.button.link" >}}" ">
              Learn More
            </a>
          </div>
        </div>
        <div class="g3-space__margin-sm-left-right g3-col__33 g3-box">
          <h3 class="g3-space__margin-sm-top-bottom">{{< param "g3DataFeature.f10.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f10.subTitle" >}}
          </p>
          <div class="g3-space__margin-sm-top-bottom g3-divider"></div>
          <div class="g3-flex-content g3-flex-content_center">
            <a class="g3-button g3-button--tertiary" href="{{< param "g3DataFeature.f10.button.link" >}}" ">
              Learn More
            </a>
          </div>
        </div>
      </div>
      <div class="g3-flex-content g3-space__margin-md-top">
              <h2>Learn More about Gen3</h2>
      </div>
      <div class="g3-flex-content g3-space__margin-sm-top-bottom">
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
