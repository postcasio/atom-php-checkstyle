#The Changelog

##0.8.0
* Ability to sniff on save [Implements GH-2](https://github.com/benmatselby/atom-php-checkstyle/issues/2)
* Ability to toggle execution on save

##0.7.0
* Render gutter marks for sniffer errors
* Ability to toggle gutter marks on|off
* Ability to toggle phpcs execution on|off when sniffing file
* Ability to toggle phpmd execution on|off when sniffing file
* Ability to toggle the linter when sniffing file
* Pulled out controller methods into PhpCheckstyle class
* Entry point moved to main.coffee and updated package.json

##0.6.1
* Fixed sorting bug by implementing getFilterKey

##0.6.0
* Fixed [GH-7](https://github.com/benmatselby/atom-php-checkstyle/issues/7), which is to unescape html entities for list view. Thanks to [Ciaran Downey](https://github.com/ciarand).
* Started to follow GH coding standard for coffeescript

##0.5.0
* Display what has been fixed by php-cs-fixer
* Display a message to say nothing was fixed by the php-cs-fixer, if no changes were made
* Created a base view and moved most of the common code there (work in progress)

##0.4.2
* Add verbosity to php-cs-fixer command until I figure out a UI mechanism to display success|fail
* Define multiple scope names for PHP, as suspect they may change based on open issues in language-php

##0.4.1
* Fixed php-cs-fixer command being broken by shell accepting an array of commands

##0.4.0
* Linter functionality has been added
* Mess Detector functionality has been added

##0.3.0
* Ability to "Fix" a file using [PHP CS Fixer](http://cs.sensiolabs.org/)
* Tidied up the naming convention in the menus
* Ability to select a sniffer error from the list and be taken to the line it has occurred

##0.2.0
* Now has configuration options for phpcs thanks to [Phil Sturgeon](https://github.com/philsturgeon)
* Now displays the line number alongside the error message in the list view

##0.1.0
* Initial release, only really runs the phpcs and tries to report
