---
identifier: operator
title: Gen3 - Set up Gen3
linktitle: /resources/operator
date: 2018-09-04T22:16:21-05:00
layout: withtoc
menuname: operatorMenu
---

# Running a Gen3 Data Commons

## 1. Compose Services ![Compose Services](img/compose-services.svg)

Compose Services allow you to quickly run a Gen3 commons on a single computer or in a single VM in a matter of minutes.

This option is suitable for those that wish to run a small data commons, experiment with the technology, or even do local development on the Gen3 services.

We recommend you start here for your first experience running the Gen3 platform. Using Compose Services will not make the full suite of automation and logging for Gen3 data commons available. If you intend to create a bigger data commons or deploy a data commons in a production environment, we strongly recommend you use [Cloud Automation](#2-cloud-automation).

[Gen3 Compose Services](https://github.com/uc-cdis/compose-services)

## 2. Cloud Automation ![Cloud Automation](img/cloud-automation.svg)

Cloud automation is how we deploy Gen3 data commons in production environments on Amazon Web Services, Google Cloud Platform, Microsoft Azure, and OpenStack environments. Cloud automation is fully featured supporting integrated logging, security, and compliance steps. With cloud automation, we utilize Kubernetes to orchestrate our services into a scalable environment that can be run in a cost efficient manner for many tens to thousands of users.

Cloud automation utilizes Terraform for repeatable infrastructure deployments onto the public clouds. Additionally, we have custom Gen3 specific tooling to help automate various steps in the Kubernetes deployment process such as rolling pod versions, and scaling up. 

We welcome all co mments, feature requests, and pull requests using GitHub issues or the [Gen3 community](https://forums.gen3.org).

[Gen3 Cloud Automation](https://github.com/uc-cdis/cloud-automation/blob/master/doc/csoc-free-commons-steps.md)

## 3. Creating a New Data Dictionary

### Core Dictionary
Gen3 introduced the [DCF data dictionary](https://github.com/uc-cdis/dcfdictionary) that allows users to construct their own data dictionary. It could serve as a starting point for someone who is interested in creating their own dictionary. It's a consensus of previously used data dictionaries and makes the process of creating a data dictionary more efficient.  It's composed of several nodes that are categorized based on the type of data they are modeling such as Clinical, Biospecimen, and Data File.  The Project, Study, and Subject nodes are administrative nodes that are required for any Gen3 data commons.  Administrative nodes store basic project and study information for their associated cases or subjects.  Also, the Subject node (which is also an administrative node) level is where the nodes start differentiationg between commons.  It can also be represented as Case depending on the use case.  The Subject node links to the Demographic and Diagnosis clinical nodes.  These nodes are Clinical nodes that are used to store clinical and medical history related data.  The Demograpic node stores properties that represent the statistical characterization of human populations or segments of human populations (for example, characterization by year of birth, sex, and race).  This node is typically used to store properties that do not change over time.  The Diagnosis clinical node represents the investigation, analysis, and recognition of the presence and nature of disease, condition, or injury from expressed signs and symptoms. It also pertains to the scientific determination of any kind and the concise results of such an investigation.  A clinical node that is not included in the DCF is the Visit or Follow-Up node.  The Visit node is used to store longitudinal data that is collected over time and usually has a many to one relationship with its parent node.  Another node category is the index file that stores the metadata that is associated with different file formats (forexample, BAI and BAM).  The Analysis node category stores data that is associated with genomic pipline data that is typical of next generation sequencing (NGS).  The Data File node category is used to store metadata related to data files that are stored in the cloud.  If the need arises, the node can be added to a data dictionary.  Finally, the Notation node category is used to store data that does not fit into other categories (for example, it doesn't store index files, data files, or analysis data).  The ability to update/modify a dictionary is an important functionality that may arise based on project and clinical data needs. 

The following image is of the graph view of DCF data dictionary:

![graph view](img/dcf_dictionary.png)

### Modifying a Data Dictionary
Once users have obtained the baseline dictionary, users can make updates to it.  To create a data dictionary tailored to a particular project, the user can modify the baseline dictionary using a program which automatically updates the dictionary given TSV input which specifies the desired changes to the dictionary. The updates are based on instructions that are included in a TSV file such as update a property, delete a node, etc.  Instructions for implementing the script can be found [here](https://github.com/uc-cdis/planx-bioinfo-tools/tree/master/dictionary_tools). For those that are interested in making edits directly to a YAML file, we are also in the process of automating this process.

#### Referencing external data standards
Gen3 is expanding the information in data dictionaries by including references to controlled vocabularies such as the National Cancer Institute Thesaurus (NCIt).  This will help with the comparison of studies and projects across data commons and provide researchers with proper references.  The NCIt is being used for many of the schemas as it's inclusive of several different domains (for example, clinical, drug, etc.).  It also has an abundance of non-domain related terms such as nominal (for example, gender, race) and ordinal (for example, left, right, first, last) along with other useful categories of terms.  The benefit of this effort is that it will facilitate cross data commons comparison.  For instance, if tuberculosis is a term associated with multiple studies, a search of that term will provide insight into each of the studies.  It will also help with the prevention of adding multiple terms for properties that mean the same thing.  The example below demonstrates a cross study comparison using YAML files (Gen3 uses YAML files to help organize data dictionaries.  The files are used by internal systems to help manage the data dictionaries.)  The two files both relate to blood pressure finding, but each has a different term name.  The external reference helps with harmonization efforts by helping identify terms that have the same meaning.

```JSON

Dictionary 1:
Blood Pressure Measurement:
    description: Measurement of blood pressure
    enum:
      - 90 over 60 (90/60) or less
      - More than 90 over 60 (90/60) and less than 120 over 80 (120/80)
      - More than 120 over 80 and less than 140 over 90 (120/80-140/90)
      - 140 over 90 (140/90) or higher (over a number of weeks
    termDef:
       - term: Blood Pressure Finding
         source: NCI Thesaurus
         term_id: C54707
         term_version: 18.10e (Release date:2018-10-29)
         term_url: "https://ncit.nci.nih.gov/ncitbrowser/ConceptReport.jsp?dictionary=NCI_Thesaurus&ns=ncit&code= C54707"
Dictionary 2:
Blood Pressure Reading:
    description: An indication of blood pressure level
    enum:
      - low blood pressure
      - normal
      - pre hypertension
      - hypertension
    termDef:
       - term: Blood Pressure Finding
         source: NCI Thesaurus
         term_id: C54707
         term_version: 18.10e (Release date:2018-10-29)
         term_url: "https://ncit.nci.nih.gov/ncitbrowser/ConceptReport.jsp?dictionary=NCI_Thesaurus&ns=ncit&code= C54707"
```
### Best Practices

#### Data Normalization
When adding a new project or study into a new or an already existing data dictionary, it's important to follow the process of harmonization of data.  The harmonization process centers around updates or additions to the data dictionary, along with the possible need to harmonize the data. This process helps with the prevention of redundant properties, nodes, and allowable values that may already exist in a data dictionary.  It also involves the possibility of a data migration if the data dictionary changes affect the preexisting data (For example, the height property unit of measure change from meters to centimeters).  Before submitting new data to a commons or submitting updates to a data dictionary, check the current dictionary for properties, nodes, or enumerated values that already exist.  If there is a similar property, node, or enumberated value that exists, it's best practice to use the existing node, property, or enumerated value.  For example, if a candidate property named “infection agent” and a property named “infectious agent” already exist, then use “infectious agent.”

#### Specificity vs. Generality

One of the goals when providing an external reference is to figure out the level of specificity when breaking down a property name that contains multiple concepts.  The question is whether the new references should be created with very specific designations (This is known as pre-coordination).   This option would likely create the need for the request of new terms in the external standard if the term is not in existence. The other question is, should the use of multiple terms that already exist in an external standard be used (This is known as post-coordination)?  The best practice adopted by Gen3 is to use specificity whenever corresponding terms are available in the external standard.  However, If specific terms are not available, lean towards generality by creating multiple terms that already exist in an external standard.  For instance, if grapefruit juice is a property of interest and it's not found in the external reference, but grapefruit and juice are found individually, then using the individual properties is the preferred method.

#### Creating Valuable Data Descriptions

It's important to create clear and concise descriptions for each property in a dictionary.  The descriptions should be understandable by someone who is not familiar with a particular domain.  When available, including the unit of measure in parenthesis at the end of the description would be helpful in cases where the unit of measure is not included elsewhere in the description. When a clear description is not readily available, it's recommended that an external vocabulary such as NCIt be used as they offer definitions for terms from a plethera of domains.

#### Avoiding Data Loops

When creating a data model it's important to avoid loops or cycles between nodes.  A cycle is created when a relationship between nodes is created on top of an already existing chain of relationships.  In other words, loops occur when one relationship is completely derivable from combined relationships that already exist.  Loops have a negative effects on down stream functions and tools such as ETL mappings and elastic search.  

The following diagram is an example of a loop as R3 is redundant as it brings no new associations that are not already presented by the combination of R1 and R2:

![Loop example](img/loop.png)

## 4. Dictionary Update Documentation

When making updates to data dictionaries, it's important to document these changes for good record keeping purposes.  The documentation should be implemented in the release notes of the respective GitHub site.  All changes should be denoted from minor to major changes.  Common updates include enumerated value modifications, adding or removing properties or nodes, and updates to links that describe relationships and dependencies between nodes.  Every release is assoicated with a unique tag which differentiates dictionary versions.  The tags are incrementally changed based on how extensive an update (for example, for a minor update such as changing a property name version 3.3.2 would become 3.3.3). 

### Example Documentation

      Gen3 Product: Sample Data Hub
      Release Date: May 30, 2019
      New Features and Changes

      Create the following node:
      sample

      Add the following properties to the sample node:
      sample_name
      sampe_time

      Remove the following properties from the demographic node:
      sex
      height

      Add new link: 
      sample to visit node

Proper documentation of dictionary updates fosters accountability and creates a historical representation of all dictionary changes that will allow future operators of the dictionary to understand how the dictionary has evolved over time.    

When generating the release notes there are [conventions](https://github-tools.github.io/github-release-notes/concept.html) that have been established that help with transparency and readability of release notes.  The conventions include:

  1) Start the subject line with a verb (for example, Update to enumerated value)
  2) Use the imperative mood in the subject line (for example, Add, not Added or Adds header styles)
  3) Limit the subject line to about 50 characters
  4) Do not end the subject line with a period
  5) Separate subject from body with a blank line
  6) Wrap the body at 72 characters
  7) Use the body to explain what and why, not how

