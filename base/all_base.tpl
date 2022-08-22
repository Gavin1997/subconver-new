{% if request.target == "clash" or request.target == "clashr" %}

port: {{ default(global.clash.http_port, "7890") }}
socks-port: {{ default(global.clash.socks_port, "7891") }}
allow-lan: {{ default(global.clash.allow_lan, "true") }}
mode: Rule
log-level: {{ default(global.clash.log_level, "info") }}
external-controller: :9090
{% if default(request.clash.dns, "") == "1" %}
dns:
  enabled: true
  listen: 1053
{% endif %}
{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}
{% if request.target == "surge" %}

[General]
loglevel = notify
bypass-system = true
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1
#DNS设置或根据自己网络情况进行相应设置
bypass-tun = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
dns-server = 119.29.29.29,223.5.5.5
[Rule]
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/Advertising.list,⛔️ 广告拦截
DOMAIN-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/AdvertisingPlus.list,⛔️ 广告拦截
RULE-SET,https://raw.githubusercontent.com/Gavin1997/gavinsurge/main/Rule/guardBlock.list,⛔️ 广告拦截
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/Privacy.list,🚫 运营劫持
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/Hijacking.list,🚫 运营劫持
RULE-SET,https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/LocalAreaNetwork.list,🎯 全球直连
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Unbreak.list,🎯 全球直连
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Video/Netflix.list,🎥 NETFLIX
RULE-SET,https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Porn.list,🔞 porn
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Video/YouTube.list,🎬 YouTube
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Video/TikTok.list,🪄 TikTok
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Streaming.list,🌍 国外媒体
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/StreamingCN.list,🌏 国内媒体
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Extra/Telegram/Telegram.list,📲 电报信息
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Extra/Game/Nintendo.list,🎾 Nintendo
RULE-SET,https://raw.githubusercontent.com/Gavin1997/gavinsurge/main/Rule/game.list,🎮 游戏平台
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Global.list,🔰 节点选择
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Extra/Apple/Apple.list,🍎 苹果服务
RULE-SET,https://raw.githubusercontent.com/Gavin1997/gavinsurge/main/Rule/TV.list,🍎 AppleTv
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/China.list,🎯 全球直连
RULE-SET,https://raw.githubusercontent.com/NobyDa/Script/master/Surge/Download.list,🎯 全球直连
[Script]

{% endif %}
{% if request.target == "loon" %}

[General]
skip-proxy = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,localhost,*.local,e.crashlynatics.com
bypass-tun = 10.0.0.0/8,100.64.0.0/10,127.0.0.0/8,169.254.0.0/16,172.16.0.0/12,192.0.0.0/24,192.0.2.0/24,192.88.99.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,224.0.0.0/4,255.255.255.255/32
dns-server = system,119.29.29.29,223.5.5.5
allow-udp-proxy = false
host = 127.0.0.1

[Proxy]

[Remote Proxy]

[Proxy Group]

[Rule]

[Remote Rule]

[URL Rewrite]
enable = true
^https?:\/\/(www.)?(g|google)\.cn https://www.google.com 302

[Remote Rewrite]
https://raw.githubusercontent.com/Loon0x00/LoonExampleConfig/master/Rewrite/AutoRewrite_Example.list,auto

[MITM]
hostname = *.example.com,*.sample.com
enable = true
skip-server-cert-verify = true
#ca-p12 =
#ca-passphrase =

{% endif %}
{% if request.target == "quan" %}

