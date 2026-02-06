#!/bin/bash
function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
cd $localdir
git sparse-checkout init --cone
git sparse-checkout set $@
mv -n $@ ../
cd ..
rm -rf $localdir
}

function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}
git clone --depth 1 -b openwrt-25.12 https://github.com/sbwml/autocore-arm
git clone --depth 1 -b master https://github.com/jerrykuku/luci-theme-argon
curl -s https://cdn.jsdelivr.net/gh/Xiaokailnol/AutoSync/images/bg1.jpg > luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
git clone --depth 1 -b master https://github.com/jerrykuku/luci-app-argon-config
sed -i "s/option online_wallpaper 'bing'/option online_wallpaper 'none'/g" luci-app-argon-config/root/etc/config/argon
git clone --depth 1 -b master https://github.com/sirpdboy/luci-theme-kucat
git clone --depth 1 -b master https://github.com/sirpdboy/luci-app-kucat-config
git clone --depth 1 -b main https://github.com/sbwml/openwrt_pkgs && mv -n openwrt_pkgs/{vlmcsd,fw_download_tool,luci-app-socat,luci-app-ramfree,luci-app-diskman,luci-app-wolplus,bash-completion,luci-app-vlmcsd,luci-app-ota,luci-app-vsftpd} ./; rm -rf openwrt_pkgs
git clone --depth 1 -b master https://github.com/sbwml/luci-app-mentohust openwrt_mentohust && mv -n openwrt_mentohust/{luci-app-mentohust,mentohust} ./; rm -rf openwrt_mentohust
git clone --depth 1 -b master https://github.com/destan19/OpenAppFilter && mv -n OpenAppFilter/{oaf,open-app-filter,luci-app-oaf} ./; rm -rf OpenAppFilter
git clone --depth 1 -b v5 https://github.com/sbwml/luci-app-mosdns openwrt-mosdns && mv -n openwrt-mosdns/{v2dat,mosdns,luci-app-mosdns} ./; rm -rf openwrt-mosdns
git clone --depth 1 -b main https://github.com/sbwml/luci-app-openlist2 openwrt-openlist2 && mv -n openwrt-openlist2/{openlist2,luci-app-openlist2} ./; rm -rf openwrt-openlist2
git clone --depth 1 -b main https://github.com/sbwml/luci-app-quickfile openwrt-quickfile && mv -n openwrt-quickfile/{quickfile,luci-app-quickfile} ./; rm -rf openwrt-quickfile
git clone --depth 1 -b main https://github.com/sirpdboy/luci-app-netwizard openwrt-netwizard && mv -n openwrt-netwizard/luci-app-netwizard ./; rm -rf openwrt-netwizard
git clone --depth 1 -b main https://github.com/sirpdboy/luci-app-adguardhome openwrt-adguardhome && mv -n openwrt-adguardhome/luci-app-adguardhome ./; rm -rf openwrt-adguardhome
