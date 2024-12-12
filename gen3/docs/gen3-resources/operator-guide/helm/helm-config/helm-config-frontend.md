# Configure Frontend for Helm Deployment

Portal is the front-end service Gen3 currently uses to render the commons webpage. However, we expect to soon offer the Frontend Framework service (not yet available) as the preferred front-end service.

## Portal

### What Does it Do
Portal is a core service that renders the complete commons webpage, it is the front end service.

### Default settings

If you deploy Helm without customizing any configuration, you can see the [default Portal values here](https://github.com/uc-cdis/gen3-helm/blob/master/helm/portal/values.yaml).

### How to Configure it

To configure portal, there must be an entry in the versions block. The portal_app also needs to be defined in the global block. Gitops sets to use the files in the ~/cdis-manifest/(commons url)/ portal directory, dev is the common setup for development environments and there are [default gitops.json files for most commons in the data-portal repo](https://github.com/uc-cdis/data-portal/tree/master/data/config) that the portal app can be set to.

```
portal:
  enabled: true

  gitops:
    # -- (string) multiline string - gitops.json
    json: |
      {}
    # -- (string) - favicon in base64
    favicon: ""
    # -- (string) - multiline string - gitops.css
    css: |
      /* gitops default css */
    # -- (string) - logo in base64
    logo: ""
    # -- (string) - createdby.png - base64
    createdby: ""
    sponsors:
```

You can find more information about [portal configuration options here](https://github.com/uc-cdis/data-portal/blob/master/docs/portal_config.md)

You can also be configure Portal with different images and icons by updating the values; an [example from the BDC data commons is here](https://github.com/uc-cdis/cdis-manifest/tree/master/gen3.biodatacatalyst.nhlbi.nih.gov/portal).

## Frontend Framework

Note: the Frontend Framework is not yet fully released. You can learn more about it from [this Gen3 Community Forum from May 2024](https://gen3.org/community/events/#gen3.2---how-to-build-a-gen3-data-portal-using-the-new-frontend-framework).

### What Does it Do
Frontend Framework will be a core service that renders the complete commons webpage; it will replace the Portal as the frontend service.

### Default settings

If you deploy Helm without customizing any configuration, you can see the [default Frontend Framework values here](https://github.com/uc-cdis/gen3-helm/blob/master/helm/frontend-framework/values.yaml).

### How to Configure it

More information about this will be provided when the Frontend Framework is released.
