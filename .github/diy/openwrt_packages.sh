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
git clone --depth 1 -b main https://github.com/sirpdboy/luci-app-adguardhome openwrt-adguardhome && mv -n openwrt-adguardhome/luci-app-adguardhome ./; rm -rf openwrt-adguardhome
echo -e "\nmsgid \"Base Setting\"" >> openwrt-adguardhome/luci-app-adguardhome/po/zh_Hans/AdGuardHome.po
echo -e "msgstr \"基础设置\"" >> openwrt-adguardhome/luci-app-adguardhome/po/zh_Hans/AdGuardHome.po

sed -i \
-e 's?include \.\./\.\./\(lang\|devel\)?include $(TOPDIR)/feeds/packages/\1?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
-e 's/ca-certificates/ca-bundle/' \
*/Makefile

rm -rf ./*/.git ./*/.gitattributes ./*/.svn ./*/.github ./*/.gitignore create_acl_for_luci.err create_acl_for_luci.ok create_acl_for_luci.warn
exit 0
