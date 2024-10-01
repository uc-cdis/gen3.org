# Create Data Dictionary

* create DD and Data Model (if you have not already): https://gen3.org/resources/operator/#2-creating-a-new-data-dictionary

Note: this may, but does not have to be, done before Helm deployment. If it is not done before, Helm will use a default dictionary. It is simple to replace the default dictionary with the customized dictionary AS LONG AS:

* data has not been submitted with the default dictionary
* ETL mapping has not been done based on the default dictionary
