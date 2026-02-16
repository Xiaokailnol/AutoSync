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
git clone --depth 1 -b master https://github.com/sirpdboy/luci-theme-kucat
git clone --depth 1 -b master https://github.com/sirpdboy/luci-app-kucat-config
git clone --depth 1 -b master https://github.com/eamonxg/luci-theme-aurora
git clone --depth 1 -b master https://github.com/eamonxg/luci-app-aurora-config
git clone --depth 1 -b openwrt-25.12 https://github.com/Xiaokailnol/luci-theme-argon theme-argon && mv -n theme-argon/{luci-app-argon-config,luci-theme-argon} ./; rm -rf theme-argon
git clone --depth 1 -b main https://github.com/sbwml/openwrt_pkgs && mv -n openwrt_pkgs/{vlmcsd,fw_download_tool,luci-app-socat,luci-app-ramfree,luci-app-diskman,luci-app-wolplus,bash-completion,luci-app-vlmcsd,luci-app-ota,luci-app-vsftpd} ./; rm -rf openwrt_pkgs
git clone --depth 1 -b master https://github.com/sbwml/luci-app-mentohust openwrt_mentohust && mv -n openwrt_mentohust/{luci-app-mentohust,mentohust} ./; rm -rf openwrt_mentohust
git clone --depth 1 -b master https://github.com/destan19/OpenAppFilter && mv -n OpenAppFilter/{oaf,open-app-filter,luci-app-oaf} ./; rm -rf OpenAppFilter
git clone --depth 1 -b v5 https://github.com/sbwml/luci-app-mosdns openwrt-mosdns && mv -n openwrt-mosdns/{v2dat,mosdns,luci-app-mosdns} ./; rm -rf openwrt-mosdns
git clone --depth 1 -b main https://github.com/sbwml/luci-app-openlist2 openwrt-openlist2 && mv -n openwrt-openlist2/{openlist2,luci-app-openlist2} ./; rm -rf openwrt-openlist2
git clone --depth 1 -b main https://github.com/sbwml/luci-app-quickfile openwrt-quickfile && mv -n openwrt-quickfile/{quickfile,luci-app-quickfile} ./; rm -rf openwrt-quickfile
git clone --depth 1 -b main https://github.com/sirpdboy/luci-app-netwizard openwrt-netwizard && mv -n openwrt-netwizard/luci-app-netwizard ./; rm -rf openwrt-netwizard
git clone --depth 1 -b main https://github.com/Xiaokailnol/luci-app-adguardhome openwrt-adguardhome && mv -n openwrt-adguardhome/luci-app-adguardhome ./; rm -rf openwrt-adguardhome
git clone --depth 1 -b main https://github.com/timsaya/openwrt-bandix bandix-pkg && mv -n bandix-pkg/openwrt-bandix ./; rm -rf bandix-pkg
git clone --depth 1 -b main https://github.com/timsaya/luci-app-bandix bandix-luci && mv -n bandix-luci/luci-app-bandix ./; rm -rf bandix-luci
git clone --depth 1 -b main https://github.com/sbwml/luci-app-airplay2 openwrt-airplay2 && mv -n openwrt-airplay2/{airplay2,luci-app-airplay2} ./; rm -rf openwrt-airplay2
git clone --depth 1 -b openwrt-24.10 https://github.com/sbwml/luci-app-webdav
git clone --depth 1 -b main https://github.com/sbwml/luci-app-airconnect openwrt-airconnect && mv -n openwrt-airconnect/{airconnect,luci-app-airconnect} ./; rm -rf openwrt-airconnect
git clone --depth 1 -b master https://github.com/sbwml/luci-app-qbittorrent openwrt-qbittorrent && mv -n openwrt-qbittorrent/{qt6base,qt6tools,rblibtorrent,qbittorrent,luci-app-qbittorrent} ./; rm -rf openwrt-qbittorrent
git clone --depth 1 -b main https://github.com/linkease/openwrt-app-actions && mv -n openwrt-app-actions/applications/luci-app-ap-modem ./; rm -rf openwrt-app-actions
git clone --depth 1 -b main https://github.com/linkease/nas-packages-luci && mv -n nas-packages-luci/luci/{luci-app-ddnsto,luci-app-floatip,luci-app-istoreenhance,luci-app-istorex,luci-app-linkease,luci-app-quickstart,luci-app-unishare,luci-lib-iform,luci-mod-istorenext,luci-nginxer} ./; rm -rf nas-packages-luci
git clone --depth 1 -b master https://github.com/linkease/nas-packages && mv -n nas-packages/multimedia/ffmpeg-remux ./; rm -rf nas-packages
git clone --depth 1 -b master https://github.com/linkease/nas-packages && mv -n nas-packages/network/services/{ddnsto,floatip,istoreenhance,linkease,linkmount,quickstart,unishare,webdav2} ./; rm -rf nas-packages

sed -i \
-e 's?include \.\./\.\./\(lang\|devel\)?include $(TOPDIR)/feeds/packages/\1?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
-e 's/ca-certificates/ca-bundle/' \
*/Makefile

rm -rf ./*/.git ./*/.gitattributes ./*/.svn ./*/.github ./*/.gitignore create_acl_for_luci.err create_acl_for_luci.ok create_acl_for_luci.warn
exit 0
