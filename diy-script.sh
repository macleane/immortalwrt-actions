#!/bin/bash
sudo apt update
sudo apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
  bzip2 ccache clang cmake cpio curl device-tree-compiler ecj fastjar flex gawk gettext gcc-multilib \
  g++-multilib git gnutls-dev gperf haveged help2man intltool lib32gcc-s1 libc6-dev-i386 libelf-dev \
  libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5 \
  libncursesw5-dev libpython3-dev libreadline-dev libssl-dev libtool lld llvm lrzsz mkisofs msmtp \
  nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip python3-ply \
  python-docutils python3-pyelftools qemu-utils re2c rsync scons squashfs-tools subversion swig \
  texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev jq iputils-arping
# 修改默认IP
 sed -i 's/192.168.1.1/10.10.10.9/g' package/base-files/files/bin/config_generate
make distclean
# 更改默认 Shell 为 zsh
 sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# TTYD 自动登录
 sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# 移除要替换的包
#rm -rf feeds/packages/net/mosdns
#rm -rf feeds/packages/net/msd_lite
#rm -rf feeds/packages/net/smartdns
#rm -rf feeds/luci/themes/luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-netgear
#rm -rf feeds/luci/applications/luci-app-mosdns
#rm -rf feeds/luci/applications/luci-app-netdata
#rm -rf feeds/luci/applications/luci-app-serverchan
rm -rf feeds/packages/lang/golang

#插件包
sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
git clone --depth=1 https://github.com/sirpdboy/luci-app-autotimeset.git package/luci-app-autotimeset
git clone --depth=1 https://github.com/sirpdboy/luci-app-advancedplus package/luci-app-advancedplus
git clone --depth=1 https://github.com/tty228/luci-app-wechatpush.git package/luci-app-wechatpush
#git clone --depth=1 https://github.com/sirpdboy/luci-app-lucky.git package/luci-app-lucky
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall-packages
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall.git package/passwall
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
git clone --depth=1 https://github.com/brvphoenix/wrtbwmon.git package/wrtbwmon
#git clone --depth=1 https://github.com/haiibo/luci-app-onliner.git package/luci-app-onliner
#git clone --depth=1 https://github.com/sbwml/openwrt_helloworld.git package/openwrt_helloworld
git clone --depth=1 https://github.com/sbwml/luci-app-airconnect.git package/luci-app-airconnect
#find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
#find ./ | grep Makefile | grep mosdns | xargs rm -f
#git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
#turboacc
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh


# 添加额外插件
# git clone --depth=1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
# git clone --depth=1 -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush package/luci-app-serverchan
# git clone --depth=1 https://github.com/ilxp/luci-app-ikoolproxy package/luci-app-ikoolproxy
# git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
# git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
# git clone --depth=1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata
# svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser package/luci-app-filebrowser
#svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-ssr-mudb-server package/luci-app-ssr-mudb-server
#svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-eqos package/luci-app-eqos
# svn export https://github.com/syb999/openwrt-19.07.1/trunk/package/network/services/msd_lite package/msd_lite

# 科学上网插件
# git clone --depth=1 -b main https://github.com/fw876/helloworld package/luci-app-ssr-plus
#svn export https://github.com/haiibo/packages/trunk/luci-app-vssr package/luci-app-vssr
# git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb package/lua-maxminddb
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall
#svn export https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwall
#svn export https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2
#svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash

# Themes
#git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
#git clone --depth=1 https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
#svn export https://github.com/haiibo/packages/trunk/luci-theme-atmaterial package/luci-theme-atmaterial
#svn export https://github.com/haiibo/packages/trunk/luci-theme-opentomcat package/luci-theme-opentomcat
# svn export https://github.com/haiibo/packages/trunk/luci-theme-netgear package/luci-theme-netgear
# git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom
# git clone https://github.com/apollo-ng/luci-theme-darkmatter
# git clone https://gitlab.stusta.de/stustanet/luci-theme-ssn
# git clone https://github.com/LeoHao/PPIP_LUCI_THEME
git clone --depth=1 -b js https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
#git clone --depth=1 https://github.com/sirpdboy/luci-theme-kucat.git package/luci-theme-kucat

# 更改 Argon 主题背景
#cp -f $GITHUB_WORKSPACE/images/bg1.jpg package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# 晶晨宝盒
#svn export https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
#sed -i "s|firmware_repo.*|firmware_repo 'https://github.com/haiibo/OpenWrt'|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|kernel_path.*|kernel_path 'https://github.com/ophub/kernel'|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|ARMv8|ARMv8_PLUS|g" package/luci-app-amlogic/root/etc/config/amlogic

# SmartDNS
#git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
#git clone --depth=1 https://github.com/pymumu/openwrt-smartdns package/smartdns

# msd_lite
#git clone --depth=1 https://github.com/ximiTech/luci-app-msd_lite package/luci-app-msd_lite
#git clone --depth=1 https://github.com/ximiTech/msd_lite package/msd_lite

# MosDNS
#svn export https://github.com/sbwml/luci-app-mosdns/trunk/luci-app-mosdns package/luci-app-mosdns
#svn export https://github.com/sbwml/luci-app-mosdns/trunk/mosdns package/mosdns
#git clone https://github.com/sbwml/luci-app-mosdns -b v5 luci-app-mosdns package/luci-app-mosdns
#git clone https://github.com/sbwml/v2ray-geodata v2ray-geodata package/v2ray-geodata

# DDNS.to
#svn export https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto package/luci-app-ddnsto
#svn export https://github.com/linkease/nas-packages/trunk/network/services/ddnsto package/ddnsto

# Alist
#svn export https://github.com/sbwml/luci-app-alist/trunk/luci-app-alist package/luci-app-alist
#svn export https://github.com/sbwml/luci-app-alist/trunk/alist package/alist

# iStore
#svn export https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
#svn export https://github.com/linkease/istore/trunk/luci package/luci-app-store

# 在线用户
svn export https://github.com/haiibo/packages/trunk/luci-app-onliner package/luci-app-onliner
sed -i '$i uci set nlbwmon.@nlbwmon[0].refresh_interval=2s' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci commit nlbwmon' package/lean/default-settings/files/zzz-default-settings
chmod 755 package/luci-app-onliner/root/usr/share/onliner/setnlbw.sh

# x86 型号只显示 CPU 型号
sed -i 's/${g}.*/${a}${b}${c}${d}${e}${f}${hydrid}/g' package/lean/autocore/files/x86/autocore

# 修改本地时间格式
sed -i 's/os.date()/os.date("%a %Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 修改版本为编译日期
date_version=$(date +"%y.%m.%d")
orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
sed -i "s/${orig_version}/R${date_version} by Haiibo/g" package/lean/default-settings/files/zzz-default-settings

# 修复 hostapd 报错
cp -f $GITHUB_WORKSPACE/scripts/011-fix-mbo-modules-build.patch package/network/services/hostapd/patches/011-fix-mbo-modules-build.patch

# 修改 Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/luci.mk/$(TOPDIR)\/feeds\/luci\/luci.mk/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/lang\/golang\/golang-package.mk/$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang-package.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHREPO/PKG_SOURCE_URL:=https:\/\/github.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload.github.com/g' {}

# 取消主题默认设置
#find package/luci-theme-*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;

# 调整 V2ray服务器 到 VPN 菜单
# sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*.lua
# sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/view/v2ray_server/*.htm

./scripts/feeds update -a
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
./scripts/feeds install -a
