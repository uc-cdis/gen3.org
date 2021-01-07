---
identifier: about
title: Welcome to Gen3
linktitle: about
date: 2018-09-04T22:16:21-05:00
g3Teaser:
  fig: figs/kv.svg
  title: The Gen3 platform supports healthy data ecosystems and builds data commons.
  detail: The Gen3 platform consists of open-source software services that support the emergence of healthy data ecosystems by enabling the interoperation and creation of cloud-based data resources, including data commons and analysis workspaces. Gen3 aims to accelerate and democratize the process of scientific discovery by making it easy to manage, analyze, harmonize, and share large and complex datasets in the cloud.
  button1:
    caption: Experience Demo
    link: https://gen3.datacommons.io
    target: _blank
  button2:
    caption: Get Started
    link: /get-started
    target: _self
g3Feature:
  f1:
    title: Host, Manage, and Share your Data
    detail: Gen3 empowers you to manage, share, and collaboratively analyze data that is valuable to researchers, developers and health organizations. With Gen3, you can receive and quality control data, generate globally unique IDs for data objects, finely control user access to datasets with attribute-based authorization control, and compute over that data in secure analysis workspaces. Gen3 data commons typically use public clouds, such as Amazon’s AWS and Google’s GCP, but can also be used over private clouds and hybrid clouds.
  f2:
    title: Customize Your Gen3 Experience
    detail: The Gen3 services are modular, and data resources can choose which features to include. Each service exposes open APIs that empower interoperation of the data nodes that comprise a healthy data ecosystem. A minimal set of framework services provide the foundation on which the research community can develop new tools for sharing and analyzing data across data resources in the cloud.
  f3:
    title: Facilitate Translational Data Science
    detail: Gen3 comes with some basic tools like faceted search for the creation of virtual cohorts and workspaces for the analysis of data in a secure cloud environment. Custom tools can also be easily developed that run over Gen3's open APIs, and these tools can be offered by developers in a marketplace or shared in open repositories to hasten hypothesis-driven discoveries.
  f4:
    title: Provide Flexible Tools for Data Ingestion
    detail: The Gen3 platform exposes open APIs that support ingestion of virtually any data format, including both large data objects, such as BAM files, CRAM files, and image files, as well as structured data, including clinical and phenotype data. Structured data submissions can be forced to conform to a specific data model, or data resources can be configured to ingest self-described data objects that include their own data model into a data lake.
g3Roles:
  title: Gen3 helps you as...
  r1:
    name: Bioinformaticians
    fig: /figs/roles/icon-bio.svg
    detail: Data resources using Gen3 provide open APIs for accessing organized data with persistent digital identifiers to allow you to focus on creating unique pipelines or deep learning algorithms for your analyses.
    button:
      caption: Pipeline Library
      target: _blank
      link: https://github.com/uc-cdis/ndh-demo
  r2:
    name: Researchers
    fig: /figs/roles/icon-research.svg
    detail: Use our smart dashboard to explore and find data from multiple sources to meet the needs of your research. Collaborate with others in your field to combine data for powerful, cross-project meta-analyses.
    button:
      caption: Gen3 User Guide
      target: _self
      link: /resources/user
  r3:
    name: Developers
    fig: /figs/roles/icon-devs.svg
    detail: Integrate Gen3 open APIs into your services and applications, and leverage our open-source software libraries to expedite development of your own tools. Develop custom apps that can be marketed to a variety of data resources that utilize a common set of framework services and APIs.
    button:
      caption: Gen3 Developer
      target: _self
      link: /resources/developer