[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
1.1.1.1

[REWRITE]

[URL-REJECTION]

[TCP]

[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]

{% endif %}
{% if request.target == "quanx" %}

[general]
excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
network_check_url=http://www.baidu.com/
server_check_url=http://www.gstatic.com/generate_204

[dns]
server=119.29.29.29
server=223.5.5.5
server=1.0.0.1
server=8.8.8.8

[policy]
static=♻️ 自动选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
static=🔰 节点选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
static=🌍 国外媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
static=🌏 国内媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
static=Ⓜ️ 微软服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
static=📲 电报信息, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=🍎 苹果服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🎯 全球直连, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
static=🛑 全球拦截, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
static=🐟 漏网之鱼, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

[server_remote]

[filter_remote]
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/Advertising.list, tag=🛡️ 广告拦截, force-policy=🛡️ 广告拦截, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/AdvertisingPlus.list#type=domain-set, tag=🛡️ 广告拦截, force-policy=🛡️ 广告拦截, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/Gavin1997/gavinsurge/main/Rule/guardBlock.list, tag=🛡️ 广告拦截, force-policy=🛡️ 广告拦截, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/Privacy.list, tag=🛡️ 运营劫持, force-policy=🛡️ 运营劫持, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/Hijacking.list, tag=🛡️ 运营劫持, force-policy=🛡️ 运营劫持, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/LocalAreaNetwork.list, tag=🇺🇳 全球直连, force-policy=🇺🇳 全球直连, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Unbreak.list, tag=🇺🇳 全球直连, force-policy=🇺🇳 全球直连, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Video/Netflix.list, tag=🎥 NETFLIX, force-policy=🎥 NETFLIX, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Porn.list, tag=🔞 porn, force-policy=🔞 porn, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Video/YouTube.list, tag=🎬 YouTube, force-policy=🎬 YouTube, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Video/TikTok.list, tag=🪄 TikTok, force-policy=🪄 TikTok, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Streaming.list, tag=🎞 国外媒体, force-policy=🎞 国外媒体, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/StreamingCN.list, tag=🌏 国内媒体, force-policy=🌏 国内媒体, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Extra/Telegram/Telegram.list, tag=📲 电报信息, force-policy=📲 电报信息, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Extra/Game/Nintendo.list, tag=🎾 Nintendo, force-policy=🎾 Nintendo, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/Gavin1997/gavinsurge/main/Rule/game.list, tag=🎮 游戏平台, force-policy=🎮 游戏平台, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Global.list, tag=🔰 节点选择, force-policy=🔰 节点选择, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Extra/Apple/Apple.list, tag=🍎 苹果服务, force-policy=🍎 苹果服务, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/Gavin1997/gavinsurge/main/Rule/TV.list, tag=🍎 AppleTv, force-policy=🍎 AppleTv, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/China.list, tag=🇺🇳 全球直连, force-policy=🇺🇳 全球直连, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/NobyDa/Script/master/Surge/Download.list, tag=🇺🇳 全球直连, force-policy=🇺🇳 全球直连, update-interval=86400, opt-parser=true, enabled=true
[rewrite_remote]

[server_local]

[filter_local]

[rewrite_local]

[mitm]

{% endif %}
{% if request.target == "mellow" %}

[Endpoint]
DIRECT, builtin, freedom, domainStrategy=UseIP
REJECT, builtin, blackhole
Dns-Out, builtin, dns

[Routing]
domainStrategy = IPIfNonMatch

[Dns]
hijack = Dns-Out
clientIp = 114.114.114.114

[DnsServer]
localhost
223.5.5.5
8.8.8.8, 53, Remote
8.8.4.4

[DnsRule]
DOMAIN-KEYWORD, geosite:geolocation-!cn, Remote
DOMAIN-SUFFIX, google.com, Remote

[DnsHost]
doubleclick.net = 127.0.0.1

[Log]
loglevel = warning

{% endif %}
{% if request.target == "surfboard" %}

[General]
loglevel = notify
interface = 127.0.0.1
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
ipv6 = false
dns-server = system, 223.5.5.5
exclude-simple-hostnames = true
enhanced-mode-by-rule = true
{% endif %}
{% if request.target == "sssub" %}
{
  "route": "bypass-lan-china",
  "remote_dns": "dns.google",
  "ipv6": false,
  "metered": false,
  "proxy_apps": {
    "enabled": false,
    "bypass": true,
    "android_list": [
      "com.eg.android.AlipayGphone",
      "com.wudaokou.hippo",
      "com.zhihu.android"
    ]
  },
  "udpdns": false
}

{% endif %}
