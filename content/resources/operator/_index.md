---
identifier: operator
title: Gen3 - Set up Gen3
linktitle: /resources/operator
date: 2018-09-04T22:16:21-05:00
layout: withtoc
menuname: operatorMenu
---

# Running a Gen3 Data Commons

## 1. Docker-Compose

Docker-compose allows you to quickly run a Gen3 commons on a single computer or in a single VM in a matter of minutes. 

This option is suitable for those that wish to run a small data commons, experiment with the technology, or even do local development on the Gen3 services. Using this method does not get you the full suite of automation, and logging for Gen3 commons. 

We strongly recommend you start here for your first experience running the Gen3 platform.

[Gen3 Docker-Compose](https://github.com/uc-cdis/compose-services)

## 2. Cloud Automation

Cloud automation is how we deploy Gen3 data commons in production environments on Amazon Web Services, Google Cloud Platform, Microsoft Azure, and OpenStack environments. Cloud automation is fully featured supporting integrated logging, security, and compliance steps. With cloud automation, we utilize Kubernetes to orchestrate our services into a scalable environment that can be run in a cost efficient manner for many tens to thousands of users.

Cloud automation utilizes Terraform for repeatable infrastructure deployments onto the public clouds. Additionally, we have custom Gen3 specific tooling to help automate various steps in the Kubernetes deployment process such as rolling pod versions, and scaling up. 

Currently, Gen3 deployment using cloud automation relies on a number of supporting features to be in place. It is a work in progress to continue to ease the Gen3 deployment process for groups without existing supporting infrastructure. We welcome all comments, feature requests, and pull requests using GitHub issues or the [Gen3 community](https://forums.gen3.org).

[Gen3 Cloud Automation](https://github.com/uc-cdis/cloud-automation/blob/master/gen3)

## 3. Creating a New Data Dictionary
   
### Core Dictionary
   Gen3 is in the process of creating a baseline data dictionary that will allow users to create their own data dictionary. It would serve as a starting point for someone who is interested in creating their own dictionary.  It will be a consensus of previously used data dictionaries and will make the process of creating a data dictionary more efficient.  This [site](https://github.com/uc-cdis/compose-services/tree/master/example-schemas) contains sample dictionaries that can aid the process of creating new dictionaries.
### Modifying a Data Dictionary
Once users have obtained the baseline dictionary, users can make updates to it.  To create a data dictionary tailored to a particular project, the user can modify the baseline dictionary using a program which automatically updates the dictionary given TSV input which specifies the desired changes to the dictionary. The updates are based on instructions that are included in a TSV file such as update a property, delete a node, etc.  Instructions for implementing the script can be found [here](https://github.com/uc-cdis/planx-bioinfo-tools/tree/feat/auto_tools/dictionary_tools).  For those that are interested in making edits directly to a YAML file, we are also in the process of automating this process.
### Best Practices
#### Data Normalization
When adding a new project or study into a new or an already existing data dictionary, it is important to follow the process of normalizing of data.  This process helps with the prevention of redundant data.  Before submitting new data to the data dictionary, check the current dictionary for properties that already exist.  If there is a similar property that exist, it is best to use the existing property.  For example, if a candidate property named “infection agent” and a property named “infectious agent” already exist, then use “infectious agent.”
#### Referencing external data standards
Gen3 is expanding the information in data dictionaries by including references to external standards such as the National Cancer Institute Thesaurus (NCIt).  This will help with the comparison of studies and projects and provide researchers with proper references.  The NCIt is being used for many of the schemas as it is inclusive of several different domains (e.g., cancer, drug, etc.).  It also has an abundance of temporal related terms (e.g., day, month, etc.) along with other useful categories of terms.  The benefit of this effort is that it will facilitate cross data common comparison.  For instance, if tuberculosis is a term associated with multiple studies, a search of that term will provide insight into each of the studies.  It will also help with the prevention of adding multiple terms for properties that mean the same thing.  The example below demonstrates a cross study comparison using YAML files (CTDS uses YAML files to help organize data dictionaries.  The files are used by internal systems to help manage the data dictionaries.)  The two files both relate to blood pressure finding, but each has a different term name.  The external reference helps with harmonization efforts by helping identify terms that have the same meaning.
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
#### Specificity vs. Generality
One of the goals when providing an external reference is to figure out the level of specificity when breaking down a property name that contains multiple concepts.  The question is whether the new references should be created with very specific designations (This is known as pre-coordination).   This option would likely create the need for the request of new terms in the external standard if the term is not in existence. The other question is should the use of multiple terms that already exist in an external standard be used (This is known as post-coordination).  The best practice adopted by CTDS is to use specificity whenever corresponding terms are available in the external standard.  However, If specific terms are not available, use generality by creating multiple terms that already exist in an external standard.  For instance, if grapefruit juice is a property of interest and it is not found in the external reference, but grapefruit and juice are found individually, then using the individual properties is the preferred method. 