g3User:
  quote: “From the perspective of setting up a basic Gen3 ecosystem with all the services running, it was a breeze and the Github docs are pretty awesome.”
  by: Amit, Cloud Solutions Architect with Leidos
  title: Who's using Gen3?
  detail: Gen3 has been used to build over 15 data commons by different organizations and is a key component of the emerging translational medicine data ecosystem. Currently, several NIH Institutes and Centers have projects utilizing Gen3, including NCI, NHLBI, the Common Fund, NHGRI, NIDDK, and NIDA. At least two public-private partnerships have also used the Gen3 platform to create data commons. All these data resources are built using a common set of software services called the Gen3 Data Commons Framework Services (DCFS), so that the various data commons can interoperate creating a large-scale data ecosystem.
  fig: figs/app-mockup.png
g3Commons:
  c1:
    fig: figs/commons/kid-first.svg
    link: https://kidsfirstdrc.org/
  c2:
    fig: figs/commons/blood-pac.png
    link: https://www.bloodpac.org/
  c3:
    fig: figs/commons/pdc.png
    link: https://proteomic.datacommons.cancer.gov/pdc/
g3Intro:
  title: Introduction to Gen3
  detail: The Gen3 Data Platform is an open-source (with an Apache License) data platform for developing and operating cloud-based data commons, workspaces, and an ecosystem of interconnected, cloud-based data resources, applications and notebooks. A functioning data ecosystem empowers researchers in the same field to share and combine datasets for reanalysis and reuse as new tools and hypotheses are developed.  The Gen3 Data Platform consists of Gen3 Framework Services, Gen3 Data Commons and Gen3 Workspaces.
  fig: figs/productkv.svg
g3FrameworkServices:
  title: Gen3 Framework Services
  para1: The Gen3 Framework Services are a minimal set of software services that provide open APIs for indexing data objects, associating metadata with the data objects, and controlling user access to data via an attribute-based access control (ABAC) policy engine.
  para2: The Gen3 data indexing service (Indexd) assigns persistent digital IDs to data objects and returns the location of the data object in one or more public or private clouds. Indexd is compatible with the GA4GH DRS standard and is cloud-agnostic, meaning data objects can be stored in a variety of locations and even move physical locations while maintaining a single, persistent digital ID.
  para3: Gen3 utilizes OpenID Connect for providing authentication services along with a flexible ABAC policy engine for providing tailored user authorization, depending on a data resource's specific needs. Currently supported identity providers include Google and Shibboleth via NIH iTrust, InCommon Federation, and eduGAIN. Additionally, Gen3 can interoperate with NIH dbGaP to obtain authorization information and is involved in the NIH Research Authorization Service (RAS) pilot to support RAS as an identity and authorization provider.
  para4: The Gen3 Framework Services include logging, security, and compliance services so that Gen3 Data Commons and Gen3 Workspaces can be operated at the FISMA Moderate security compliance level.
g3DataCommons:
  title: Gen3 Data Commons
  para1: Gen3 Data Commons are cyberinfrastructure that co-locates data analysis, exploration and visualization tools with data management services for import and export of structured information like clinical, phenotypic, or biospecimen data, and data objects, like genomics data files or medical images. Typically, a data model is utilized to standardize the structure of metadata input and output, although a commons may also support multiple data models by allowing submission of structured data packaged along with a custom data model, for example, Avro-based data-serialization formats like the Portable Format for Biomedical data or PFB.
  para2: When using Gen3 to build a data commons, the platform auto-generates a data submission and exploration portal that enables the use of its features within a standard web-browser. Fully-integrated analysis workspaces can be also be included, although data can be exported to virtually any cloud-based analysis platform that allows programmatic access via Gen3 open APIs.
  para3: Gen3 Data Commons are a kind of data resource that is interoperable with other nodes in a data ecosystem by utilizing the Gen3 Framework Services for authentication, authorization, data object indexing and metadata services.
g3Workspaces:
  title: Gen3 Workspaces
  para1: A Gen3 workspace can access data from one or more data resources, including Gen3 Data Commons, and also uses the Gen3 Framework Services for user authentication and authorization and data object indexing and metadata services. Gen3 Workspaces support Jupyter notebooks, RStudio notebooks, and other applications that can access data through Gen3 open APIs.
