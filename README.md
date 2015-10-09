# MaxCDN OpenCart module

Module allows to integrate MaxCDN to your OpenCart store.
Supported OpenCart versions 1.5.x - 2.x.x.

## Installation

### OpenCart 2.x.x

#### Method #1 (if store's Settings -> FTP tab is configured)

* Go to "Extensions" -> "Extension Installer" on your OpenCart store's admin.
* Click on "Upload File" button, locate and select maxcdn.ocmod.zip file.
* Wait till installation process is finished and then make additional steps if needed.
* Go to "Extensions" -> "Modification" and click on "Refresh" button to rebuild modification cache.
* Go to "Extensions" -> "Modules" and click "Install" button of "MaxCDN" module.

#### Method #2 (manual files upload)

* Unzip file maxcdn.oc20.zip
* Upload contents of "upload/" folder to your OpenCart store's www root directory.
* Go to "Extensions" -> "Extension Installer" on your OpenCart store's admin.
* Click on "Upload File" button, locate and select install.ocmod.xml file.
* Wait till installation process is finished and then make additional steps if needed.
* Go to "Extensions" -> "Modification" and click on "Refresh" button to rebuild modification cache.
* Go to "Extensions" -> "Modules" and click "Install" button of "MaxCDN" module.

AFTER MODULE INSTALLATION CHECK STORE'S SETTINGS "SERVER" TAB IF "MAINTENANCE MODE" IS OFF.

### OpenCart 1.5.x

Before installing module make sure to have installed vQmod on your OpenCart store.
To install vQmod read [Installing vQmod on OpenCart][0]

* Unzip file maxcdn.oc15.zip
* Upload contents of "upload/" folder to your OpenCart store's www root directory.
* Go to "Extensions" -> "Modules" and click "Install" button of "MaxCDN" module.

[0]: https://github.com/vqmod/vqmod/wiki/Installing-vQmod-on-OpenCart