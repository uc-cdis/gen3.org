---
title: "Access Data"
date: 2018-09-12T23:08:34-05:00
linktitle: /resources/user
---
{{% markdownwrapper %}}
# Accessing metadata and data
* * *

The sponsor of a Gen3 data commons typically decides how users will access data in object storage. In some cases, approved users may be allowed to download data directly to their local computer from within an internet browser or with the [cdis-data-client](https://github.com/uc-cdis/cdis-data-client/releases). When more security is required, users may be required to download and analyze data in a protected environment, such as a virtual machine (VM) in a virtual private cloud (VPC).


## Accessing data from within a browser
* * *

Once data files are registered, their address in s3 object storage can be obtained by providing the file's UUID to the following URL:
https://examplecommons.gen3.org/index/index/UUID

Data files can be downloaded by providing the file's UUID to the following URL:
https://examplecommons.gen3.org/user/data/download/UUID


## Downloading data with the cdis-data-client
* * *

Data files can also be downloaded using the "cdis-data-client", which provides a simple command-line interface for downloading and uploading data files.

[Download the latest release of the client here.](https://github.com/uc-cdis/cdis-data-client/releases)

Once downloaded and installed, the client can be configured with the API credentials.json downloaded from your Profile in the data portal:
```
./cdis-data-client configure --profile <profile_name> --cred /path/to/api/credentials.json
```

The client will then prompt you for the API. Enter the API of your commons, e.g.:
```
API endpoint: https://gen3.datacommons.io/
```

To download a data file, pass the file's UUID to the client:
```
cdis-data-client download --profile <profile_name> --file ./filename.tsv --uuid d7a5XXXX-XXXX-XXXX-XXXX-XXXX53583014
```

In the above command, `download` mode is specified, the `profile_name` we configured with the API credentails earlier is used, and a filename (`filename.tsv`) was specified for our local copy of the downloaded file.

{{% /markdownwrapper %}}