# enable_sudo_touchid

This generates a Munki [nopkg](https://github.com/munki/munki/wiki/nopkgs) to enable Touch ID for sudo.

For more information, please see [my blog post](https://mikesolin.com/2020/06/14/using-munki-to-enable-sudo-for-touch-id/).

# Requirements

* Munki
* A Mac with Touch ID

# Installation

1. Edit `munkiimport.sh`. Towards the top of the file, change the `munki_repo` variable to the location of your Munki repository, if it's not available at `/Volumes/munki_repo`. Replace `Your Org` with your organization's name. Finally, specify the pkginfo path to save the file, if you don't have a `pkgsinfo/scripts` directory in your Munki repository.
2. `cd` into the directory containing the code.
3. Run `munkiimport.sh`.
4. Add it to a catalog and a manifest.