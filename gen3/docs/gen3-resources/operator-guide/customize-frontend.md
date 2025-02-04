# Customize appearance of the front end

Below we show a few examples of how to customize the Gen3 Data Portal.

For a more technical and complete background, see [portal configurations on GitHub][portal config].

## Login Page



### Login Image

Customize the image that appears on the [Login Page][data hub login] with a vector graphic (eg. *.svg) of your choice.

![Login Page][login page image]

* [Review code to include the path-to-image in gitops.json][gitops.json login page image].


### Information on Login and Commons

Customize the text that appears on the [Login Page][data hub login] by specifying title, description, subtitle, contact, or email.

* [Review the code to edit title, subtitle, text, contact, and email][gitops.json login page text].


## Landing Page

### Information on Commons

Customize the name of the Data Commons, the info text, and the button below that  appear on the top left side of the Landing Page after logging in.

![landingpage_info][landing page text]

* [Review the code to edit heading, text, and link][gitops.json landing page text].


### Summary Statistics

Customize the summary statistics that appear on the top right side of the Landing Page after logging in. The attributes are graphQL fields, which must be in the dictionary, configured in the etlMapping.yaml, and populated with data on the backend.

![landingpage_counts][landing page stats]

* [Review the code to edit graphQL queries][gitops.json graphql].
* [Review the code to edit the graphQl queries after being logged in][gitops.json graphql logged in].


### Cards

Customize the cards that appear on the bottom of the Landing Page after logging in.

![landingpage_cards][landingpage cards]

* [Review the code to edit name, icons, body, link, and label of the cards][gitops.json cards].
* Adding a new icon requires saving the icon in [this repository][icons] and [in this file][icons index].


## Navigation Items

Customize the icons, link, and names that appear on the Data Commons navigation bar.
The "tooltip" shows text upon hovering over the icon.

![navigationbar][navigationbar image]

* [Review the code to edit icon, link, color, tooltip, and name of the navigation items][gitops.json navbar].
* Adding a new icon requires saving the icon in [this repository][icons] and [in this file][icons inex].

## Data Commons or Mesh Title

Customize the title that appears in the top left corner such as for the [Biomedical Research Hub][brh].

![name-commons][commons name image]

* [Review the code to edit the title of the Data Commons][edit title].


## Top Bar

Customize the top bar that appears in the top right corner.

![topbar][topbar image]

* [Review the code to edit the top bar (link, name, icon, dropdown) of the Data Commons][gitops.json topbar].


## Color Theme

Customize the color theme for buttons, top navigation bar, and any types of charts on the Exploration and Landing Page.

* [Review the code to edit the 9 colors of a Data Commons][gitops.json color updates].


## Footer Logo

Customize the logos in the Footer.

![footer][footer image]

* [Review the code to edit the source, link, and name of logos in the footer of a Data Commons][gitops.json footer].


## Notebook Browser

Customize the [Notebook Browser][brh notebooks] page to preview Jupyter Notebooks by adding images, titles, descriptions, and links to the Jupyter Notebook.

![notebookbrowser][notebook image]

* [Review the code to edit the title, description, link, and imageURL][gitops.json notebooks].




<!-- Links -->
[portal config]: https://github.com/uc-cdis/data-portal/blob/master/docs/portal_config.md
[data hub login]: https://gen3.datacommons.io/login
[login page image]: img/login_page.png
[gitops.json login page image]: https://github.com/uc-cdis/cdis-manifest/blob/456e1a3b5b3cc5dc23b83e1f96c0770a2007162a/gen3.datacommons.io/portal/gitops.json#L130
[gitops.json login page text]: https://github.com/uc-cdis/cdis-manifest/blob/456e1a3b5b3cc5dc23b83e1f96c0770a2007162a/gen3.datacommons.io/portal/gitops.json#L124-L129
[landing page text]: img/landingpage_info.png
[gitops.json landing page text]: https://github.com/uc-cdis/cdis-manifest/blob/456e1a3b5b3cc5dc23b83e1f96c0770a2007162a/gen3.datacommons.io/portal/gitops.json#L39-L44
[landing page stats]: img/landingpage_counts.png
[gitops.json graphql]: https://github.com/uc-cdis/cdis-manifest/blob/456e1a3b5b3cc5dc23b83e1f96c0770a2007162a/gen3.datacommons.io/portal/gitops.json#L3-L36
[gitops.json graphql logged in]: https://github.com/uc-cdis/cdis-manifest/blob/4a922a04456423fea5d1e59c5431cedb460280d0/data.midrc.org/portal/gitops.json#L98-L113
[landingpage cards]: img/landingpage_cards.png
[gitops.json cards]: https://github.com/uc-cdis/cdis-manifest/blob/456e1a3b5b3cc5dc23b83e1f96c0770a2007162a/gen3.datacommons.io/portal/gitops.json#L46-L75
[icons]: https://github.com/uc-cdis/data-portal/tree/master/src/img/icons
[icons index]: https://github.com/uc-cdis/data-portal/blob/67f2b83227b9c3b48143bd2938cad160fc225394/src/img/icons/index.jsx
[navigationbar image]: img/navigationbar.png
[brh]: https://brh.data-commons.org/
[commons name image]: img/name-commons-or-mesh.png
[edit title]: https://github.com/uc-cdis/cdis-manifest/blob/a68f8df12173e4b9d06dcdf3fad2cc1643a73f89/gen3.theanvil.io/portal/gitops.json#L71-L72
[topbar image]: img/topbar.png
[gitops.json topbar]: https://github.com/uc-cdis/cdis-manifest/blob/4a922a04456423fea5d1e59c5431cedb460280d0/data.midrc.org/portal/gitops.json#L146-L171
[gitops.json color updates]: https://github.com/uc-cdis/cdis-manifest/blob/4a922a04456423fea5d1e59c5431cedb460280d0/data.midrc.org/portal/gitops.json#L146-L171
[footer image]: img/footer.png
[gitops.json footer]: https://github.com/uc-cdis/cdis-manifest/blob/551f0963e60f6000ae8b9987592495406a031c81/gen3.datacommons.io/portal/gitops.json#L156-L168
[brh notebooks]: https://brh.data-commons.org/resource-browser
[notebook image]: img/notebookbrowser.png
[gitops.json notebooks]: https://github.com/uc-cdis/cdis-manifest/blob/0e5a08eed8b417a721a6324f820abe8ea4ef4e17/chicagoland.pandemicresponsecommons.org/portal/gitops.json#L1097-L1175
