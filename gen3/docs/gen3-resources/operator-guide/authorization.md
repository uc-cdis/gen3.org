
# Controlling authorization of data access

## Unstructured data
Files can be either open access or controlled access within a Gen3 Data Commons.  Access to controlled files is managed either through dbGaP or via an allow list.



### Authentication

Authentication is a way of telling a Gen3 system who you are.  This requires you configure an Identity Provider (IdP), which is configured through the [Fence service][Fence]. At the moment, the supported IDPs include:

  *  Google
  *  Shibboleth
  *  NIH iTrust
  *  InCommon
  *  eduGAIN
  *  CILogon
  *  Cognito
  *  Synapse
  *  Microsoft
  *  ORCID
  *  RAS


### Authorization

Authorization establishes to which files a particular user or user group has access.

The `user.yaml` file is one way to get authorization information into Gen3. It is ingested via Fence's usersync script. The format of this file is tightly coupled with the notions of resource, role and policy as defined by Gen3's policy engine, [Arborist][arborist].

Detailed instructions on the format of the user.yaml can be found [here][Fence user.yaml].

Authorization can also be managed via dbGaP, which is documented [here][dbGaP].

#### Authorization more granular than the project level

By default, authorization can be made at the level of the project, but indexd can support more granular access.  To modify authorization within indexd, you can do the following:

1. Obtain GUIDs for files for which you wish to update the authZ field.
2. Download the Gen3 Python SDK [here](https://github.com/uc-cdis/gen3sdk-python), as this will allow you to make changes to the indexd records. Run `pip install gen3`.
3. Programatically change the authz of the indexd record:

    With the list of GUIDs for a specific institution and your credentials that you downloaded from the profile page on the commons, you will run the following Python script that will make edits to the indexd database. In this example Python script, the changes to the authz field are being made to the program and project my_program-TEST1. In this instance, the new authz field is going to have a sources resource called DEMO. The endpoint is the common’s url and the auth function will call your credentials files.

    ```
    import gen3
    from gen3.auth import Gen3Auth
    from gen3.index import Gen3Index

    guids=["guid1",”guid2”,”guid3”...”guidN”]

    new_authz="/programs/my_program/projects/TEST1/sources/DEMO"


    endpoint="https://url.commons.org" #commons URL
    auth=Gen3Auth(endpoint, refresh_file="credentials.json") #your creds

    index = Gen3Index(endpoint,auth)

    for guid in guids:
        index.update_record(guid=guid, authz=[new_authz])
        print(guid + " has been updated to the following authz: " + new_authz)
    ```

4. Edit the user.yaml

The user.yaml will require changes to three sections to make these files with new authz fields accessible:

**Policies**. This notes the resource path and the permissions (role_id) you will give to the id.

```
- id: 'my_program-TEST_DEMO_downloader'
role_ids:
- 'reader'
- 'storage_reader'
resource_paths:
- '/programs/my_program/projects/TEST1/sources/DEMO
```

**Resources**. The list structure of the resources as seen in your resource path, for example
`/programs/my_program/projects/TEST1/sources/DEMO:`

```
resources:
- name: my_program
  subresources:
     - name: projects
    	subresources:
    	- name: TEST1
      	  subresources:
      	  - name: sources
           subresources:
           - name: name1
           - name: DEMO
           - name: name2
           - name: name3
           - name: name4
```

**Users**. The user profile and the id that is assigned to them, which allows for the permissions set in the policies:

```
  user@gmail.edu:
	policies:
	- my_program-TEST1_reader
	- my_program-TEST1_name1_downloader
	- my_program-TEST1_DEMO_downloader
	- my_program-TEST1_name2_downloader
	- my_program-TEST1_name3_downloader
	- my_program-TEST1_name4_downloader
```



## Structured data
Structured data can be masked or hidden from unauthorized users within the Guppy Service.  The tiered-access setting is configured through either the `TIER_ACCESS_LEVEL` environment variable or the `tier_access_level` properties on individual indices in the esConfig. Guppy supports three different levels of tiered access:

1. Private by default: only allows access to authorized resources
2. Regular: allows all kind of aggregation (with limitation for unauthorized resources), but forbid access to raw data without authorization
3. Libre: access to all data

Read more details about configuration within the [Guppy documentation][guppy docs].

## Semi-structured data
Access to semi-structured data (i.e. MDS or AggMDS) is completely open-access and cannot be made to be controlled access at this time.


[arborist]: https://github.com/uc-cdis/arborist
[Fence]: https://github.com/uc-cdis/fence
[Fence user.yaml]: https://github.com/uc-cdis/fence/blob/master/docs/additional_documentation/user.yaml_guide.md
[dbGaP]: https://github.com/uc-cdis/fence/blob/master/docs/additional_documentation/dbgap_info.md
[guppy docs]: https://github.com/uc-cdis/guppy?tab=readme-ov-file#tiered-access
