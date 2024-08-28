# Gen3 Data Commons

Gen3 Data Commons are cyberinfrastructure that co-locates data analysis, exploration and visualization tools with data management services for import and export of structured information like clinical, phenotypic, or biospecimen data, and data objects, like genomics data files or medical images.

Gen3 Data Commons are capable of interoperation with other resources in a data ecosystem by utilizing the Gen3 Framework Services for user authentication and authorization, data object indexing, and metadata services.

## Data Search

![alt text](img/features/search.svg)

Gen3 data commons offer several methods for finding and querying stored data. The data portal boasts a built-in data exploration GUI, featuring faceted search for quick and easy creation of virtual patient cohorts and data object subsets. There is also a GraphiQL query building interface, which allows users to create and send custom queries to the Gen3 databases. The open APIs that power these built-in user interfaces in the data portal can also be sent custom query requests, enabling programmatic data search and custom app development.

## Data Management

![alt text](img/features/submit-data.svg)

Gen3 data commons support complete data management functionality, including data access control, ingestion, export, and quality control. Data access is controlled through an attribute-based access control (ABAC) policy engine. Data object indexing and associating objects with metadata is possible both within the web-based portal and from the command line by sending requests to the data submission API. Data quality is controlled through implementing a data model against which submissions are validated to ensure all required fields are present and have appropriate values.

# Data Portal

![alt text](img/features/portal.svg)

Gen3 data commons include a data portal as a default application over a commons. The portal is an interactive website, accessible through standard web-browsers, that allows users to explore, submit, download, and analyze data. The data portal utilizes the open Gen3 APIs to offer a graphical user interface for the basic functionality of a Gen3 data commons.
