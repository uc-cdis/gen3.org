# Authentication Methods Available in Gen3



Authentication is a way of telling a Gen3 system who you are. This requires you configure an Identity Provider (IdP), which is configured through the [Fence service](https://github.com/uc-cdis/fence). Your choice of IdP will be determined by the governance and security requirements of the data commons or mesh you are operating.  At the moment, the supported IDPs include the following. Pros and Cons are included for a subset of popular options.  Please refer to the [fence documentation](https://github.com/uc-cdis/fence) for additional details.

* **Google** - Institutional Account
    * Pros
        * User’s organization inherently takes responsibility for actions taken by user under the auspice of their organizational identity.
        * User’s organization takes responsibility for activating/deactivating and monitoring identity.
    * Cons
        * Can only be used if the user’s organization utilizes Google for identity management.
* **Shibboleth**
    * **NIH iTrust** - NIH Login / iTrust / eRA Commons. eRA Commons is an authentication system developed by NIH for the management of research grants.
        * Pros
            * Intended for officials, principal investigators, trainees and post-docs at institutions/organizations to access and share information relating to research grants.
            * Ties in tightly with dbGaP, which controls authorization for many NIH projects.
        * Cons
            * Can only be used if the commons is sponsored by an NIH institute.
    * **InCommon** - InCommon, operated by Internet2, provides a secure and privacy-preserving trust fabric for research and higher education, and their partners, in the United States. Individual identity providers, such as NIH iTrust and most academic institutions, are federated by InCommon.
        * Pros
            * User’s organization inherently takes responsibility for actions taken by user under the auspice of their organizational identity.
            * User’s organization takes responsibility for activating/deactivating and monitoring identity.
        * Cons
            * Can only be used if the user’s organization is part of the InCommon federation.
            * Reference [this resource](https://www.opensciencedatacloud.org/console/) for organizations supported by InCommon.
    * **eduGAIN** - eduGAIN is an international “interfederation” of identity and service providers around the world. InCommon is a participant in eduGAIN.
        * Pros
            * User’s organization inherently takes responsibility for actions taken by user under the auspice of their organizational identity.
            * User’s organization takes responsibility for activating/deactivating and monitoring identity.
            * International presence, and InCommon is a participant
        * Cons
            * Can only be used if the user’s organization is part of one of the 60+ federations participating in eduGAIN. Reference [this resource](https://edugain.org/participants/how-to-use-edugain/) for organizations supported by eduGAIN.
* **Microsoft** - Microsoft Office 365 secure authentication system as provided by the user’s organization.
    * Pros
        * User’s organization inherently takes responsibility for actions taken by user under the auspice of their organizational identity.
        * User’s organization takes responsibility for activating/deactivating and monitoring identity.
    * Cons
        * Can only be used if the user’s organization utilizes Microsoft Office 365 for identity management.
* **ORCID** - Provides an identifier for individuals to use with their name as they engage in research, scholarship, and innovation activities.
    * Pros
        * Most (all) researchers either have an ORCID or can easily create an ORCID.
    * Cons
        * User’s organization does not inherently take responsibility for actions taken by user under auspice of ORCID identity.
        * Neither user’s organization nor ORCID take responsibility for activating/deactivating users based on affiliation.
* **Google or Microsoft** - Personal Account
Google Sign-In / Microsoft Office 365 secure authentication systems as registered by an individual with no organizational affiliation or management.
    * Pros
        * Most users either have a Google/Microsoft identity or can easily create one.
    * Cons
        * User’s organization does not inherently take responsibility for actions taken by user under auspice of personal Google/Microsoft identify.
        * Neither user’s organization does not take responsibility for activating/deactivating users based on affiliation.
* **RAS**
* **CILogon**
* **Cognito**
* **Synapse**
