#!/bin/sh

set -e

work_dir=$1
version=$2
echo "make version $version"

# default icon
cd $work_dir
ditto -c -k --sequesterRsrc --keepParent Emacs.app "emacs-$version.zip"
echo "done with emacs-$version.zip"

# spacemacs icon
icon_dir="Emacs.app/Contents/Resources/Emacs.icns"
rm $icon_dir
curl -L "https://github.com/nashamri/spacemacs-logo/blob/master/spacemacs.icns?raw=true" -o $icon_dir
ditto -c -k --sequesterRsrc --keepParent Emacs.app "emacs-$version-spacemacs-icon.zip"
echo "done with emacs-$version-spacemacs-icon.zip"