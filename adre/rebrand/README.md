This directory contains files that will replace the originals in omnibus-gitlab.

The following files are supported:

1. [brand_logo.png](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/app/assets/images/brand_logo.png) - large logo on the login page
2. [logo-black.png](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/app/assets/images/logo-black.png) - small logo in the navigation bar (light themes)
3. [logo-white.png](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/app/assets/images/logo-white.png) - small logo in the navigation bar (dark themes)
4. [devise.html.haml](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/app/views/layouts/devise.html.haml) - content/layout for login page
5. [_promo.html.haml](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/app/views/shared/_promo.html.haml) - links below project/group list (dashboard)

The actual files in the Rails Asset Pipeline (http://guides.rubyonrails.org/asset_pipeline.html) are modified, which really isn't the best way to do de/re-branding.

The .png files in this repo are 1x1 fully-transparent PNG files.
Running the script with these files as-is will effectively de-brand your omnibus-gitlab instance.
Replace these files with images of your choice.

.haml mods are not supplied.
To start, refer to http://axilleas.me/en/blog/2014/custom-gitlab-login-page/
The actual file locations are:

* /opt/gitlab/embedded/service/gitlab-rails/app/views/layouts/devise.html.haml
* /opt/gitlab/embedded/service/gitlab-rails/app/views/shared/_promo.html.haml