g3DataFeature:
  title: Gen3 Features
  f1:
    title: Easy Data Submission
    detail: Use one of the Gen3 services or community tools to submit data objects and metadata to a Gen3 Commons. Or develop your own tools specific to your user community.
  f2:
    title: Easily Find Your Data in an Ecosystem
    detail: Gen3 will automatically index your data and provide globally unique identifiers (GUIDs). GUIDs can also be resolved at dataguids.org to find out where a data object lives within your data ecosystem.
  f3:
    title: Open-Source Community
    detail: Engage Gen3’s broad user community. Ask a question, answer a question, request a new feature, or see if anyone else has approached a similar technical or scientific problem during their experience with Gen3.
  f4:
    title: Customizable Options for Data Queries
    detail: Gen3’s user interface includes data exploration tools you can customize for your users to help them find data they need and receive it in a format they can use. Users can interactively build and send their own custom queries using Gen3's query services or use the built-in graphical user interface for data exploration, which features faceted search for building patient cohorts or selecting subsets of data files for analysis. Data resources can decide whether the data is able to leave the cloud or not and can develop custom apps to visualize or analyze specific data types using Gen3's open APIs.
  f5:
    title: Security & Compliance
    detail: Gen3 can be deployed with various levels of security and compliance, and Gen3 makes security easy by including built-in tools for supporting FISMA moderate systems. Deploy your data commons or build out the data ecosystem with the controls needed for your data and your user community.
  f6:
    title: Control Data Access—Or Not
    detail: You can leave your data open to the Internet or control access at deeper levels within your own data use ontology, from the core data to the data objects.
g3Contributor:
  title: Contributor
  fig: figs/ctds-logo.png
  target: _blank
  link: https://ctds.uchicago.edu/
g3Entrance:
  e1:
    title: Join the Discussion
    detail: Ask questions, request features, or reach out for advice on Gen3's discussion forum.
    button:
      caption: Community Forum
      link: https://forums.gen3.org/
  e2:
    title: Get Started Easily
    detail: Follow the documentation to setup Gen3 easily to benefit your research.
    button:
      caption: Quick Start
      link: /get-started

---

