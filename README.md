ADRE is a quick-and-dirty way to systematically de-brand (and re-brand) your omnibus-gitlab instance.

The script works by offering a consistent way of replacing some branding-related files on each reconfigure.

usage
-----

First, examine the READMEs in the sub-folders of this project for more information on supported file replacements.

To get it up and running, add the following line to /etc/gitlab/gitlab.rb:

```
require '<path to gitlab-adre.rb>'
```

Then reconfigure and restart omnibus-gitlab by executing:

```
gitlab-cti reconfigure
gitlab-cti restart
```

Refresh your browser to see your changes.