## 5. Authentication Methods

The following methods of authentication are supported in Gen3. They are listed in order of preference from OCC perspective, and technological and governance considerations are outlined below.

### eRA Commons

Authentication system developed by NIH for the management of research grants.

_Pros_

* Intended for officials, principal investigators, trainees and post-docs at institutions/organizations to access and share information relating to research grants.

_Cons_

* Can only be used if sponsored by an NIH institute.

### Google (organizational account)

Google Sign-In secure authentication system as provided by the user’s organization.

_Pros_

* User’s organization inherently takes responsibility for actions taken by user under the auspice of their organizational identity.
* User’s organization takes responsibility for activating/deactivating and monitoring identity.

_Cons_

* Can only be used if the user’s organization utilizes Google for identity management.

### Microsoft Office 365 (organizational account)

Microsoft Office 365 secure authentication system as provided by the user’s organization.

_Pros_

* User’s organization inherently takes responsibility for actions taken by user under the auspice of their organizational identity.
* User’s organization takes responsibility for activating/deactivating and monitoring identity.

_Cons_

* Can only be used if the user’s organization utilizes Microsoft Office 365 for identity management.

### InCommon

InCommon, operated by Internet2, provides a secure and privacy-preserving trust fabric for research and higher education, and their partners, in the United States. Individual identity providers, such as NIH iTrust and most academic institutions, are federated by InCommon.

