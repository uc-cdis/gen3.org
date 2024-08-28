# Welcome to the General Gen3 Data Commons Documentation

## Sections on this page

- [Welcome to the General Gen3 Data Commons Documentation](#welcome-to-the-general-gen3-data-commons-documentation)
  - [Sections on this page](#sections-on-this-page)
  - [Overview](#overview)
  - [Guiding Principles](#guiding-principles)
  - [Support](#support)
- [The Data Commons Architecture](#the-data-commons-architecture)
  - [Diagram of the System Architecture](#diagram-of-the-system-architecture)
  - [Online Resources](#online-resources)
  - [Contact CTDS Staff](#contact-ctds-staff)

## Overview

The Center for Translational Data Science (CTDS) at the University of Chicago has developed and maintains [the Gen3 software stack][Gen3 site] to help accelerate scientific discovery through creation of a collaborative infrastructure that enables sharing of information between stakeholders in industry, academia, and regulatory agencies.

The Gen3 software stack is a [collection of microservices][Gen3 site] that enable the standing-up of data commons, which allows different partner organizations to pool data and grants approved researchers access to harmonized datasets in a scalable, reproducible, and secure manner.

## Guiding Principles

* OPEN DATA

We believe that data must be open and accessible within the research community to collectively achieve the critical mass of data necessary to power data-driven research, insight, and discovery.

* OPEN-SOURCE

We believe that collaboration creates a knowledge pool that not only drives better software development, but also connects us to an active community in pursuit of shared social impact. We have long benefitted from open-source software and are committed to contributing to future generations of software and scholars.

* OPEN INFRASTRUCTURE

We believe that rapid innovation is most effectively achieved through an open infrastructure environment where portability and compatibility are maximized and knowledge is distributed broadly.

For more information visit: [CTDS Guiding Principles][GuidePrin].

## Support

Operation of the Gen3 commons is supported by generous grants from Amazon Web Services’ [Grants for Research Credit Program][AWSgrant] and Microsoft Azure’s [Research Grant Program][AzureGrant].

# The Data Commons Architecture

User access to the Gen3 data commons runs through a Virtual Private Cloud (VPC). Access to data and analysis tools through a VPC allows for balance of usability and security. All access is through a monitored head node. Data is not directly accessed from the Internet.

Other secure and compliant Gen3 member systems (including cloud-based systems) can access Gen3 data through the API.

## Diagram of the System Architecture

![This shows a diagram of the Gen3 system architecture][Gen3 Sys Diagram]

## Online Resources
* [The Gen3 YouTube channel][Gen3 YT]
* [The Gen3 Forum][Gen3 Forum]
* [CTDS GitHub Organization][CTDS GitHub]

## Contact CTDS Staff
* Locations:

   * [Shoreland:][Shoreland addy] 5454 South Shore Drive Suite 2B Chicago, IL 60615
   * [University of Chicago:][UChicago Addy] 900 East 57th Street 10th Floor, Room 10148 Chicago, IL 60616
* Email:

   * General Inquiries: cdis@uchicago.edu.
   * Technical Support: support@datacommons.io.

<!-- Overview section. -->
[Gen3 site]: https://cdis.uchicago.edu/gen3/
<!-- Guiding Principles Section. -->
[GuidePrin]: https://cdis.uchicago.edu/guiding-principles
<!-- Support Section -->
[AWSgrant]: https://aws.amazon.com/research-credits/
[AzureGrant]: https://www.microsoft.com/en-us/research/academic-program/microsoft-azure-for-research/
<!-- Diagram of System Architecture Section -->
[Gen3 Sys Diagram]: https://gen3.org/resources/user/img/architecture.png
<!-- Online Resources Section -->
[Gen3 YT]: https://www.youtube.com/channel/UCMCwQy4EDd1BaskzZgIOsNQ/videos
[Gen3 Forum]: https://forums.gen3.org/
[CTDS GitHub]: https://github.com/uc-cdis/
<!-- Contact CTDS Section -->
[Shoreland addy]: https://www.google.com/maps/place/Shoreland/@41.7962274,-87.5837128,17z/data=!3m1!4b1!4m5!3m4!1s0x880e297518655577:0x2fb20b44b0d04984!8m2!3d41.7962274!4d-87.5815188
[UChicago Addy]: https://www.google.com/maps/place/Knapp+Center+for+Biomedical+Discovery+KCBD/@41.7916469,-87.6055968,17z/data=!3m1!4b1!4m5!3m4!1s0x880e293eb63accd1:0xb6f95ee97c4b5e08!8m2!3d41.7916469!4d-87.6034081
<!-- don't forget to check email addresses in this section! -->
