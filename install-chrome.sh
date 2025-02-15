#!/bin/bash

install_chrome_extension () {
  preferences_dir_path="/opt/google/chrome/extensions"
  pref_file_path="$preferences_dir_path/$1.json"
  upd_url="https://clients2.google.com/service/update2/crx"
  mkdir -p "$preferences_dir_path"
  echo "{" > "$pref_file_path"
  echo "  \"external_update_url\": \"$upd_url\"" >> "$pref_file_path"
  echo "}" >> "$pref_file_path"
  echo Added \""$pref_file_path"\" ["$2"]
}

if ! which "google-chrome" ; then
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub \
  | apt-key add -
  echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' \
  | tee /etc/apt/sources.list.d/google-chrome.list
  apt-get update
  apt-get install -y --no-install-recommends google-chrome-stable
else
  echo Chrome already installed
fi

install_chrome_extension "dookpfaalaaappcdneeahomimbllocnb" "foxyproxy-basic"
install_chrome_extension "hlkenndednhfkekhgcdicdfddnkalmdm" "cookie-editor"
install_chrome_extension "cjpalhdlnbpafiamejdnhcphjbkeiagm" "ublock-origin"