_Pros_

* User’s organization inherently takes responsibility for actions taken by user under the auspice of their organizational identity.
* User’s organization takes responsibility for activating/deactivating and monitoring identity.

_Cons_

* Can only be used if the user’s organization is part of the InCommon federation. 
* Reference [this resource](https://www.opensciencedatacloud.org/console/) for organizations supported by InCommon.

### eduGAIN

eduGAIN is an international “interfederation” of identity and service providers around the world. InCommon is a participant in eduGAIN.

_Pros_

* User’s organization inherently takes responsibility for actions taken by user under the auspice of their organizational identity.
* User’s organization takes responsibility for activating/deactivating and monitoring identity.
* International presence, and InCommon is a participant

_Cons_

* Can only be used if the user’s organization is part of one of the 60+ federations participating in eduGAIN. 
* Reference [this resource](https://edugain.org/participants/how-to-use-edugain/) for organizations supported by eduGAIN.

### ORCID

Provides an identifier for individuals to use with their name as they engage in research, scholarship, and innovation activities. 

_Pros_

* Most (all) researchers either have an ORCID or can easily create an ORCID.

_Cons_

* User’s organization does not inherently take responsibility for actions taken by user under auspice of ORCID identity.
* Neither user’s organization nor ORCID take responsibility for activating/deactivating users based on affiliation.

### Google / Microsoft Office 365 (personal account)

Google Sign-In / Microsoft Office 365 secure authentication systems as registered by an individual with no organizational affiliation or management.

_Pros_

* Most users either have a Google/Microsoft identity or can easily create one.

_Cons_

* User’s organization does not inherently take responsibility for actions taken by user under auspice of personal Google/Microsoft identify.
* Neither user’s organization does not take responsibility for activating/deactivating users based on affiliation.


## 6. Programs and Projects

In a Gen3 Data Commons, programs and projects are two administrative nodes in the graph database that serve as the most upstream nodes. A program must be created first, followed by a project. Any subsequent data submission and data access, along with control of access to data, is done through the project scope.

In order to create a program or a project, you need administrator privileges. If not done before, edit the `Secrets/user.yaml` file and set up your privileges for the services, programs, and projects following the example format shown in the file.

To create a program, visit the URL where your Gen3 Commons is hosted and append `/_root`. If you are running the Docker Compose setup locally, then this will be `localhost/_root`. Otherwise, this will be whatever you set the `hostname` field to in the creds files for the services with `/_root` added to the end. Here, you can choose to either use form submission or upload a file. Choose form submission, search for "program," and then fill in the "dbgap_accession_number" and "name" fields, and hit "Submit". If the message is green ("succeeded:200"), that indicates success, while a grey message indicates failure. More details can be viewed by clicking on the "DETAILS" button.

To create a project, visit the URL where your Gen3 Commons is hosted and append the name of the program you want to create the project under. For example, if you are running the Docker Compose setup locally and would like to create a project under the program "Program1", the URL you will visit will be `localhost/Program1`. You will see the same options to use form submission or upload a file. This time, search for "project," and then fill in the fields and hit "Submit." Again, a green message indicates success while a grey message indicates failure, and more details can be viewed by clicking on the "DETAILS" button.

Once you've created a program and a project, you're ready to start submitting data for that project! Please note that Data Submission refers to metadata regarding the file(s) (Image, Sequencing files, etc.) that are to be uploaded. Please refer to the [Gen3 website](https://gen3.org/resources/user/submit-data/) for additional details.