<section class="g3-bg__solight">
  <div class="g3-outer-wrapper g3-flex-content g3-flex-content__reverse">
    <div class="g3-col__55 g3-flex-content g3-mb-space__padding-lg-top">
      <img class="g3-img__max-full-width" src="{{< param "g3Teaser.fig" >}}"/>
    </div>
    <div class="g3-space__padding-lg-top g3-space__padding-lg-bottom g3-col__45">
      <div class="g3-space__wrapper-gap-left">
        <h1 class="g3-space__margin-sm-bottom">
          {{< param "g3Teaser.title" >}}
        </h1>
        <p class="introduction">
          {{< param "g3Teaser.detail" >}}
        </p>
        <div class="g3-button-groups g3-mb-space__padding-lg-bottom">
          <a class="g3-button g3-button--primary" target="{{< param "g3Teaser.button1.target" >}}" href="{{< param "g3Teaser.button1.link" >}}">{{< param "g3Teaser.button1.caption" >}}</a>
          <a class="g3-button g3-button--secondary" target="{{< param "g3Teaser.button2.target" >}}" href="{{< param "g3Teaser.button2.link" >}}">{{< param "g3Teaser.button2.caption" >}}</a>
        </div>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="g3-inner-wrapper g3-flex-content g3-space__padding-lg-top g3-space__padding-md-bottom">
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left g3-space__margin-sm-right">
        <h3>{{< param "g3Feature.f1.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          {{< param "g3Feature.f1.detail" >}}
        </p>
      </div>
    </div>
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left g3-space__margin-sm-right">
        <h3>{{< param "g3Feature.f2.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          {{< param "g3Feature.f2.detail" >}}
        </p>
      </div>
    </div>
  </div>
  <div class="g3-inner-wrapper g3-flex-content g3-space__padding-lg-bottom">
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left g3-space__margin-sm-right">
        <h3>{{< param "g3Feature.f3.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          {{< param "g3Feature.f3.detail" >}}
        </p>
      </div>
    </div>
    <div class="g3-col__50">
      <div class="g3-space__margin-sm-left g3-space__margin-sm-right">
        <h3>{{< param "g3Feature.f4.title" >}}</h3>
        <p class="g3-space__margin-sm-top">
          {{< param "g3Feature.f4.detail" >}}
        </p>
      </div>
    </div>
  </div>
</section>

<h2 class="g3-text__center g3-space__margin-sm-bottom">
  {{< param "g3Roles.title" >}}
</h2>

<section class="g3-bg__solight">
  <div class="g3-inner-wrapper g3-space__padding-md-top g3-space__padding-lg-bottom g3-mb-space__padding-lg-top g3-mb-space__padding-lg-bottom">
    <div class="g3-table-row">
      <div class="g3-col__33 g3-text__center g3-space__margin-sm-left-right">
        <img class="g3-space__margin-sm-bottom" src="{{< param "g3Roles.r1.fig" >}}"/>
        <h3 class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r1.name" >}}
        </h3>
        <p class="g3-space__margin-sm-bottom">
          {{< param "g3Roles.r1.detail" >}}
        </p>
        <a class="g3-button g3-button--secondary g3-align__bottom" href="{{< param "g3Roles.r1.button.link" >}}" target="{{< param "g3Roles.r1.button.target" >}}">
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
        <a class="g3-button g3-button--secondary g3-align__bottom" href="{{< param "g3Roles.r2.button.link" >}}" target="{{< param "g3Roles.r2.button.target" >}}">
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
        <a class="g3-button g3-button--secondary g3-align__bottom" href="{{< param "g3Roles.r3.button.link" >}}" target="{{< param "g3Roles.r3.button.target" >}}">
          {{< param "g3Roles.r3.button.caption" >}}
        </a>
      </div>
    </div>
  </div>
</section>

<section>
  <h4 class="g3-text__center g3-minimum-wrapper g3-space__padding-lg-top">
    {{< param "g3User.quote" >}}
  </h4>
  <p class="g3-text__center g3-minimum-wrapper g3-space__margin-sm-top g3-space__padding-lg-bottom">
    - {{< param "g3User.by" >}}
  </p>
</section>

<section class="g3-bg__mint">
  <div class="g3-outer-wrapper g3-flex-content g3-mb-space__padding-lg-bottom g3-mb-space__padding-lg-top">
    <div class="g3-col__45 g3-space__margin-lg-top g3-space__margin-lg-bottom">
      <div class="g3-space__wrapper-gap-left">
        <h1>{{< param "g3User.title" >}}</h1>
        <p class="introduction g3-space__margin-sm-top-bottom">
          {{< param "g3User.detail" >}}
        </p>
      </div>
    </div>
    <div class="g3-col__55 g3-space__padding-md">
      <img class="g3-img__center g3-img__full-width" src="{{< param "g3User.fig" >}}" />
    </div>
  </div>
</section>

<section class="g3-bg__solight">
  <div class="g3-inner-wrapper g3-flex-content g3-space__padding-sm-top g3-space__padding-sm-bottom">
    <div class="g3-col__25">
      <a href="{{< param "g3Commons.c1.link" >}}">
        <img class="g3-img__center" style="max-height: 52px; max-width: 100%;" src="{{< param "g3Commons.c1.fig" >}}" />
      </a>
    </div>
    <div class="g3-col__25">
      <a href="{{< param "g3Commons.c2.link" >}}">
        <img class="g3-img__center" style="max-height: 52px; max-width: 100%;" src="{{< param "g3Commons.c2.fig" >}}" />
      </a>
    </div>
    <div class="g3-col__25">
      <a href="{{< param "g3Commons.c3.link" >}}">
        <img class="g3-img__center" style="max-height: 52px; max-width: 100%;" src="{{< param "g3Commons.c3.fig" >}}" />
      </a>
    </div>
    <div class="g3-col__25">
      <a href="{{< param "g3Commons.c4.link" >}}">
        <img class="g3-img__center" style="max-height: 52px; max-width: 100%;" src="{{< param "g3Commons.c4.fig" >}}" />
      </a>
    </div>
  </div>
</section>

<section>
  <div class="g3-inner-wrapper g3-space__padding-lg-top g3-space__padding-lg-bottom">
    <h2 class="g3-text__center">{{< param "g3Intro.title" >}}</h2>
    <p class="introduction g3-mini-wrapper g3-text__center g3-space__margin-sm-top g3-space__padding-md-bottom">
      {{< param "g3Intro.detail" >}}
    </p>
    <img class="g3-img__center g3-img" src="{{< param "g3Intro.fig" >}}"/>
    <div class="g3-space__padding-md-top-bottom g3-mini-wrapper">
      <h3 class="g3-text__center">{{< param "g3DataAccess.title" >}}</h3>
      <p class="introduction g3-text__center g3-space__margin-sm-top">
        {{< param "g3DataAccess.para1" >}}
      </p>
      <img class="g3-img__center g3-img__full-width" src="{{< param "g3DataAccess.para2Fig" >}}" />
      <p class="introduction g3-text__center g3-space__margin-sm-top">
        {{< param "g3DataAccess.para2" >}}
      </p>
      <img class="g3-img__center g3-img__full-width" src="{{< param "g3DataAccess.para3Fig" >}}" />
      <p class="introduction g3-text__center g3-space__margin-sm-top">
        {{< param "g3DataAccess.para3" >}}
      </p>
    </div>
    <div class="g3-text__center g3-space__margin-sm-top">
      <a class="g3-button g3-button--primary" href="{{< param "g3Intro.button.link" >}}">{{< param "g3Intro.button.caption" >}}</a>
    </div>
  </div>
</section>

<section>
  <div class="g3-space__padding-md-top g3-space__padding-md-bottom g3-space__margin-lg-bottom g3-bg__solight">
    <div class="g3-inner-wrapper">
      <div class="g3-flex-content g3-space__margin-md-top-bottom">
        <div class="g3-space__margin-sm-left-right g3-col__50">
          <h3>{{< param "g3DataFeature.f1.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f1.detail" >}}
          </p>
        </div>
        <div class="g3-space__margin-sm-left-right g3-col__50">
          <h3>{{< param "g3DataFeature.f2.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f2.detail" >}}
          </p>
        </div>
      </div>
      <div class="g3-flex-content g3-space__margin-md-top-bottom">
        <div class="g3-space__margin-sm-left-right g3-col__50">
          <h3>{{< param "g3DataFeature.f3.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f3.detail" >}}
          </p>
        </div>
        <div class="g3-space__margin-sm-left-right g3-col__50">
          <h3>{{< param "g3DataFeature.f4.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f4.detail" >}}
          </p>
        </div>
      </div>
      <div class="g3-flex-content g3-space__margin-md-top-bottom">
        <div class="g3-space__margin-sm-left-right g3-col__50">
          <h3>{{< param "g3DataFeature.f5.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f5.detail" >}}
          </p>
        </div>
        <div class="g3-space__margin-sm-left-right g3-col__50">
          <h3>{{< param "g3DataFeature.f6.title" >}}</h3>
          <p>
            {{< param "g3DataFeature.f6.detail" >}}
          </p>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="g3-space__margin-lg-bottom g3-text__center">
  <h2>{{< param "g3Contributor.title" >}}</h2>
  <div class="g3-mini-wrapper g3-space__margin-sm-top">
    <a href="{{< param "g3Contributor.link" >}}" target="{{< param "g3Contributor.target" >}}">
      <img src="{{< param "g3Contributor.fig" >}}" class="g3-img__full-width" />
    </a>
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
