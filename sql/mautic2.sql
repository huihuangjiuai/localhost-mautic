/*
Navicat MySQL Data Transfer

Source Server         : phpstudy
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : mautic2

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-11-12 08:59:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mautic_assets
-- ----------------------------
DROP TABLE IF EXISTS `mautic_assets`;
CREATE TABLE `mautic_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `download_count` int(11) NOT NULL,
  `unique_download_count` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `disallow` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_36A1D24212469DE2` (`category_id`),
  KEY `mautic_asset_alias_search` (`alias`),
  CONSTRAINT `FK_36A1D24212469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_assets
-- ----------------------------
INSERT INTO `mautic_assets` VALUES ('1', '1', '1', '2020-11-12 00:55:47', '1', 'haorui jia', null, null, null, null, null, null, 'logo.png', '新思诺官方logo', 'logopng', 'local', '3a0eed6011a44815471c5cd413d9e5482f4e7da8.png', null, 'logo.png', 'zh_CN', '2020-11-12 01:00:00', null, '0', '0', '1', 'png', 'image/png', '3881', '0');

-- ----------------------------
-- Table structure for mautic_asset_downloads
-- ----------------------------
DROP TABLE IF EXISTS `mautic_asset_downloads`;
CREATE TABLE `mautic_asset_downloads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `email_id` int(10) unsigned DEFAULT NULL,
  `date_download` datetime NOT NULL,
  `code` int(11) NOT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_99B121615DA1941` (`asset_id`),
  KEY `IDX_99B12161A03F5E9F` (`ip_id`),
  KEY `IDX_99B1216155458D` (`lead_id`),
  KEY `IDX_99B12161A832C1C9` (`email_id`),
  KEY `mautic_download_tracking_search` (`tracking_id`),
  KEY `mautic_download_source_search` (`source`,`source_id`),
  KEY `mautic_asset_date_download` (`date_download`),
  CONSTRAINT `FK_99B1216155458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_99B121615DA1941` FOREIGN KEY (`asset_id`) REFERENCES `mautic_assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_99B12161A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`),
  CONSTRAINT `FK_99B12161A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `mautic_emails` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_asset_downloads
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `mautic_audit_log`;
CREATE TABLE `mautic_audit_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bundle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` bigint(20) unsigned NOT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `date_added` datetime NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mautic_object_search` (`object`,`object_id`),
  KEY `mautic_timeline_search` (`bundle`,`object`,`action`,`object_id`),
  KEY `mautic_date_added_index` (`date_added`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_audit_log
-- ----------------------------
INSERT INTO `mautic_audit_log` VALUES ('1', '1', 'haorui jia', 'user', 'security', '1', 'login', 'a:1:{s:8:\"username\";s:5:\"admin\";}', '2020-11-10 06:06:28', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('2', '1', 'haorui jia', 'config', 'config', '0', 'update', 'a:14:{s:6:\"locale\";s:5:\"zh_CN\";s:16:\"default_timezone\";s:13:\"Asia/Shanghai\";s:17:\"do_not_track_bots\";a:389:{i:0;s:6:\"MSNBOT\";i:1;s:12:\"msnbot-media\";i:2;s:7:\"bingbot\";i:3;s:9:\"Googlebot\";i:4;s:18:\"Google Web Preview\";i:5;s:20:\"Mediapartners-Google\";i:6;s:11:\"Baiduspider\";i:7;s:6:\"Ezooms\";i:8;s:11:\"YahooSeeker\";i:9;s:5:\"Slurp\";i:10;s:9:\"AltaVista\";i:11;s:8:\"AVSearch\";i:12;s:8:\"Mercator\";i:13;s:7:\"Scooter\";i:14;s:8:\"InfoSeek\";i:15;s:9:\"Ultraseek\";i:16;s:5:\"Lycos\";i:17;s:4:\"Wget\";i:18;s:9:\"YandexBot\";i:19;s:13:\"Java/1.4.1_04\";i:20;s:7:\"SiteBot\";i:21;s:6:\"Exabot\";i:22;s:9:\"AhrefsBot\";i:23;s:7:\"MJ12bot\";i:24;s:15:\"NetSeer crawler\";i:25;s:11:\"TurnitinBot\";i:26;s:14:\"magpie-crawler\";i:27;s:13:\"Nutch Crawler\";i:28;s:11:\"CMS Crawler\";i:29;s:8:\"rogerbot\";i:30;s:8:\"Domnutch\";i:31;s:11:\"ssearch_bot\";i:32;s:7:\"XoviBot\";i:33;s:9:\"digincore\";i:34;s:10:\"fr-crawler\";i:35;s:9:\"SeznamBot\";i:36;s:27:\"Seznam screenshot-generator\";i:37;s:7:\"Facebot\";i:38;s:19:\"facebookexternalhit\";i:39;s:9:\"SimplePie\";i:40;s:7:\"Riddler\";i:41;s:14:\"007ac9 Crawler\";i:42;s:9:\"360Spider\";i:43;s:10:\"A6-Indexer\";i:44;s:7:\"ADmantX\";i:45;s:3:\"AHC\";i:46;s:11:\"AISearchBot\";i:47;s:11:\"APIs-Google\";i:48;s:8:\"Aboundex\";i:49;s:7:\"AddThis\";i:50;s:8:\"Adidxbot\";i:51;s:13:\"AdsBot-Google\";i:52;s:13:\"AdsTxtCrawler\";i:53;s:6:\"AdvBot\";i:54;s:6:\"Ahrefs\";i:55;s:8:\"AlphaBot\";i:56;s:17:\"Amazon CloudFront\";i:57;s:13:\"AndersPinkBot\";i:58;s:17:\"Apache-HttpClient\";i:59;s:8:\"Apercite\";i:60;s:16:\"AppEngine-Google\";i:61;s:8:\"Applebot\";i:62;s:10:\"ArchiveBot\";i:63;s:6:\"BDCbot\";i:64;s:9:\"BIGLOTRON\";i:65;s:7:\"BLEXBot\";i:66;s:8:\"BLP_bbot\";i:67;s:11:\"BTWebClient\";i:68;s:6:\"BUbiNG\";i:69;s:15:\"Baidu-YunGuanCe\";i:70;s:10:\"Barkrowler\";i:71;s:10:\"BehloolBot\";i:72;s:11:\"BingPreview\";i:73;s:10:\"BomboraBot\";i:74;s:16:\"Bot.AraTurka.com\";i:75;s:9:\"BoxcarBot\";i:76;s:11:\"BrandVerity\";i:77;s:4:\"Buck\";i:78;s:18:\"CC Metadata Scaper\";i:79;s:5:\"CCBot\";i:80;s:14:\"CapsuleChecker\";i:81;s:8:\"Cliqzbot\";i:82;s:23:\"CloudFlare-AlwaysOnline\";i:83;s:19:\"Companybook-Crawler\";i:84;s:13:\"ContextAd Bot\";i:85;s:9:\"CrunchBot\";i:86;s:19:\"CrystalSemanticsBot\";i:87;s:11:\"CyberPatrol\";i:88;s:9:\"DareBoost\";i:89;s:13:\"Datafeedwatch\";i:90;s:4:\"Daum\";i:91;s:5:\"DeuSu\";i:92;s:21:\"developers.google.com\";i:93;s:7:\"Diffbot\";i:94;s:11:\"Digg Deeper\";i:95;s:13:\"Digincore bot\";i:96;s:10:\"Discordbot\";i:97;s:6:\"Disqus\";i:98;s:7:\"DnyzBot\";i:99;s:22:\"Domain Re-Animator Bot\";i:100;s:14:\"DomainStatsBot\";i:101;s:11:\"DuckDuckBot\";i:102;s:23:\"DuckDuckGo-Favicons-Bot\";i:103;s:4:\"EZID\";i:104;s:7:\"Embedly\";i:105;s:17:\"EveryoneSocialBot\";i:106;s:11:\"ExtLinksBot\";i:107;s:23:\"FAST Enterprise Crawler\";i:108;s:15:\"FAST-WebCrawler\";i:109;s:18:\"Feedfetcher-Google\";i:110;s:6:\"Feedly\";i:111;s:11:\"Feedspotbot\";i:112;s:14:\"FemtosearchBot\";i:113;s:5:\"Fetch\";i:114;s:5:\"Fever\";i:115;s:21:\"Flamingo_SearchEngine\";i:116;s:14:\"FlipboardProxy\";i:117;s:7:\"Fyrebot\";i:118;s:13:\"GarlikCrawler\";i:119;s:6:\"Genieo\";i:120;s:9:\"Gigablast\";i:121;s:7:\"Gigabot\";i:122;s:13:\"GingerCrawler\";i:123;s:19:\"Gluten Free Crawler\";i:124;s:13:\"GnowitNewsbot\";i:125;s:14:\"Go-http-client\";i:126;s:22:\"Google-Adwords-Instant\";i:127;s:9:\"Gowikibot\";i:128;s:16:\"GrapeshotCrawler\";i:129;s:7:\"Grobbot\";i:130;s:7:\"HTTrack\";i:131;s:6:\"Hatena\";i:132;s:11:\"IAS crawler\";i:133;s:11:\"ICC-Crawler\";i:134;s:9:\"IndeedBot\";i:135;s:15:\"InterfaxScanBot\";i:136;s:10:\"IstellaBot\";i:137;s:9:\"James BOT\";i:138;s:14:\"Jamie\'s Spider\";i:139;s:8:\"Jetslide\";i:140;s:5:\"Jetty\";i:141;s:28:\"Jugendschutzprogramm-Crawler\";i:142;s:9:\"K7MLWCBot\";i:143;s:8:\"Kemvibot\";i:144;s:9:\"KosmioBot\";i:145;s:19:\"Landau-Media-Spider\";i:146;s:12:\"Laserlikebot\";i:147;s:8:\"Leikibot\";i:148;s:11:\"Linguee Bot\";i:149;s:12:\"LinkArchiver\";i:150;s:11:\"LinkedInBot\";i:151;s:10:\"LivelapBot\";i:152;s:16:\"Luminator-robots\";i:153;s:11:\"Mail.RU_Bot\";i:154;s:8:\"Mastodon\";i:155;s:7:\"MauiBot\";i:156;s:15:\"Mediatoolkitbot\";i:157;s:9:\"MegaIndex\";i:158;s:13:\"MeltwaterNews\";i:159;s:10:\"MetaJobBot\";i:160;s:7:\"MetaURI\";i:161;s:8:\"Miniflux\";i:162;s:9:\"MojeekBot\";i:163;s:8:\"Moreover\";i:164;s:8:\"MuckRack\";i:165;s:12:\"Multiviewbot\";i:166;s:4:\"NING\";i:167;s:16:\"NerdByNature.Bot\";i:168;s:19:\"NetcraftSurveyAgent\";i:169;s:8:\"Netvibes\";i:170;s:16:\"Nimbostratus-Bot\";i:171;s:6:\"Nuzzel\";i:172;s:10:\"Ocarinabot\";i:173;s:11:\"OpenHoseBot\";i:174;s:9:\"OrangeBot\";i:175;s:12:\"OutclicksBot\";i:176;s:8:\"PR-CY.RU\";i:177;s:10:\"PaperLiBot\";i:178;s:10:\"Pcore-HTTP\";i:179;s:9:\"PhantomJS\";i:180;s:7:\"PiplBot\";i:181;s:12:\"PocketParser\";i:182;s:9:\"Primalbot\";i:183;s:15:\"PrivacyAwareBot\";i:184;s:10:\"Pulsepoint\";i:185;s:13:\"Python-urllib\";i:186;s:8:\"Qwantify\";i:187;s:17:\"RankActiveLinkBot\";i:188;s:19:\"RetrevoPageAnalyzer\";i:189;s:7:\"SBL-BOT\";i:190;s:10:\"SEMrushBot\";i:191;s:8:\"SEOkicks\";i:192;s:8:\"SWIMGBot\";i:193;s:10:\"SafeDNSBot\";i:194;s:28:\"SafeSearch microdata crawler\";i:195;s:8:\"ScoutJet\";i:196;s:6:\"Scrapy\";i:197;s:25:\"Screaming Frog SEO Spider\";i:198;s:18:\"SemanticScholarBot\";i:199;s:13:\"SimpleCrawler\";i:200;s:15:\"Siteimprove.com\";i:201;s:15:\"SkypeUriPreview\";i:202;s:14:\"Slack-ImgProxy\";i:203;s:8:\"Slackbot\";i:204;s:9:\"Snacktory\";i:205;s:15:\"SocialRankIOBot\";i:206;s:5:\"Sogou\";i:207;s:5:\"Sonic\";i:208;s:12:\"StorygizeBot\";i:209;s:9:\"SurveyBot\";i:210;s:7:\"Sysomos\";i:211;s:12:\"TangibleeBot\";i:212;s:11:\"TelegramBot\";i:213;s:5:\"Teoma\";i:214;s:8:\"Thinklab\";i:215;s:6:\"TinEye\";i:216;s:13:\"ToutiaoSpider\";i:217;s:11:\"Traackr.com\";i:218;s:5:\"Trove\";i:219;s:12:\"TweetmemeBot\";i:220;s:10:\"Twitterbot\";i:221;s:6:\"Twurly\";i:222;s:6:\"Upflow\";i:223;s:11:\"UptimeRobot\";i:224;s:20:\"UsineNouvelleCrawler\";i:225;s:8:\"Veoozbot\";i:226;s:12:\"WeSEE:Search\";i:227;s:8:\"WhatsApp\";i:228;s:16:\"Xenu Link Sleuth\";i:229;s:3:\"Y!J\";i:230;s:3:\"YaK\";i:231;s:18:\"Yahoo Link Preview\";i:232;s:4:\"Yeti\";i:233;s:11:\"YisouSpider\";i:234;s:6:\"Zabbix\";i:235;s:11:\"ZoominfoBot\";i:236;s:6:\"ZumBot\";i:237;s:12:\"ZuperlistBot\";i:238;s:4:\"^LCC\";i:239;s:7:\"acapbot\";i:240;s:8:\"acoonbot\";i:241;s:10:\"adbeat_bot\";i:242;s:9:\"adscanner\";i:243;s:8:\"aiHitBot\";i:244;s:7:\"antibot\";i:245;s:6:\"arabot\";i:246;s:15:\"archive.org_bot\";i:247;s:5:\"axios\";i:248;s:15:\"backlinkcrawler\";i:249;s:7:\"betaBot\";i:250;s:10:\"bibnum.bnf\";i:251;s:6:\"binlar\";i:252;s:8:\"bitlybot\";i:253;s:9:\"blekkobot\";i:254;s:11:\"blogmuraBot\";i:255;s:10:\"bnf.fr_bot\";i:256;s:18:\"bot-pge.chlooe.com\";i:257;s:6:\"botify\";i:258;s:9:\"brainobot\";i:259;s:7:\"buzzbot\";i:260;s:9:\"cXensebot\";i:261;s:9:\"careerbot\";i:262;s:11:\"centurybot9\";i:263;s:15:\"changedetection\";i:264;s:10:\"check_http\";i:265;s:12:\"citeseerxbot\";i:266;s:6:\"coccoc\";i:267;s:21:\"collection@infegy.com\";i:268;s:22:\"content crawler spider\";i:269;s:8:\"contxbot\";i:270;s:7:\"convera\";i:271;s:9:\"crawler4j\";i:272;s:4:\"curl\";i:273;s:12:\"datagnionbot\";i:274;s:6:\"dcrawl\";i:275;s:15:\"deadlinkchecker\";i:276;s:8:\"discobot\";i:277;s:13:\"domaincrawler\";i:278;s:6:\"dotbot\";i:279;s:7:\"drupact\";i:280;s:13:\"ec2linkfinder\";i:281;s:10:\"edisterbot\";i:282;s:12:\"electricmonk\";i:283;s:8:\"elisabot\";i:284;s:7:\"epicbot\";i:285;s:6:\"eright\";i:286;s:16:\"europarchive.org\";i:287;s:6:\"exabot\";i:288;s:6:\"ezooms\";i:289;s:16:\"filterdb.iss.net\";i:290;s:8:\"findlink\";i:291;s:12:\"findthatfile\";i:292;s:8:\"findxbot\";i:293;s:6:\"fluffy\";i:294;s:7:\"fuelbot\";i:295;s:10:\"g00g1e.net\";i:296;s:12:\"g2reader-bot\";i:297;s:16:\"gnam gnam spider\";i:298;s:14:\"google-xrawler\";i:299;s:8:\"grub.org\";i:300;s:7:\"gslfbot\";i:301;s:8:\"heritrix\";i:302;s:8:\"http_get\";i:303;s:8:\"httpunit\";i:304;s:11:\"ia_archiver\";i:305;s:6:\"ichiro\";i:306;s:6:\"imrbot\";i:307;s:11:\"integromedb\";i:308;s:12:\"intelium_bot\";i:309;s:18:\"ip-web-crawler.com\";i:310;s:9:\"ips-agent\";i:311;s:7:\"iskanie\";i:312;s:23:\"it2media-domain-crawler\";i:313;s:7:\"jyxobot\";i:314;s:9:\"lb-spider\";i:315;s:6:\"libwww\";i:316;s:13:\"linkapediabot\";i:317;s:7:\"linkdex\";i:318;s:9:\"lipperhey\";i:319;s:6:\"lssbot\";i:320;s:16:\"lssrocketcrawler\";i:321;s:5:\"ltx71\";i:322;s:9:\"mappydata\";i:323;s:9:\"memorybot\";i:324;s:9:\"mindUpBot\";i:325;s:5:\"mlbot\";i:326;s:7:\"moatbot\";i:327;s:6:\"msnbot\";i:328;s:6:\"msrbot\";i:329;s:8:\"nerdybot\";i:330;s:20:\"netEstate NE Crawler\";i:331;s:17:\"netresearchserver\";i:332;s:14:\"newsharecounts\";i:333;s:9:\"newspaper\";i:334;s:8:\"niki-bot\";i:335;s:5:\"nutch\";i:336;s:6:\"okhttp\";i:337;s:6:\"omgili\";i:338;s:15:\"openindexspider\";i:339;s:8:\"page2rss\";i:340;s:9:\"panscient\";i:341;s:8:\"phpcrawl\";i:342;s:7:\"pingdom\";i:343;s:9:\"pinterest\";i:344;s:8:\"postrank\";i:345;s:8:\"proximic\";i:346;s:5:\"psbot\";i:347;s:7:\"purebot\";i:348;s:15:\"python-requests\";i:349;s:9:\"redditbot\";i:350;s:9:\"scribdbot\";i:351;s:7:\"seekbot\";i:352;s:11:\"semanticbot\";i:353;s:6:\"sentry\";i:354;s:11:\"seoscanners\";i:355;s:9:\"seznambot\";i:356;s:15:\"sistrix crawler\";i:357;s:7:\"sitebot\";i:358;s:17:\"siteexplorer.info\";i:359;s:6:\"smtbot\";i:360;s:5:\"spbot\";i:361;s:6:\"speedy\";i:362;s:7:\"summify\";i:363;s:8:\"tagoobot\";i:364;s:10:\"toplistbot\";i:365;s:11:\"tracemyfile\";i:366;s:14:\"trendictionbot\";i:367;s:11:\"turnitinbot\";i:368;s:9:\"twengabot\";i:369;s:5:\"um-LN\";i:370;s:12:\"urlappendbot\";i:371;s:10:\"vebidoobot\";i:372;s:7:\"vkShare\";i:373;s:8:\"voilabot\";i:374;s:11:\"wbsearchbot\";i:375;s:23:\"web-archive-net.com.bot\";i:376;s:17:\"webcompanycrawler\";i:377;s:6:\"webmon\";i:378;s:4:\"wget\";i:379;s:6:\"wocbot\";i:380;s:6:\"woobot\";i:381;s:8:\"woriobot\";i:382;s:6:\"wotbox\";i:383;s:7:\"xovibot\";i:384;s:7:\"yacybot\";i:385;s:10:\"yandex.com\";i:386;s:5:\"yanga\";i:387;s:7:\"yoozBot\";i:388;s:5:\"zgrab\";}s:32:\"api_oauth2_access_token_lifetime\";d:60;s:33:\"api_oauth2_refresh_token_lifetime\";d:14;s:16:\"unsubscribe_text\";s:68:\"<a href=\"|URL|\">Unsubscribe</a> to no longer receive emails from us.\";s:12:\"webview_text\";s:66:\"<a href=\"|URL|\">Having trouble reading this email? Click here.</a>\";s:19:\"unsubscribe_message\";s:146:\"We are sorry to see you go! |EMAIL| will no longer receive emails from us. If this was by mistake, <a href=\"|URL|\">click here to re-subscribe</a>.\";s:19:\"resubscribe_message\";s:102:\"|EMAIL| has been re-subscribed. If this was by mistake, <a href=\"|URL|\">click here to unsubscribe</a>.\";s:22:\"default_signature_text\";s:25:\"Best regards, |FROM_NAME|\";s:13:\"sms_transport\";N;s:24:\"saml_idp_email_attribute\";s:12:\"EmailAddress\";s:28:\"saml_idp_firstname_attribute\";s:9:\"FirstName\";s:27:\"saml_idp_lastname_attribute\";s:8:\"LastName\";}', '2020-11-10 06:07:54', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('3', '1', 'haorui jia', 'user', 'user', '1', 'update', 'a:4:{s:8:\"timezone\";a:2:{i:0;s:0:\"\";i:1;s:13:\"Asia/Shanghai\";}s:6:\"locale\";a:2:{i:0;s:0:\"\";i:1;s:5:\"zh_CN\";}s:9:\"signature\";a:2:{i:0;N;i:1;s:25:\"Best regards, |FROM_NAME|\";}s:12:\"dateModified\";a:2:{i:0;N;i:1;s:25:\"2020-11-10T06:12:03+00:00\";}}', '2020-11-10 06:12:03', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('4', '1', 'haorui jia', 'user', 'security', '1', 'login', 'a:1:{s:8:\"username\";s:5:\"admin\";}', '2020-11-10 06:12:18', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('5', '0', '系统', 'lead', 'lead', '1', 'create', 'a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}', '2020-11-10 06:15:33', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('6', '0', '系统', 'lead', 'lead', '1', 'ipadded', 'a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}', '2020-11-10 06:15:33', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('7', '0', '系统', 'lead', 'lead', '1', 'update', 'a:1:{s:8:\"timezone\";a:2:{i:0;N;i:1;s:13:\"Asia/Shanghai\";}}', '2020-11-10 06:15:34', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('8', '1', 'haorui jia', 'config', 'config', '0', 'update', 'a:5:{s:21:\"cors_restrict_domains\";i:0;s:19:\"track_contact_by_ip\";i:1;s:21:\"track_by_tracking_url\";i:1;s:35:\"facebook_pixel_trackingpage_enabled\";i:1;s:34:\"facebook_pixel_landingpage_enabled\";i:1;}', '2020-11-10 06:15:54', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('9', '0', '系统', 'lead', 'lead', '2', 'create', 'a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}', '2020-11-10 06:15:56', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('10', '0', '系统', 'lead', 'lead', '2', 'ipadded', 'a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}', '2020-11-10 06:15:56', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('11', '0', '系统', 'lead', 'lead', '2', 'update', 'a:1:{s:8:\"timezone\";a:2:{i:0;N;i:1;s:13:\"Asia/Shanghai\";}}', '2020-11-10 06:15:58', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('12', '1', 'haorui jia', 'user', 'security', '1', 'login', 'a:1:{s:8:\"username\";s:5:\"admin\";}', '2020-11-10 06:48:41', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('13', '1', 'haorui jia', 'user', 'security', '1', 'login', 'a:1:{s:8:\"username\";s:5:\"admin\";}', '2020-11-10 07:01:47', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('14', '1', 'haorui jia', 'config', 'config', '0', 'update', 'a:1:{s:14:\"ip_lookup_auth\";s:16:\"8nxg3sJMGAIvKoeg\";}', '2020-11-10 07:03:52', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('15', '1', 'haorui jia', 'report', 'report', '1', 'update', 'a:11:{s:7:\"columns\";a:2:{i:0;a:0:{}i:1;a:7:{i:0;s:11:\"ph.date_hit\";i:1;s:6:\"ph.url\";i:2;s:12:\"ph.url_title\";i:3;s:10:\"ph.referer\";i:4;s:12:\"i.ip_address\";i:5;s:7:\"ph.city\";i:6;s:10:\"ph.country\";}}s:6:\"graphs\";a:2:{i:0;a:8:{i:0;s:35:\"mautic.page.graph.line.time.on.site\";i:1;s:27:\"mautic.page.graph.line.hits\";i:2;s:38:\"mautic.page.graph.pie.new.vs.returning\";i:3;s:31:\"mautic.page.graph.pie.languages\";i:4;s:34:\"mautic.page.graph.pie.time.on.site\";i:5;s:27:\"mautic.page.table.referrers\";i:6;s:30:\"mautic.page.table.most.visited\";i:7;s:37:\"mautic.page.table.most.visited.unique\";}i:1;a:0:{}}s:6:\"system\";a:2:{i:0;b:1;i:1;i:1;}s:8:\"settings\";a:2:{i:0;a:0:{}i:1;a:3:{s:20:\"showGraphsAboveTable\";i:1;s:18:\"showDynamicFilters\";i:0;s:19:\"hideDateRangeFilter\";i:0;}}s:11:\"isScheduled\";a:2:{i:0;i:0;i:1;b:0;}s:12:\"scheduleUnit\";a:2:{i:0;s:5:\"DAILY\";i:1;N;}s:11:\"scheduleDay\";a:2:{i:0;s:2:\"MO\";i:1;N;}s:7:\"groupBy\";a:2:{i:0;a:0:{}i:1;a:15:{i:0;s:5:\"vp.id\";i:1;s:14:\"p.variant_hits\";i:2;s:8:\"vp.title\";i:3;s:20:\"p.variant_start_date\";i:4;s:4:\"c.id\";i:5;s:7:\"c.title\";i:6;s:10:\"l.address1\";i:7;s:10:\"l.address2\";i:8;s:13:\"l.attribution\";i:9;s:18:\"l.attribution_date\";i:10;s:6:\"l.city\";i:11;s:9:\"l.country\";i:12;s:13:\"l.last_active\";i:13;s:7:\"l.email\";i:14;s:10:\"l.facebook\";}}s:7:\"filters\";a:2:{i:0;a:2:{i:0;a:3:{s:6:\"column\";s:7:\"ph.code\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:3:\"200\";}i:1;a:3:{s:6:\"column\";s:14:\"p.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}i:1;a:2:{i:0;a:5:{s:6:\"column\";s:7:\"ph.code\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:3:\"200\";s:4:\"glue\";s:3:\"and\";s:7:\"dynamic\";N;}i:1;a:5:{s:6:\"column\";s:14:\"p.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";s:4:\"glue\";s:3:\"and\";s:7:\"dynamic\";N;}}}s:11:\"aggregators\";a:2:{i:0;a:0:{}i:1;a:1:{i:2;a:2:{s:8:\"function\";s:5:\"COUNT\";s:6:\"column\";s:14:\"p.variant_hits\";}}}s:12:\"dateModified\";a:2:{i:0;N;i:1;s:25:\"2020-11-11T09:49:35+08:00\";}}', '2020-11-11 01:49:35', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('16', '1', 'haorui jia', 'report', 'report', '1', 'update', 'a:7:{s:7:\"columns\";a:2:{i:0;a:0:{}i:1;a:7:{i:0;s:11:\"ph.date_hit\";i:1;s:6:\"ph.url\";i:2;s:12:\"ph.url_title\";i:3;s:10:\"ph.referer\";i:4;s:12:\"i.ip_address\";i:5;s:7:\"ph.city\";i:6;s:10:\"ph.country\";}}s:6:\"system\";a:2:{i:0;b:1;i:1;i:1;}s:11:\"isScheduled\";a:2:{i:0;i:0;i:1;b:0;}s:12:\"scheduleUnit\";a:2:{i:0;s:5:\"DAILY\";i:1;N;}s:11:\"scheduleDay\";a:2:{i:0;s:2:\"MO\";i:1;N;}s:6:\"graphs\";a:2:{i:0;a:0:{}i:1;a:9:{i:0;s:29:\"mautic.page.graph.pie.devices\";i:1;s:35:\"mautic.page.graph.line.time.on.site\";i:2;s:37:\"mautic.page.table.most.visited.unique\";i:3;s:30:\"mautic.page.table.most.visited\";i:4;s:38:\"mautic.page.graph.pie.new.vs.returning\";i:5;s:27:\"mautic.page.graph.line.hits\";i:6;s:31:\"mautic.page.graph.pie.languages\";i:7;s:34:\"mautic.page.graph.pie.time.on.site\";i:8;s:27:\"mautic.page.table.referrers\";}}s:12:\"dateModified\";a:2:{i:0;s:25:\"2020-11-11T09:49:35+08:00\";i:1;s:25:\"2020-11-11T09:50:05+08:00\";}}', '2020-11-11 01:50:05', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('17', '1', 'haorui jia', 'report', 'report', '1', 'update', 'a:8:{s:7:\"columns\";a:2:{i:0;a:0:{}i:1;a:24:{i:0;s:11:\"ph.date_hit\";i:1;s:6:\"ph.url\";i:2;s:12:\"ph.url_title\";i:3;s:10:\"ph.referer\";i:4;s:12:\"i.ip_address\";i:5;s:7:\"ph.city\";i:6;s:10:\"ph.country\";i:7;s:14:\"p.variant_hits\";i:8;s:5:\"vp.id\";i:9;s:8:\"vp.title\";i:10;s:20:\"p.variant_start_date\";i:11;s:4:\"c.id\";i:12;s:7:\"c.title\";i:13;s:10:\"l.address1\";i:14;s:10:\"l.address2\";i:15;s:13:\"l.attribution\";i:16;s:18:\"l.attribution_date\";i:17;s:6:\"l.city\";i:18;s:9:\"l.country\";i:19;s:13:\"l.last_active\";i:20;s:7:\"l.email\";i:21;s:10:\"l.facebook\";i:22;s:5:\"l.fax\";i:23;s:11:\"l.firstname\";}}s:6:\"graphs\";a:2:{i:0;a:0:{}i:1;a:9:{i:0;s:29:\"mautic.page.graph.pie.devices\";i:1;s:35:\"mautic.page.graph.line.time.on.site\";i:2;s:37:\"mautic.page.table.most.visited.unique\";i:3;s:30:\"mautic.page.table.most.visited\";i:4;s:38:\"mautic.page.graph.pie.new.vs.returning\";i:5;s:27:\"mautic.page.graph.line.hits\";i:6;s:31:\"mautic.page.graph.pie.languages\";i:7;s:34:\"mautic.page.graph.pie.time.on.site\";i:8;s:27:\"mautic.page.table.referrers\";}}s:6:\"system\";a:2:{i:0;b:1;i:1;i:1;}s:11:\"isScheduled\";a:2:{i:0;i:0;i:1;b:0;}s:12:\"scheduleUnit\";a:2:{i:0;s:5:\"DAILY\";i:1;N;}s:11:\"scheduleDay\";a:2:{i:0;s:2:\"MO\";i:1;N;}s:7:\"groupBy\";a:2:{i:0;a:15:{i:0;s:5:\"vp.id\";i:1;s:14:\"p.variant_hits\";i:2;s:8:\"vp.title\";i:3;s:20:\"p.variant_start_date\";i:4;s:4:\"c.id\";i:5;s:7:\"c.title\";i:6;s:10:\"l.address1\";i:7;s:10:\"l.address2\";i:8;s:13:\"l.attribution\";i:9;s:18:\"l.attribution_date\";i:10;s:6:\"l.city\";i:11;s:9:\"l.country\";i:12;s:13:\"l.last_active\";i:13;s:7:\"l.email\";i:14;s:10:\"l.facebook\";}i:1;a:44:{i:0;s:5:\"vp.id\";i:1;s:14:\"p.variant_hits\";i:2;s:8:\"vp.title\";i:3;s:20:\"p.variant_start_date\";i:4;s:4:\"c.id\";i:5;s:7:\"c.title\";i:6;s:10:\"l.address1\";i:7;s:10:\"l.address2\";i:8;s:13:\"l.attribution\";i:9;s:18:\"l.attribution_date\";i:10;s:6:\"l.city\";i:11;s:9:\"l.country\";i:12;s:13:\"l.last_active\";i:13;s:7:\"l.email\";i:14;s:10:\"l.facebook\";i:15;s:5:\"l.fax\";i:16;s:11:\"l.firstname\";i:17;s:12:\"l.foursquare\";i:18;s:4:\"l.id\";i:19;s:11:\"l.instagram\";i:20;s:10:\"l.lastname\";i:21;s:10:\"l.linkedin\";i:22;s:8:\"l.mobile\";i:23;s:7:\"l.phone\";i:24;s:8:\"l.points\";i:25;s:10:\"l.position\";i:26;s:18:\"l.preferred_locale\";i:27;s:10:\"l.timezone\";i:28;s:9:\"l.company\";i:29;s:7:\"l.skype\";i:30;s:7:\"l.state\";i:31;s:7:\"l.title\";i:32;s:9:\"l.twitter\";i:33;s:9:\"l.website\";i:34;s:9:\"l.zipcode\";i:35;s:25:\"companies_lead.date_added\";i:36;s:12:\"p.date_added\";i:37;s:11:\"ph.date_hit\";i:38;s:15:\"p.date_modified\";i:39;s:12:\"ph.date_left\";i:40;s:6:\"ph.isp\";i:41;s:6:\"ph.url\";i:42;s:20:\"ph.browser_languages\";i:43;s:7:\"ph.city\";}}s:12:\"dateModified\";a:2:{i:0;s:25:\"2020-11-11T09:50:05+08:00\";i:1;s:25:\"2020-11-11T09:50:40+08:00\";}}', '2020-11-11 01:50:40', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('18', '1', 'haorui jia', 'report', 'report', '1', 'update', 'a:8:{s:7:\"columns\";a:2:{i:0;a:0:{}i:1;a:91:{i:0;s:11:\"ph.date_hit\";i:1;s:6:\"ph.url\";i:2;s:12:\"ph.url_title\";i:3;s:10:\"ph.referer\";i:4;s:12:\"i.ip_address\";i:5;s:7:\"ph.city\";i:6;s:10:\"ph.country\";i:7;s:14:\"p.variant_hits\";i:8;s:5:\"vp.id\";i:9;s:8:\"vp.title\";i:10;s:20:\"p.variant_start_date\";i:11;s:4:\"c.id\";i:12;s:7:\"c.title\";i:13;s:10:\"l.address1\";i:14;s:10:\"l.address2\";i:15;s:13:\"l.attribution\";i:16;s:18:\"l.attribution_date\";i:17;s:6:\"l.city\";i:18;s:9:\"l.country\";i:19;s:13:\"l.last_active\";i:20;s:7:\"l.email\";i:21;s:10:\"l.facebook\";i:22;s:5:\"l.fax\";i:23;s:11:\"l.firstname\";i:24;s:4:\"l.id\";i:25;s:11:\"l.instagram\";i:26;s:7:\"l.phone\";i:27;s:18:\"l.preferred_locale\";i:28;s:10:\"l.timezone\";i:29;s:9:\"l.company\";i:30;s:8:\"l.mobile\";i:31;s:8:\"l.points\";i:32;s:7:\"l.skype\";i:33;s:9:\"l.twitter\";i:34;s:9:\"l.website\";i:35;s:14:\"p.publish_down\";i:36;s:5:\"ph.id\";i:37;s:9:\"ph.source\";i:38;s:5:\"r.url\";i:39;s:10:\"p.revision\";i:40;s:19:\"comp.companywebsite\";i:41;s:19:\"comp.companyzipcode\";i:42;s:7:\"comp.id\";i:43;s:17:\"comp.companystate\";i:44;s:17:\"p.created_by_user\";i:45;s:7:\"p.alias\";i:46;s:17:\"comp.companyphone\";i:47;s:8:\"cmp.name\";i:48;s:31:\"comp.companynumber_of_employees\";i:49;s:9:\"ds.device\";i:50;s:15:\"ds.device_brand\";i:51;s:17:\"ds.device_os_name\";i:52;s:21:\"ds.device_os_platform\";i:53;s:20:\"ds.device_os_version\";i:54;s:15:\"ds.device_model\";i:55;s:22:\"ds.device_os_shortname\";i:56;s:20:\"comp.companyindustry\";i:57;s:15:\"comp.companyfax\";i:58;s:19:\"comp.companycountry\";i:59;s:16:\"comp.companyname\";i:60;s:16:\"comp.companycity\";i:61;s:26:\"comp.companyannual_revenue\";i:62;s:20:\"comp.companyaddress1\";i:63;s:20:\"comp.companyaddress2\";i:64;s:17:\"comp.companyemail\";i:65;s:23:\"comp.companydescription\";i:66;s:13:\"p.unique_hits\";i:67;s:8:\"tp.title\";i:68;s:16:\"clel.campaign_id\";i:69;s:12:\"ph.source_id\";i:70;s:18:\"p.modified_by_user\";i:71;s:25:\"companies_lead.is_primary\";i:72;s:6:\"r.hits\";i:73;s:13:\"r.unique_hits\";i:74;s:7:\"p.title\";i:75;s:6:\"p.lang\";i:76;s:5:\"tp.id\";i:77;s:12:\"p.publish_up\";i:78;s:14:\"p.is_published\";i:79;s:4:\"p.id\";i:80;s:13:\"ph.user_agent\";i:81;s:14:\"ph.remote_host\";i:82;s:9:\"ph.region\";i:83;s:15:\"ph.organization\";i:84;s:6:\"p.hits\";i:85;s:7:\"ph.code\";i:86;s:20:\"ph.browser_languages\";i:87;s:15:\"p.date_modified\";i:88;s:12:\"p.date_added\";i:89;s:7:\"l.state\";i:90;s:12:\"ph.date_left\";}}s:6:\"graphs\";a:2:{i:0;a:0:{}i:1;a:9:{i:0;s:29:\"mautic.page.graph.pie.devices\";i:1;s:35:\"mautic.page.graph.line.time.on.site\";i:2;s:37:\"mautic.page.table.most.visited.unique\";i:3;s:30:\"mautic.page.table.most.visited\";i:4;s:38:\"mautic.page.graph.pie.new.vs.returning\";i:5;s:27:\"mautic.page.graph.line.hits\";i:6;s:31:\"mautic.page.graph.pie.languages\";i:7;s:34:\"mautic.page.graph.pie.time.on.site\";i:8;s:27:\"mautic.page.table.referrers\";}}s:6:\"system\";a:2:{i:0;b:1;i:1;i:1;}s:11:\"isScheduled\";a:2:{i:0;i:0;i:1;b:0;}s:12:\"scheduleUnit\";a:2:{i:0;s:5:\"DAILY\";i:1;N;}s:11:\"scheduleDay\";a:2:{i:0;s:2:\"MO\";i:1;N;}s:11:\"aggregators\";a:2:{i:0;a:1:{i:2;a:2:{s:8:\"function\";s:5:\"COUNT\";s:6:\"column\";s:14:\"p.variant_hits\";}}i:1;a:2:{i:2;a:2:{s:8:\"function\";s:5:\"COUNT\";s:6:\"column\";s:14:\"p.variant_hits\";}i:3;a:2:{s:8:\"function\";s:5:\"COUNT\";s:6:\"column\";s:7:\"c.title\";}}}s:12:\"dateModified\";a:2:{i:0;s:25:\"2020-11-11T09:50:40+08:00\";i:1;s:25:\"2020-11-11T09:55:20+08:00\";}}', '2020-11-11 01:55:20', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('19', '1', 'haorui jia', 'report', 'report', '1', 'update', 'a:8:{s:7:\"columns\";a:2:{i:0;a:0:{}i:1;a:99:{i:0;s:11:\"ph.date_hit\";i:1;s:6:\"ph.url\";i:2;s:12:\"ph.url_title\";i:3;s:10:\"ph.referer\";i:4;s:12:\"i.ip_address\";i:5;s:7:\"ph.city\";i:6;s:10:\"ph.country\";i:7;s:14:\"p.variant_hits\";i:8;s:5:\"vp.id\";i:9;s:8:\"vp.title\";i:10;s:20:\"p.variant_start_date\";i:11;s:4:\"c.id\";i:12;s:7:\"c.title\";i:13;s:10:\"l.address1\";i:14;s:10:\"l.address2\";i:15;s:13:\"l.attribution\";i:16;s:18:\"l.attribution_date\";i:17;s:6:\"l.city\";i:18;s:9:\"l.country\";i:19;s:13:\"l.last_active\";i:20;s:7:\"l.email\";i:21;s:10:\"l.facebook\";i:22;s:5:\"l.fax\";i:23;s:11:\"l.firstname\";i:24;s:4:\"l.id\";i:25;s:11:\"l.instagram\";i:26;s:7:\"l.phone\";i:27;s:18:\"l.preferred_locale\";i:28;s:10:\"l.timezone\";i:29;s:9:\"l.company\";i:30;s:8:\"l.mobile\";i:31;s:8:\"l.points\";i:32;s:7:\"l.skype\";i:33;s:9:\"l.twitter\";i:34;s:9:\"l.website\";i:35;s:14:\"p.publish_down\";i:36;s:5:\"ph.id\";i:37;s:9:\"ph.source\";i:38;s:5:\"r.url\";i:39;s:10:\"p.revision\";i:40;s:19:\"comp.companywebsite\";i:41;s:19:\"comp.companyzipcode\";i:42;s:7:\"comp.id\";i:43;s:17:\"comp.companystate\";i:44;s:17:\"p.created_by_user\";i:45;s:7:\"p.alias\";i:46;s:17:\"comp.companyphone\";i:47;s:8:\"cmp.name\";i:48;s:31:\"comp.companynumber_of_employees\";i:49;s:9:\"ds.device\";i:50;s:15:\"ds.device_brand\";i:51;s:17:\"ds.device_os_name\";i:52;s:21:\"ds.device_os_platform\";i:53;s:20:\"ds.device_os_version\";i:54;s:15:\"ds.device_model\";i:55;s:22:\"ds.device_os_shortname\";i:56;s:20:\"comp.companyindustry\";i:57;s:15:\"comp.companyfax\";i:58;s:19:\"comp.companycountry\";i:59;s:16:\"comp.companyname\";i:60;s:16:\"comp.companycity\";i:61;s:26:\"comp.companyannual_revenue\";i:62;s:20:\"comp.companyaddress1\";i:63;s:20:\"comp.companyaddress2\";i:64;s:17:\"comp.companyemail\";i:65;s:23:\"comp.companydescription\";i:66;s:13:\"p.unique_hits\";i:67;s:8:\"tp.title\";i:68;s:16:\"clel.campaign_id\";i:69;s:12:\"ph.source_id\";i:70;s:18:\"p.modified_by_user\";i:71;s:25:\"companies_lead.is_primary\";i:72;s:6:\"r.hits\";i:73;s:13:\"r.unique_hits\";i:74;s:7:\"p.title\";i:75;s:6:\"p.lang\";i:76;s:5:\"tp.id\";i:77;s:12:\"p.publish_up\";i:78;s:14:\"p.is_published\";i:79;s:4:\"p.id\";i:80;s:13:\"ph.user_agent\";i:81;s:14:\"ph.remote_host\";i:82;s:9:\"ph.region\";i:83;s:15:\"ph.organization\";i:84;s:6:\"p.hits\";i:85;s:7:\"ph.code\";i:86;s:20:\"ph.browser_languages\";i:87;s:15:\"p.date_modified\";i:88;s:12:\"p.date_added\";i:89;s:7:\"l.state\";i:90;s:12:\"ph.date_left\";i:91;s:7:\"l.title\";i:92;s:9:\"l.zipcode\";i:93;s:25:\"companies_lead.date_added\";i:94;s:6:\"ph.isp\";i:95;s:10:\"l.linkedin\";i:96;s:10:\"l.position\";i:97;s:10:\"l.lastname\";i:98;s:12:\"l.foursquare\";}}s:6:\"graphs\";a:2:{i:0;a:0:{}i:1;a:9:{i:0;s:29:\"mautic.page.graph.pie.devices\";i:1;s:35:\"mautic.page.graph.line.time.on.site\";i:2;s:37:\"mautic.page.table.most.visited.unique\";i:3;s:30:\"mautic.page.table.most.visited\";i:4;s:38:\"mautic.page.graph.pie.new.vs.returning\";i:5;s:27:\"mautic.page.graph.line.hits\";i:6;s:31:\"mautic.page.graph.pie.languages\";i:7;s:34:\"mautic.page.graph.pie.time.on.site\";i:8;s:27:\"mautic.page.table.referrers\";}}s:6:\"system\";a:2:{i:0;b:1;i:1;i:1;}s:11:\"isScheduled\";a:2:{i:0;i:0;i:1;b:0;}s:12:\"scheduleUnit\";a:2:{i:0;s:5:\"DAILY\";i:1;N;}s:11:\"scheduleDay\";a:2:{i:0;s:2:\"MO\";i:1;N;}s:7:\"groupBy\";a:2:{i:0;a:44:{i:0;s:5:\"vp.id\";i:1;s:14:\"p.variant_hits\";i:2;s:8:\"vp.title\";i:3;s:20:\"p.variant_start_date\";i:4;s:4:\"c.id\";i:5;s:7:\"c.title\";i:6;s:10:\"l.address1\";i:7;s:10:\"l.address2\";i:8;s:13:\"l.attribution\";i:9;s:18:\"l.attribution_date\";i:10;s:6:\"l.city\";i:11;s:9:\"l.country\";i:12;s:13:\"l.last_active\";i:13;s:7:\"l.email\";i:14;s:10:\"l.facebook\";i:15;s:5:\"l.fax\";i:16;s:11:\"l.firstname\";i:17;s:12:\"l.foursquare\";i:18;s:4:\"l.id\";i:19;s:11:\"l.instagram\";i:20;s:10:\"l.lastname\";i:21;s:10:\"l.linkedin\";i:22;s:8:\"l.mobile\";i:23;s:7:\"l.phone\";i:24;s:8:\"l.points\";i:25;s:10:\"l.position\";i:26;s:18:\"l.preferred_locale\";i:27;s:10:\"l.timezone\";i:28;s:9:\"l.company\";i:29;s:7:\"l.skype\";i:30;s:7:\"l.state\";i:31;s:7:\"l.title\";i:32;s:9:\"l.twitter\";i:33;s:9:\"l.website\";i:34;s:9:\"l.zipcode\";i:35;s:25:\"companies_lead.date_added\";i:36;s:12:\"p.date_added\";i:37;s:11:\"ph.date_hit\";i:38;s:15:\"p.date_modified\";i:39;s:12:\"ph.date_left\";i:40;s:6:\"ph.isp\";i:41;s:6:\"ph.url\";i:42;s:20:\"ph.browser_languages\";i:43;s:7:\"ph.city\";}i:1;a:61:{i:0;s:5:\"vp.id\";i:1;s:14:\"p.variant_hits\";i:2;s:8:\"vp.title\";i:3;s:20:\"p.variant_start_date\";i:4;s:4:\"c.id\";i:5;s:7:\"c.title\";i:6;s:10:\"l.address1\";i:7;s:10:\"l.address2\";i:8;s:13:\"l.attribution\";i:9;s:18:\"l.attribution_date\";i:10;s:6:\"l.city\";i:11;s:9:\"l.country\";i:12;s:13:\"l.last_active\";i:13;s:7:\"l.email\";i:14;s:10:\"l.facebook\";i:15;s:5:\"l.fax\";i:16;s:11:\"l.firstname\";i:17;s:12:\"l.foursquare\";i:18;s:4:\"l.id\";i:19;s:11:\"l.instagram\";i:20;s:10:\"l.lastname\";i:21;s:10:\"l.linkedin\";i:22;s:8:\"l.mobile\";i:23;s:7:\"l.phone\";i:24;s:8:\"l.points\";i:25;s:10:\"l.position\";i:26;s:18:\"l.preferred_locale\";i:27;s:10:\"l.timezone\";i:28;s:9:\"l.company\";i:29;s:7:\"l.skype\";i:30;s:7:\"l.state\";i:31;s:7:\"l.title\";i:32;s:9:\"l.twitter\";i:33;s:9:\"l.website\";i:34;s:9:\"l.zipcode\";i:35;s:25:\"companies_lead.date_added\";i:36;s:12:\"p.date_added\";i:37;s:11:\"ph.date_hit\";i:38;s:15:\"p.date_modified\";i:39;s:12:\"ph.date_left\";i:40;s:6:\"ph.isp\";i:41;s:6:\"ph.url\";i:42;s:20:\"ph.browser_languages\";i:43;s:7:\"ph.city\";i:44;s:7:\"ph.code\";i:45;s:10:\"ph.country\";i:46;s:15:\"ph.organization\";i:47;s:10:\"ph.referer\";i:48;s:14:\"ph.remote_host\";i:49;s:13:\"ph.user_agent\";i:50;s:4:\"p.id\";i:51;s:12:\"i.ip_address\";i:52;s:14:\"p.is_published\";i:53;s:25:\"companies_lead.is_primary\";i:54;s:18:\"p.modified_by_user\";i:55;s:9:\"ph.source\";i:56;s:12:\"ph.source_id\";i:57;s:16:\"comp.companyname\";i:58;s:19:\"comp.companycountry\";i:59;s:23:\"comp.companydescription\";i:60;s:17:\"comp.companyemail\";}}s:12:\"dateModified\";a:2:{i:0;s:25:\"2020-11-11T09:55:20+08:00\";i:1;s:25:\"2020-11-11T09:56:42+08:00\";}}', '2020-11-11 01:56:42', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('20', '1', 'haorui jia', 'report', 'report', '1', 'update', 'a:9:{s:7:\"columns\";a:2:{i:0;a:0:{}i:1;a:99:{i:0;s:11:\"ph.date_hit\";i:1;s:6:\"ph.url\";i:2;s:12:\"ph.url_title\";i:3;s:10:\"ph.referer\";i:4;s:12:\"i.ip_address\";i:5;s:7:\"ph.city\";i:6;s:10:\"ph.country\";i:7;s:14:\"p.variant_hits\";i:8;s:5:\"vp.id\";i:9;s:8:\"vp.title\";i:10;s:20:\"p.variant_start_date\";i:11;s:4:\"c.id\";i:12;s:7:\"c.title\";i:13;s:10:\"l.address1\";i:14;s:10:\"l.address2\";i:15;s:13:\"l.attribution\";i:16;s:18:\"l.attribution_date\";i:17;s:6:\"l.city\";i:18;s:9:\"l.country\";i:19;s:13:\"l.last_active\";i:20;s:7:\"l.email\";i:21;s:10:\"l.facebook\";i:22;s:5:\"l.fax\";i:23;s:11:\"l.firstname\";i:24;s:4:\"l.id\";i:25;s:11:\"l.instagram\";i:26;s:7:\"l.phone\";i:27;s:18:\"l.preferred_locale\";i:28;s:10:\"l.timezone\";i:29;s:9:\"l.company\";i:30;s:8:\"l.mobile\";i:31;s:8:\"l.points\";i:32;s:7:\"l.skype\";i:33;s:9:\"l.twitter\";i:34;s:9:\"l.website\";i:35;s:14:\"p.publish_down\";i:36;s:5:\"ph.id\";i:37;s:9:\"ph.source\";i:38;s:5:\"r.url\";i:39;s:10:\"p.revision\";i:40;s:19:\"comp.companywebsite\";i:41;s:19:\"comp.companyzipcode\";i:42;s:7:\"comp.id\";i:43;s:17:\"comp.companystate\";i:44;s:17:\"p.created_by_user\";i:45;s:7:\"p.alias\";i:46;s:17:\"comp.companyphone\";i:47;s:8:\"cmp.name\";i:48;s:31:\"comp.companynumber_of_employees\";i:49;s:9:\"ds.device\";i:50;s:15:\"ds.device_brand\";i:51;s:17:\"ds.device_os_name\";i:52;s:21:\"ds.device_os_platform\";i:53;s:20:\"ds.device_os_version\";i:54;s:15:\"ds.device_model\";i:55;s:22:\"ds.device_os_shortname\";i:56;s:20:\"comp.companyindustry\";i:57;s:15:\"comp.companyfax\";i:58;s:19:\"comp.companycountry\";i:59;s:16:\"comp.companyname\";i:60;s:16:\"comp.companycity\";i:61;s:26:\"comp.companyannual_revenue\";i:62;s:20:\"comp.companyaddress1\";i:63;s:20:\"comp.companyaddress2\";i:64;s:17:\"comp.companyemail\";i:65;s:23:\"comp.companydescription\";i:66;s:13:\"p.unique_hits\";i:67;s:8:\"tp.title\";i:68;s:16:\"clel.campaign_id\";i:69;s:12:\"ph.source_id\";i:70;s:18:\"p.modified_by_user\";i:71;s:25:\"companies_lead.is_primary\";i:72;s:6:\"r.hits\";i:73;s:13:\"r.unique_hits\";i:74;s:7:\"p.title\";i:75;s:6:\"p.lang\";i:76;s:5:\"tp.id\";i:77;s:12:\"p.publish_up\";i:78;s:14:\"p.is_published\";i:79;s:4:\"p.id\";i:80;s:13:\"ph.user_agent\";i:81;s:14:\"ph.remote_host\";i:82;s:9:\"ph.region\";i:83;s:15:\"ph.organization\";i:84;s:6:\"p.hits\";i:85;s:7:\"ph.code\";i:86;s:20:\"ph.browser_languages\";i:87;s:15:\"p.date_modified\";i:88;s:12:\"p.date_added\";i:89;s:7:\"l.state\";i:90;s:12:\"ph.date_left\";i:91;s:7:\"l.title\";i:92;s:9:\"l.zipcode\";i:93;s:25:\"companies_lead.date_added\";i:94;s:6:\"ph.isp\";i:95;s:10:\"l.linkedin\";i:96;s:10:\"l.position\";i:97;s:10:\"l.lastname\";i:98;s:12:\"l.foursquare\";}}s:6:\"graphs\";a:2:{i:0;a:0:{}i:1;a:9:{i:0;s:29:\"mautic.page.graph.pie.devices\";i:1;s:35:\"mautic.page.graph.line.time.on.site\";i:2;s:37:\"mautic.page.table.most.visited.unique\";i:3;s:30:\"mautic.page.table.most.visited\";i:4;s:38:\"mautic.page.graph.pie.new.vs.returning\";i:5;s:27:\"mautic.page.graph.line.hits\";i:6;s:31:\"mautic.page.graph.pie.languages\";i:7;s:34:\"mautic.page.graph.pie.time.on.site\";i:8;s:27:\"mautic.page.table.referrers\";}}s:6:\"system\";a:2:{i:0;b:1;i:1;i:1;}s:11:\"isScheduled\";a:2:{i:0;i:0;i:1;b:0;}s:12:\"scheduleUnit\";a:2:{i:0;s:5:\"DAILY\";i:1;N;}s:11:\"scheduleDay\";a:2:{i:0;s:2:\"MO\";i:1;N;}s:7:\"groupBy\";a:2:{i:0;a:61:{i:0;s:5:\"vp.id\";i:1;s:14:\"p.variant_hits\";i:2;s:8:\"vp.title\";i:3;s:20:\"p.variant_start_date\";i:4;s:4:\"c.id\";i:5;s:7:\"c.title\";i:6;s:10:\"l.address1\";i:7;s:10:\"l.address2\";i:8;s:13:\"l.attribution\";i:9;s:18:\"l.attribution_date\";i:10;s:6:\"l.city\";i:11;s:9:\"l.country\";i:12;s:13:\"l.last_active\";i:13;s:7:\"l.email\";i:14;s:10:\"l.facebook\";i:15;s:5:\"l.fax\";i:16;s:11:\"l.firstname\";i:17;s:12:\"l.foursquare\";i:18;s:4:\"l.id\";i:19;s:11:\"l.instagram\";i:20;s:10:\"l.lastname\";i:21;s:10:\"l.linkedin\";i:22;s:8:\"l.mobile\";i:23;s:7:\"l.phone\";i:24;s:8:\"l.points\";i:25;s:10:\"l.position\";i:26;s:18:\"l.preferred_locale\";i:27;s:10:\"l.timezone\";i:28;s:9:\"l.company\";i:29;s:7:\"l.skype\";i:30;s:7:\"l.state\";i:31;s:7:\"l.title\";i:32;s:9:\"l.twitter\";i:33;s:9:\"l.website\";i:34;s:9:\"l.zipcode\";i:35;s:25:\"companies_lead.date_added\";i:36;s:12:\"p.date_added\";i:37;s:11:\"ph.date_hit\";i:38;s:15:\"p.date_modified\";i:39;s:12:\"ph.date_left\";i:40;s:6:\"ph.isp\";i:41;s:6:\"ph.url\";i:42;s:20:\"ph.browser_languages\";i:43;s:7:\"ph.city\";i:44;s:7:\"ph.code\";i:45;s:10:\"ph.country\";i:46;s:15:\"ph.organization\";i:47;s:10:\"ph.referer\";i:48;s:14:\"ph.remote_host\";i:49;s:13:\"ph.user_agent\";i:50;s:4:\"p.id\";i:51;s:12:\"i.ip_address\";i:52;s:14:\"p.is_published\";i:53;s:25:\"companies_lead.is_primary\";i:54;s:18:\"p.modified_by_user\";i:55;s:9:\"ph.source\";i:56;s:12:\"ph.source_id\";i:57;s:16:\"comp.companyname\";i:58;s:19:\"comp.companycountry\";i:59;s:23:\"comp.companydescription\";i:60;s:17:\"comp.companyemail\";}i:1;a:99:{i:0;s:5:\"vp.id\";i:1;s:14:\"p.variant_hits\";i:2;s:8:\"vp.title\";i:3;s:20:\"p.variant_start_date\";i:4;s:4:\"c.id\";i:5;s:7:\"c.title\";i:6;s:10:\"l.address1\";i:7;s:10:\"l.address2\";i:8;s:13:\"l.attribution\";i:9;s:18:\"l.attribution_date\";i:10;s:6:\"l.city\";i:11;s:9:\"l.country\";i:12;s:13:\"l.last_active\";i:13;s:7:\"l.email\";i:14;s:10:\"l.facebook\";i:15;s:5:\"l.fax\";i:16;s:11:\"l.firstname\";i:17;s:12:\"l.foursquare\";i:18;s:4:\"l.id\";i:19;s:11:\"l.instagram\";i:20;s:10:\"l.lastname\";i:21;s:10:\"l.linkedin\";i:22;s:8:\"l.mobile\";i:23;s:7:\"l.phone\";i:24;s:8:\"l.points\";i:25;s:10:\"l.position\";i:26;s:18:\"l.preferred_locale\";i:27;s:10:\"l.timezone\";i:28;s:9:\"l.company\";i:29;s:7:\"l.skype\";i:30;s:7:\"l.state\";i:31;s:7:\"l.title\";i:32;s:9:\"l.twitter\";i:33;s:9:\"l.website\";i:34;s:9:\"l.zipcode\";i:35;s:25:\"companies_lead.date_added\";i:36;s:12:\"p.date_added\";i:37;s:11:\"ph.date_hit\";i:38;s:15:\"p.date_modified\";i:39;s:12:\"ph.date_left\";i:40;s:6:\"ph.isp\";i:41;s:6:\"ph.url\";i:42;s:20:\"ph.browser_languages\";i:43;s:7:\"ph.city\";i:44;s:7:\"ph.code\";i:45;s:10:\"ph.country\";i:46;s:15:\"ph.organization\";i:47;s:10:\"ph.referer\";i:48;s:14:\"ph.remote_host\";i:49;s:13:\"ph.user_agent\";i:50;s:4:\"p.id\";i:51;s:12:\"i.ip_address\";i:52;s:14:\"p.is_published\";i:53;s:25:\"companies_lead.is_primary\";i:54;s:18:\"p.modified_by_user\";i:55;s:9:\"ph.source\";i:56;s:12:\"ph.source_id\";i:57;s:16:\"comp.companyname\";i:58;s:19:\"comp.companycountry\";i:59;s:23:\"comp.companydescription\";i:60;s:17:\"comp.companyemail\";i:61;s:6:\"p.lang\";i:62;s:20:\"ds.device_os_version\";i:63;s:21:\"ds.device_os_platform\";i:64;s:17:\"ds.device_os_name\";i:65;s:15:\"ds.device_model\";i:66;s:15:\"ds.device_brand\";i:67;s:9:\"ds.device\";i:68;s:7:\"p.title\";i:69;s:16:\"clel.campaign_id\";i:70;s:8:\"cmp.name\";i:71;s:7:\"p.alias\";i:72;s:17:\"p.created_by_user\";i:73;s:7:\"comp.id\";i:74;s:22:\"ds.device_os_shortname\";i:75;s:19:\"comp.companyzipcode\";i:76;s:19:\"comp.companywebsite\";i:77;s:17:\"comp.companystate\";i:78;s:17:\"comp.companyphone\";i:79;s:20:\"comp.companyindustry\";i:80;s:15:\"comp.companyfax\";i:81;s:26:\"comp.companyannual_revenue\";i:82;s:20:\"comp.companyaddress2\";i:83;s:13:\"p.unique_hits\";i:84;s:8:\"tp.title\";i:85;s:10:\"p.revision\";i:86;s:13:\"r.unique_hits\";i:87;s:5:\"tp.id\";i:88;s:6:\"r.hits\";i:89;s:5:\"r.url\";i:90;s:12:\"p.publish_up\";i:91;s:14:\"p.publish_down\";i:92;s:16:\"comp.companycity\";i:93;s:20:\"comp.companyaddress1\";i:94;s:5:\"ph.id\";i:95;s:9:\"ph.region\";i:96;s:31:\"comp.companynumber_of_employees\";i:97;s:12:\"ph.url_title\";i:98;s:6:\"p.hits\";}}s:10:\"tableOrder\";a:2:{i:0;a:1:{i:0;a:2:{s:6:\"column\";s:11:\"ph.date_hit\";s:9:\"direction\";s:3:\"ASC\";}}i:1;a:3:{i:0;a:2:{s:6:\"column\";s:11:\"ph.date_hit\";s:9:\"direction\";s:3:\"ASC\";}i:2;a:2:{s:6:\"column\";s:14:\"p.variant_hits\";s:9:\"direction\";s:3:\"ASC\";}i:3;a:2:{s:6:\"column\";s:14:\"p.variant_hits\";s:9:\"direction\";s:3:\"ASC\";}}}s:12:\"dateModified\";a:2:{i:0;s:25:\"2020-11-11T09:56:42+08:00\";i:1;s:25:\"2020-11-11T10:04:15+08:00\";}}', '2020-11-11 02:04:15', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('21', '1', 'haorui jia', 'report', 'report', '1', 'update', 'a:8:{s:7:\"columns\";a:2:{i:0;a:0:{}i:1;a:99:{i:0;s:11:\"ph.date_hit\";i:1;s:6:\"ph.url\";i:2;s:12:\"ph.url_title\";i:3;s:10:\"ph.referer\";i:4;s:12:\"i.ip_address\";i:5;s:7:\"ph.city\";i:6;s:10:\"ph.country\";i:7;s:14:\"p.variant_hits\";i:8;s:5:\"vp.id\";i:9;s:8:\"vp.title\";i:10;s:20:\"p.variant_start_date\";i:11;s:4:\"c.id\";i:12;s:7:\"c.title\";i:13;s:10:\"l.address1\";i:14;s:10:\"l.address2\";i:15;s:13:\"l.attribution\";i:16;s:18:\"l.attribution_date\";i:17;s:6:\"l.city\";i:18;s:9:\"l.country\";i:19;s:13:\"l.last_active\";i:20;s:7:\"l.email\";i:21;s:10:\"l.facebook\";i:22;s:5:\"l.fax\";i:23;s:11:\"l.firstname\";i:24;s:4:\"l.id\";i:25;s:11:\"l.instagram\";i:26;s:7:\"l.phone\";i:27;s:18:\"l.preferred_locale\";i:28;s:10:\"l.timezone\";i:29;s:9:\"l.company\";i:30;s:8:\"l.mobile\";i:31;s:8:\"l.points\";i:32;s:7:\"l.skype\";i:33;s:9:\"l.twitter\";i:34;s:9:\"l.website\";i:35;s:14:\"p.publish_down\";i:36;s:5:\"ph.id\";i:37;s:9:\"ph.source\";i:38;s:5:\"r.url\";i:39;s:10:\"p.revision\";i:40;s:19:\"comp.companywebsite\";i:41;s:19:\"comp.companyzipcode\";i:42;s:7:\"comp.id\";i:43;s:17:\"comp.companystate\";i:44;s:17:\"p.created_by_user\";i:45;s:7:\"p.alias\";i:46;s:17:\"comp.companyphone\";i:47;s:8:\"cmp.name\";i:48;s:31:\"comp.companynumber_of_employees\";i:49;s:9:\"ds.device\";i:50;s:15:\"ds.device_brand\";i:51;s:17:\"ds.device_os_name\";i:52;s:21:\"ds.device_os_platform\";i:53;s:20:\"ds.device_os_version\";i:54;s:15:\"ds.device_model\";i:55;s:22:\"ds.device_os_shortname\";i:56;s:20:\"comp.companyindustry\";i:57;s:15:\"comp.companyfax\";i:58;s:19:\"comp.companycountry\";i:59;s:16:\"comp.companyname\";i:60;s:16:\"comp.companycity\";i:61;s:26:\"comp.companyannual_revenue\";i:62;s:20:\"comp.companyaddress1\";i:63;s:20:\"comp.companyaddress2\";i:64;s:17:\"comp.companyemail\";i:65;s:23:\"comp.companydescription\";i:66;s:13:\"p.unique_hits\";i:67;s:8:\"tp.title\";i:68;s:16:\"clel.campaign_id\";i:69;s:12:\"ph.source_id\";i:70;s:18:\"p.modified_by_user\";i:71;s:25:\"companies_lead.is_primary\";i:72;s:6:\"r.hits\";i:73;s:13:\"r.unique_hits\";i:74;s:7:\"p.title\";i:75;s:6:\"p.lang\";i:76;s:5:\"tp.id\";i:77;s:12:\"p.publish_up\";i:78;s:14:\"p.is_published\";i:79;s:4:\"p.id\";i:80;s:13:\"ph.user_agent\";i:81;s:14:\"ph.remote_host\";i:82;s:9:\"ph.region\";i:83;s:15:\"ph.organization\";i:84;s:6:\"p.hits\";i:85;s:7:\"ph.code\";i:86;s:20:\"ph.browser_languages\";i:87;s:15:\"p.date_modified\";i:88;s:12:\"p.date_added\";i:89;s:7:\"l.state\";i:90;s:12:\"ph.date_left\";i:91;s:7:\"l.title\";i:92;s:9:\"l.zipcode\";i:93;s:25:\"companies_lead.date_added\";i:94;s:6:\"ph.isp\";i:95;s:10:\"l.linkedin\";i:96;s:10:\"l.position\";i:97;s:10:\"l.lastname\";i:98;s:12:\"l.foursquare\";}}s:6:\"graphs\";a:2:{i:0;a:0:{}i:1;a:9:{i:0;s:29:\"mautic.page.graph.pie.devices\";i:1;s:35:\"mautic.page.graph.line.time.on.site\";i:2;s:37:\"mautic.page.table.most.visited.unique\";i:3;s:30:\"mautic.page.table.most.visited\";i:4;s:38:\"mautic.page.graph.pie.new.vs.returning\";i:5;s:27:\"mautic.page.graph.line.hits\";i:6;s:31:\"mautic.page.graph.pie.languages\";i:7;s:34:\"mautic.page.graph.pie.time.on.site\";i:8;s:27:\"mautic.page.table.referrers\";}}s:6:\"system\";a:2:{i:0;b:1;i:1;i:1;}s:11:\"isScheduled\";a:2:{i:0;i:0;i:1;b:0;}s:12:\"scheduleUnit\";a:2:{i:0;s:5:\"DAILY\";i:1;N;}s:11:\"scheduleDay\";a:2:{i:0;s:2:\"MO\";i:1;N;}s:11:\"aggregators\";a:2:{i:0;a:2:{i:2;a:2:{s:8:\"function\";s:5:\"COUNT\";s:6:\"column\";s:14:\"p.variant_hits\";}i:3;a:2:{s:8:\"function\";s:5:\"COUNT\";s:6:\"column\";s:7:\"c.title\";}}i:1;a:3:{i:2;a:2:{s:8:\"function\";s:5:\"COUNT\";s:6:\"column\";s:14:\"p.variant_hits\";}i:3;a:2:{s:8:\"function\";s:5:\"COUNT\";s:6:\"column\";s:7:\"c.title\";}i:4;a:2:{s:8:\"function\";s:5:\"COUNT\";s:6:\"column\";s:13:\"l.attribution\";}}}s:12:\"dateModified\";a:2:{i:0;s:25:\"2020-11-11T10:04:15+08:00\";i:1;s:25:\"2020-11-11T10:14:03+08:00\";}}', '2020-11-11 02:14:03', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('22', '1', 'haorui jia', 'report', 'report', '1', 'update', 'a:7:{s:7:\"columns\";a:2:{i:0;a:0:{}i:1;a:99:{i:0;s:11:\"ph.date_hit\";i:1;s:6:\"ph.url\";i:2;s:12:\"ph.url_title\";i:3;s:10:\"ph.referer\";i:4;s:12:\"i.ip_address\";i:5;s:7:\"ph.city\";i:6;s:10:\"ph.country\";i:7;s:14:\"p.variant_hits\";i:8;s:5:\"vp.id\";i:9;s:8:\"vp.title\";i:10;s:20:\"p.variant_start_date\";i:11;s:4:\"c.id\";i:12;s:7:\"c.title\";i:13;s:10:\"l.address1\";i:14;s:10:\"l.address2\";i:15;s:13:\"l.attribution\";i:16;s:18:\"l.attribution_date\";i:17;s:6:\"l.city\";i:18;s:9:\"l.country\";i:19;s:13:\"l.last_active\";i:20;s:7:\"l.email\";i:21;s:10:\"l.facebook\";i:22;s:5:\"l.fax\";i:23;s:11:\"l.firstname\";i:24;s:4:\"l.id\";i:25;s:11:\"l.instagram\";i:26;s:7:\"l.phone\";i:27;s:18:\"l.preferred_locale\";i:28;s:10:\"l.timezone\";i:29;s:9:\"l.company\";i:30;s:8:\"l.mobile\";i:31;s:8:\"l.points\";i:32;s:7:\"l.skype\";i:33;s:9:\"l.twitter\";i:34;s:9:\"l.website\";i:35;s:14:\"p.publish_down\";i:36;s:5:\"ph.id\";i:37;s:9:\"ph.source\";i:38;s:5:\"r.url\";i:39;s:10:\"p.revision\";i:40;s:19:\"comp.companywebsite\";i:41;s:19:\"comp.companyzipcode\";i:42;s:7:\"comp.id\";i:43;s:17:\"comp.companystate\";i:44;s:17:\"p.created_by_user\";i:45;s:7:\"p.alias\";i:46;s:17:\"comp.companyphone\";i:47;s:8:\"cmp.name\";i:48;s:31:\"comp.companynumber_of_employees\";i:49;s:9:\"ds.device\";i:50;s:15:\"ds.device_brand\";i:51;s:17:\"ds.device_os_name\";i:52;s:21:\"ds.device_os_platform\";i:53;s:20:\"ds.device_os_version\";i:54;s:15:\"ds.device_model\";i:55;s:22:\"ds.device_os_shortname\";i:56;s:20:\"comp.companyindustry\";i:57;s:15:\"comp.companyfax\";i:58;s:19:\"comp.companycountry\";i:59;s:16:\"comp.companyname\";i:60;s:16:\"comp.companycity\";i:61;s:26:\"comp.companyannual_revenue\";i:62;s:20:\"comp.companyaddress1\";i:63;s:20:\"comp.companyaddress2\";i:64;s:17:\"comp.companyemail\";i:65;s:23:\"comp.companydescription\";i:66;s:13:\"p.unique_hits\";i:67;s:8:\"tp.title\";i:68;s:16:\"clel.campaign_id\";i:69;s:12:\"ph.source_id\";i:70;s:18:\"p.modified_by_user\";i:71;s:25:\"companies_lead.is_primary\";i:72;s:6:\"r.hits\";i:73;s:13:\"r.unique_hits\";i:74;s:7:\"p.title\";i:75;s:6:\"p.lang\";i:76;s:5:\"tp.id\";i:77;s:12:\"p.publish_up\";i:78;s:14:\"p.is_published\";i:79;s:4:\"p.id\";i:80;s:13:\"ph.user_agent\";i:81;s:14:\"ph.remote_host\";i:82;s:9:\"ph.region\";i:83;s:15:\"ph.organization\";i:84;s:6:\"p.hits\";i:85;s:7:\"ph.code\";i:86;s:20:\"ph.browser_languages\";i:87;s:15:\"p.date_modified\";i:88;s:12:\"p.date_added\";i:89;s:7:\"l.state\";i:90;s:12:\"ph.date_left\";i:91;s:7:\"l.title\";i:92;s:9:\"l.zipcode\";i:93;s:25:\"companies_lead.date_added\";i:94;s:6:\"ph.isp\";i:95;s:10:\"l.linkedin\";i:96;s:10:\"l.position\";i:97;s:10:\"l.lastname\";i:98;s:12:\"l.foursquare\";}}s:6:\"graphs\";a:2:{i:0;a:0:{}i:1;a:9:{i:0;s:29:\"mautic.page.graph.pie.devices\";i:1;s:35:\"mautic.page.graph.line.time.on.site\";i:2;s:37:\"mautic.page.table.most.visited.unique\";i:3;s:30:\"mautic.page.table.most.visited\";i:4;s:38:\"mautic.page.graph.pie.new.vs.returning\";i:5;s:27:\"mautic.page.graph.line.hits\";i:6;s:31:\"mautic.page.graph.pie.languages\";i:7;s:34:\"mautic.page.graph.pie.time.on.site\";i:8;s:27:\"mautic.page.table.referrers\";}}s:6:\"system\";a:2:{i:0;b:1;i:1;i:1;}s:11:\"isScheduled\";a:2:{i:0;i:0;i:1;b:0;}s:12:\"scheduleUnit\";a:2:{i:0;s:5:\"DAILY\";i:1;N;}s:11:\"scheduleDay\";a:2:{i:0;s:2:\"MO\";i:1;N;}s:12:\"dateModified\";a:2:{i:0;s:25:\"2020-11-11T10:14:03+08:00\";i:1;s:25:\"2020-11-11T10:18:10+08:00\";}}', '2020-11-11 02:18:10', '127.0.0.1');
INSERT INTO `mautic_audit_log` VALUES ('23', '1', 'haorui jia', 'asset', 'asset', '1', 'create', 'a:6:{s:16:\"originalFileName\";a:2:{i:0;N;i:1;s:8:\"logo.png\";}s:5:\"title\";a:2:{i:0;N;i:1;s:8:\"logo.png\";}s:8:\"category\";a:2:{i:0;s:0:\"\";i:1;i:1;}s:8:\"language\";a:2:{i:0;s:2:\"en\";i:1;s:5:\"zh_CN\";}s:9:\"publishUp\";a:2:{i:0;N;i:1;s:25:\"2020-11-12T09:00:00+08:00\";}s:5:\"alias\";a:2:{i:0;N;i:1;s:7:\"logopng\";}}', '2020-11-12 00:55:48', '127.0.0.1');

-- ----------------------------
-- Table structure for mautic_cache_items
-- ----------------------------
DROP TABLE IF EXISTS `mautic_cache_items`;
CREATE TABLE `mautic_cache_items` (
  `item_id` varbinary(255) NOT NULL,
  `item_data` longblob NOT NULL,
  `item_lifetime` int(10) unsigned DEFAULT NULL,
  `item_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_cache_items
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_campaigns
-- ----------------------------
DROP TABLE IF EXISTS `mautic_campaigns`;
CREATE TABLE `mautic_campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `canvas_settings` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `allow_restart` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_25CCA0112469DE2` (`category_id`),
  CONSTRAINT `FK_25CCA0112469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_campaigns
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_campaign_events
-- ----------------------------
DROP TABLE IF EXISTS `mautic_campaign_events`;
CREATE TABLE `mautic_campaign_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_order` int(11) NOT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `trigger_date` datetime DEFAULT NULL,
  `trigger_interval` int(11) DEFAULT NULL,
  `trigger_interval_unit` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trigger_hour` time DEFAULT NULL,
  `trigger_restricted_start_hour` time DEFAULT NULL,
  `trigger_restricted_stop_hour` time DEFAULT NULL,
  `trigger_restricted_dow` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `trigger_mode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decision_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B13C4309F639F774` (`campaign_id`),
  KEY `IDX_B13C4309727ACA70` (`parent_id`),
  KEY `mautic_campaign_event_search` (`type`,`event_type`),
  KEY `mautic_campaign_event_type` (`event_type`),
  KEY `mautic_campaign_event_channel` (`channel`,`channel_id`),
  CONSTRAINT `FK_B13C4309727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `mautic_campaign_events` (`id`),
  CONSTRAINT `FK_B13C4309F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `mautic_campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_campaign_events
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_campaign_form_xref
-- ----------------------------
DROP TABLE IF EXISTS `mautic_campaign_form_xref`;
CREATE TABLE `mautic_campaign_form_xref` (
  `campaign_id` int(10) unsigned NOT NULL,
  `form_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`campaign_id`,`form_id`),
  KEY `IDX_F0013AE3F639F774` (`campaign_id`),
  KEY `IDX_F0013AE35FF69B7D` (`form_id`),
  CONSTRAINT `FK_F0013AE35FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `mautic_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F0013AE3F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `mautic_campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_campaign_form_xref
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_campaign_leadlist_xref
-- ----------------------------
DROP TABLE IF EXISTS `mautic_campaign_leadlist_xref`;
CREATE TABLE `mautic_campaign_leadlist_xref` (
  `campaign_id` int(10) unsigned NOT NULL,
  `leadlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`campaign_id`,`leadlist_id`),
  KEY `IDX_5379378BF639F774` (`campaign_id`),
  KEY `IDX_5379378BB9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_5379378BB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `mautic_lead_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5379378BF639F774` FOREIGN KEY (`campaign_id`) REFERENCES `mautic_campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_campaign_leadlist_xref
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_campaign_leads
-- ----------------------------
DROP TABLE IF EXISTS `mautic_campaign_leads`;
CREATE TABLE `mautic_campaign_leads` (
  `campaign_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  `date_last_exited` datetime DEFAULT NULL,
  `rotation` int(11) NOT NULL,
  PRIMARY KEY (`campaign_id`,`lead_id`),
  KEY `IDX_14FE129BF639F774` (`campaign_id`),
  KEY `IDX_14FE129B55458D` (`lead_id`),
  KEY `mautic_campaign_leads_date_added` (`date_added`),
  KEY `mautic_campaign_leads_date_exited` (`date_last_exited`),
  KEY `mautic_campaign_leads` (`campaign_id`,`manually_removed`,`lead_id`,`rotation`),
  CONSTRAINT `FK_14FE129B55458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_14FE129BF639F774` FOREIGN KEY (`campaign_id`) REFERENCES `mautic_campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_campaign_leads
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_campaign_lead_event_failed_log
-- ----------------------------
DROP TABLE IF EXISTS `mautic_campaign_lead_event_failed_log`;
CREATE TABLE `mautic_campaign_lead_event_failed_log` (
  `log_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `reason` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`log_id`),
  KEY `mautic_campaign_event_failed_date` (`date_added`),
  CONSTRAINT `FK_19CB6506EA675D86` FOREIGN KEY (`log_id`) REFERENCES `mautic_campaign_lead_event_log` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_campaign_lead_event_failed_log
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_campaign_lead_event_log
-- ----------------------------
DROP TABLE IF EXISTS `mautic_campaign_lead_event_log`;
CREATE TABLE `mautic_campaign_lead_event_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `campaign_id` int(10) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `rotation` int(11) NOT NULL,
  `date_triggered` datetime DEFAULT NULL,
  `is_scheduled` tinyint(1) NOT NULL,
  `trigger_date` datetime DEFAULT NULL,
  `system_triggered` tinyint(1) NOT NULL,
  `metadata` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `non_action_path_taken` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mautic_campaign_rotation` (`event_id`,`lead_id`,`rotation`),
  KEY `IDX_11C9A5F471F7E88B` (`event_id`),
  KEY `IDX_11C9A5F455458D` (`lead_id`),
  KEY `IDX_11C9A5F4F639F774` (`campaign_id`),
  KEY `IDX_11C9A5F4A03F5E9F` (`ip_id`),
  KEY `mautic_campaign_event_upcoming_search` (`is_scheduled`,`lead_id`),
  KEY `mautic_campaign_event_schedule_counts` (`campaign_id`,`is_scheduled`,`trigger_date`),
  KEY `mautic_campaign_date_triggered` (`date_triggered`),
  KEY `mautic_campaign_leads` (`lead_id`,`campaign_id`,`rotation`),
  KEY `mautic_campaign_log_channel` (`channel`,`channel_id`,`lead_id`),
  KEY `mautic_campaign_actions` (`campaign_id`,`event_id`,`date_triggered`),
  KEY `mautic_campaign_stats` (`campaign_id`,`date_triggered`,`event_id`,`non_action_path_taken`),
  CONSTRAINT `FK_11C9A5F455458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_11C9A5F471F7E88B` FOREIGN KEY (`event_id`) REFERENCES `mautic_campaign_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_11C9A5F4A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`),
  CONSTRAINT `FK_11C9A5F4F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `mautic_campaigns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_campaign_lead_event_log
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_categories
-- ----------------------------
DROP TABLE IF EXISTS `mautic_categories`;
CREATE TABLE `mautic_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bundle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mautic_category_alias_search` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_categories
-- ----------------------------
INSERT INTO `mautic_categories` VALUES ('1', '1', '2020-11-12 00:54:43', '1', 'haorui jia', null, null, null, null, null, null, '新思诺官方图片文件夹', '新思诺官方图片文件夹', 'xin-si-nuo-guan-fang-tu-pian-wen-jian-jia', null, 'asset');

-- ----------------------------
-- Table structure for mautic_channel_url_trackables
-- ----------------------------
DROP TABLE IF EXISTS `mautic_channel_url_trackables`;
CREATE TABLE `mautic_channel_url_trackables` (
  `channel_id` int(11) NOT NULL,
  `redirect_id` bigint(20) unsigned NOT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(11) NOT NULL,
  `unique_hits` int(11) NOT NULL,
  PRIMARY KEY (`redirect_id`,`channel_id`),
  KEY `IDX_187896B8B42D874D` (`redirect_id`),
  KEY `mautic_channel_url_trackable_search` (`channel`,`channel_id`),
  CONSTRAINT `FK_187896B8B42D874D` FOREIGN KEY (`redirect_id`) REFERENCES `mautic_page_redirects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_channel_url_trackables
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_companies
-- ----------------------------
DROP TABLE IF EXISTS `mautic_companies`;
CREATE TABLE `mautic_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_cache` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `score` int(11) DEFAULT NULL,
  `companyemail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyaddress1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyaddress2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyphone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companycity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companystate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyzipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companycountry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companywebsite` longtext COLLATE utf8mb4_unicode_ci,
  `companyindustry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companydescription` longtext COLLATE utf8mb4_unicode_ci,
  `companynumber_of_employees` double DEFAULT NULL,
  `companyfax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyannual_revenue` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_636B144B7E3C61F9` (`owner_id`),
  KEY `mautic_companyaddress1_search` (`companyaddress1`),
  KEY `mautic_companyaddress2_search` (`companyaddress2`),
  KEY `mautic_companyemail_search` (`companyemail`),
  KEY `mautic_companyphone_search` (`companyphone`),
  KEY `mautic_companycity_search` (`companycity`),
  KEY `mautic_companystate_search` (`companystate`),
  KEY `mautic_companyzipcode_search` (`companyzipcode`),
  KEY `mautic_companycountry_search` (`companycountry`),
  KEY `mautic_companyname_search` (`companyname`),
  KEY `mautic_companynumber_of_employees_search` (`companynumber_of_employees`),
  KEY `mautic_companyfax_search` (`companyfax`),
  KEY `mautic_companyannual_revenue_search` (`companyannual_revenue`),
  KEY `mautic_companyindustry_search` (`companyindustry`),
  KEY `mautic_company_filter` (`companyname`,`companyemail`),
  KEY `mautic_company_match` (`companyname`,`companycity`,`companycountry`,`companystate`),
  CONSTRAINT `FK_636B144B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `mautic_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_companies
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_companies_leads
-- ----------------------------
DROP TABLE IF EXISTS `mautic_companies_leads`;
CREATE TABLE `mautic_companies_leads` (
  `company_id` int(11) NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `is_primary` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`company_id`,`lead_id`),
  KEY `IDX_CBE16758979B1AD6` (`company_id`),
  KEY `IDX_CBE1675855458D` (`lead_id`),
  CONSTRAINT `FK_CBE1675855458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CBE16758979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `mautic_companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_companies_leads
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_contact_merge_records
-- ----------------------------
DROP TABLE IF EXISTS `mautic_contact_merge_records`;
CREATE TABLE `mautic_contact_merge_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `merged_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F8BDA754E7A1254A` (`contact_id`),
  KEY `mautic_contact_merge_date_added` (`date_added`),
  KEY `mautic_contact_merge_ids` (`merged_id`),
  CONSTRAINT `FK_F8BDA754E7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_contact_merge_records
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_dynamic_content
-- ----------------------------
DROP TABLE IF EXISTS `mautic_dynamic_content`;
CREATE TABLE `mautic_dynamic_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `translation_parent_id` int(10) unsigned DEFAULT NULL,
  `variant_parent_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `sent_count` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `utm_tags` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_settings` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `variant_start_date` datetime DEFAULT NULL,
  `filters` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `is_campaign_based` tinyint(1) NOT NULL DEFAULT '1',
  `slot_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1F41B35C12469DE2` (`category_id`),
  KEY `IDX_1F41B35C9091A2FB` (`translation_parent_id`),
  KEY `IDX_1F41B35C91861123` (`variant_parent_id`),
  KEY `mautic_is_campaign_based_index` (`is_campaign_based`),
  KEY `mautic_slot_name_index` (`slot_name`),
  CONSTRAINT `FK_1F41B35C12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_1F41B35C9091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `mautic_dynamic_content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1F41B35C91861123` FOREIGN KEY (`variant_parent_id`) REFERENCES `mautic_dynamic_content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_dynamic_content
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_dynamic_content_lead_data
-- ----------------------------
DROP TABLE IF EXISTS `mautic_dynamic_content_lead_data`;
CREATE TABLE `mautic_dynamic_content_lead_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `dynamic_content_id` int(10) unsigned DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `slot` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A7F9A36E55458D` (`lead_id`),
  KEY `IDX_A7F9A36ED9D0CD7` (`dynamic_content_id`),
  CONSTRAINT `FK_A7F9A36E55458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A7F9A36ED9D0CD7` FOREIGN KEY (`dynamic_content_id`) REFERENCES `mautic_dynamic_content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_dynamic_content_lead_data
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_dynamic_content_stats
-- ----------------------------
DROP TABLE IF EXISTS `mautic_dynamic_content_stats`;
CREATE TABLE `mautic_dynamic_content_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dynamic_content_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `tokens` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `sent_count` int(11) DEFAULT NULL,
  `last_sent` datetime DEFAULT NULL,
  `sent_details` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_C586EA6BD9D0CD7` (`dynamic_content_id`),
  KEY `IDX_C586EA6B55458D` (`lead_id`),
  KEY `mautic_stat_dynamic_content_search` (`dynamic_content_id`,`lead_id`),
  KEY `mautic_stat_dynamic_content_source_search` (`source`,`source_id`),
  CONSTRAINT `FK_C586EA6B55458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C586EA6BD9D0CD7` FOREIGN KEY (`dynamic_content_id`) REFERENCES `mautic_dynamic_content` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_dynamic_content_stats
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_emails
-- ----------------------------
DROP TABLE IF EXISTS `mautic_emails`;
CREATE TABLE `mautic_emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `translation_parent_id` int(10) unsigned DEFAULT NULL,
  `variant_parent_id` int(10) unsigned DEFAULT NULL,
  `unsubscribeform_id` int(10) unsigned DEFAULT NULL,
  `preference_center_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `subject` longtext COLLATE utf8mb4_unicode_ci,
  `from_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_to_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `utm_tags` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `plain_text` longtext COLLATE utf8mb4_unicode_ci,
  `custom_html` longtext COLLATE utf8mb4_unicode_ci,
  `email_type` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `read_count` int(11) NOT NULL,
  `sent_count` int(11) NOT NULL,
  `variant_sent_count` int(11) NOT NULL,
  `variant_read_count` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_settings` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `variant_start_date` datetime DEFAULT NULL,
  `dynamic_content` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `headers` json NOT NULL COMMENT '(DC2Type:json_array)',
  `public_preview` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3F1479E12469DE2` (`category_id`),
  KEY `IDX_3F1479E9091A2FB` (`translation_parent_id`),
  KEY `IDX_3F1479E91861123` (`variant_parent_id`),
  KEY `IDX_3F1479E2DC494F6` (`unsubscribeform_id`),
  KEY `IDX_3F1479E834F9C5B` (`preference_center_id`),
  CONSTRAINT `FK_3F1479E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_3F1479E2DC494F6` FOREIGN KEY (`unsubscribeform_id`) REFERENCES `mautic_forms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_3F1479E834F9C5B` FOREIGN KEY (`preference_center_id`) REFERENCES `mautic_pages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_3F1479E9091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `mautic_emails` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3F1479E91861123` FOREIGN KEY (`variant_parent_id`) REFERENCES `mautic_emails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_emails
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_email_assets_xref
-- ----------------------------
DROP TABLE IF EXISTS `mautic_email_assets_xref`;
CREATE TABLE `mautic_email_assets_xref` (
  `email_id` int(10) unsigned NOT NULL,
  `asset_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`email_id`,`asset_id`),
  KEY `IDX_39CFAB07A832C1C9` (`email_id`),
  KEY `IDX_39CFAB075DA1941` (`asset_id`),
  CONSTRAINT `FK_39CFAB075DA1941` FOREIGN KEY (`asset_id`) REFERENCES `mautic_assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_39CFAB07A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `mautic_emails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_email_assets_xref
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_email_copies
-- ----------------------------
DROP TABLE IF EXISTS `mautic_email_copies`;
CREATE TABLE `mautic_email_copies` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `subject` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_email_copies
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_email_list_xref
-- ----------------------------
DROP TABLE IF EXISTS `mautic_email_list_xref`;
CREATE TABLE `mautic_email_list_xref` (
  `email_id` int(10) unsigned NOT NULL,
  `leadlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`email_id`,`leadlist_id`),
  KEY `IDX_11DC9DF2A832C1C9` (`email_id`),
  KEY `IDX_11DC9DF2B9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_11DC9DF2A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `mautic_emails` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_11DC9DF2B9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `mautic_lead_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_email_list_xref
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_email_stats
-- ----------------------------
DROP TABLE IF EXISTS `mautic_email_stats`;
CREATE TABLE `mautic_email_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `list_id` int(10) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `copy_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_sent` datetime NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `is_failed` tinyint(1) NOT NULL,
  `viewed_in_browser` tinyint(1) NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `tracking_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `tokens` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `open_count` int(11) DEFAULT NULL,
  `last_opened` datetime DEFAULT NULL,
  `open_details` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `generated_sent_date` date GENERATED ALWAYS AS (concat(year(`date_sent`),'-',lpad(month(`date_sent`),2,'0'),'-',lpad(dayofmonth(`date_sent`),2,'0'))) VIRTUAL COMMENT '(DC2Type:generated)',
  PRIMARY KEY (`id`),
  KEY `IDX_D0F71136A832C1C9` (`email_id`),
  KEY `IDX_D0F7113655458D` (`lead_id`),
  KEY `IDX_D0F711363DAE168B` (`list_id`),
  KEY `IDX_D0F71136A03F5E9F` (`ip_id`),
  KEY `IDX_D0F71136A8752772` (`copy_id`),
  KEY `mautic_stat_email_search` (`email_id`,`lead_id`),
  KEY `mautic_stat_email_search2` (`lead_id`,`email_id`),
  KEY `mautic_stat_email_failed_search` (`is_failed`),
  KEY `mautic_is_read_date_sent` (`is_read`,`date_sent`),
  KEY `mautic_stat_email_hash_search` (`tracking_hash`),
  KEY `mautic_stat_email_source_search` (`source`,`source_id`),
  KEY `mautic_email_date_sent` (`date_sent`),
  KEY `mautic_email_date_read_lead` (`date_read`,`lead_id`),
  KEY `mautic_generated_sent_date_email_id` (`generated_sent_date`,`email_id`),
  CONSTRAINT `FK_D0F711363DAE168B` FOREIGN KEY (`list_id`) REFERENCES `mautic_lead_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_D0F7113655458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_D0F71136A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`),
  CONSTRAINT `FK_D0F71136A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `mautic_emails` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_D0F71136A8752772` FOREIGN KEY (`copy_id`) REFERENCES `mautic_email_copies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_email_stats
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_email_stats_devices
-- ----------------------------
DROP TABLE IF EXISTS `mautic_email_stats_devices`;
CREATE TABLE `mautic_email_stats_devices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) unsigned DEFAULT NULL,
  `stat_id` bigint(20) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_opened` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6626349F94A4C7D4` (`device_id`),
  KEY `IDX_6626349F9502F0B` (`stat_id`),
  KEY `IDX_6626349FA03F5E9F` (`ip_id`),
  KEY `mautic_date_opened_search` (`date_opened`),
  CONSTRAINT `FK_6626349F94A4C7D4` FOREIGN KEY (`device_id`) REFERENCES `mautic_lead_devices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6626349F9502F0B` FOREIGN KEY (`stat_id`) REFERENCES `mautic_email_stats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6626349FA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_email_stats_devices
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_email_stat_replies
-- ----------------------------
DROP TABLE IF EXISTS `mautic_email_stat_replies`;
CREATE TABLE `mautic_email_stat_replies` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `stat_id` bigint(20) unsigned NOT NULL,
  `date_replied` datetime NOT NULL,
  `message_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D1A064B19502F0B` (`stat_id`),
  KEY `mautic_email_replies` (`stat_id`,`message_id`),
  KEY `mautic_date_email_replied` (`date_replied`),
  CONSTRAINT `FK_D1A064B19502F0B` FOREIGN KEY (`stat_id`) REFERENCES `mautic_email_stats` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_email_stat_replies
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_focus
-- ----------------------------
DROP TABLE IF EXISTS `mautic_focus`;
CREATE TABLE `mautic_focus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `focus_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `style` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `utm_tags` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `form_id` int(11) DEFAULT NULL,
  `cache` longtext COLLATE utf8mb4_unicode_ci,
  `html_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor` longtext COLLATE utf8mb4_unicode_ci,
  `html` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_CD9DD44A12469DE2` (`category_id`),
  KEY `mautic_focus_type` (`focus_type`),
  KEY `mautic_focus_style` (`style`),
  KEY `mautic_focus_form` (`form_id`),
  CONSTRAINT `FK_CD9DD44A12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_focus
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_focus_stats
-- ----------------------------
DROP TABLE IF EXISTS `mautic_focus_stats`;
CREATE TABLE `mautic_focus_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `focus_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D99447CF51804B42` (`focus_id`),
  KEY `IDX_D99447CF55458D` (`lead_id`),
  KEY `mautic_focus_type` (`type`),
  KEY `mautic_focus_type_id` (`type`,`type_id`),
  KEY `mautic_focus_date_added` (`date_added`),
  CONSTRAINT `FK_D99447CF51804B42` FOREIGN KEY (`focus_id`) REFERENCES `mautic_focus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D99447CF55458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_focus_stats
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_forms
-- ----------------------------
DROP TABLE IF EXISTS `mautic_forms`;
CREATE TABLE `mautic_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_attr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cached_html` longtext COLLATE utf8mb4_unicode_ci,
  `post_action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_action_property` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_kiosk_mode` tinyint(1) DEFAULT NULL,
  `render_style` tinyint(1) DEFAULT NULL,
  `form_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_index` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5262855412469DE2` (`category_id`),
  CONSTRAINT `FK_5262855412469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_forms
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_form_actions
-- ----------------------------
DROP TABLE IF EXISTS `mautic_form_actions`;
CREATE TABLE `mautic_form_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_order` int(11) NOT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_B0802D3D5FF69B7D` (`form_id`),
  KEY `mautic_form_action_type_search` (`type`),
  CONSTRAINT `FK_B0802D3D5FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `mautic_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_form_actions
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_form_fields
-- ----------------------------
DROP TABLE IF EXISTS `mautic_form_fields`;
CREATE TABLE `mautic_form_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL,
  `label` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_label` tinyint(1) DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_custom` tinyint(1) NOT NULL,
  `custom_parameters` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `default_value` longtext COLLATE utf8mb4_unicode_ci,
  `is_required` tinyint(1) NOT NULL,
  `validation_message` longtext COLLATE utf8mb4_unicode_ci,
  `help_message` longtext COLLATE utf8mb4_unicode_ci,
  `field_order` int(11) DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `validation` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `label_attr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_attr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `container_attr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lead_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `save_result` tinyint(1) DEFAULT NULL,
  `is_auto_fill` tinyint(1) DEFAULT NULL,
  `show_when_value_exists` tinyint(1) DEFAULT NULL,
  `show_after_x_submissions` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_66F600355FF69B7D` (`form_id`),
  KEY `mautic_form_field_type_search` (`type`),
  CONSTRAINT `FK_66F600355FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `mautic_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_form_fields
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_form_submissions
-- ----------------------------
DROP TABLE IF EXISTS `mautic_form_submissions`;
CREATE TABLE `mautic_form_submissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL,
  `ip_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_submitted` datetime NOT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8F87CEF45FF69B7D` (`form_id`),
  KEY `IDX_8F87CEF4A03F5E9F` (`ip_id`),
  KEY `IDX_8F87CEF455458D` (`lead_id`),
  KEY `IDX_8F87CEF4C4663E4` (`page_id`),
  KEY `mautic_form_submission_tracking_search` (`tracking_id`),
  KEY `mautic_form_date_submitted` (`date_submitted`),
  CONSTRAINT `FK_8F87CEF455458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_8F87CEF45FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `mautic_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8F87CEF4A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`),
  CONSTRAINT `FK_8F87CEF4C4663E4` FOREIGN KEY (`page_id`) REFERENCES `mautic_pages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_form_submissions
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_imports
-- ----------------------------
DROP TABLE IF EXISTS `mautic_imports`;
CREATE TABLE `mautic_imports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_count` int(11) NOT NULL,
  `inserted_count` int(11) NOT NULL,
  `updated_count` int(11) NOT NULL,
  `ignored_count` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_started` datetime DEFAULT NULL,
  `date_ended` datetime DEFAULT NULL,
  `object` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `properties` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `mautic_import_object` (`object`),
  KEY `mautic_import_status` (`status`),
  KEY `mautic_import_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_imports
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_integration_entity
-- ----------------------------
DROP TABLE IF EXISTS `mautic_integration_entity`;
CREATE TABLE `mautic_integration_entity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_added` datetime NOT NULL,
  `integration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `integration_entity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `integration_entity_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_entity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_entity_id` int(11) DEFAULT NULL,
  `last_sync_date` datetime DEFAULT NULL,
  `internal` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `mautic_integration_external_entity` (`integration`,`integration_entity`,`integration_entity_id`),
  KEY `mautic_integration_internal_entity` (`integration`,`internal_entity`,`internal_entity_id`),
  KEY `mautic_integration_entity_match` (`integration`,`internal_entity`,`integration_entity`),
  KEY `mautic_integration_last_sync_date` (`integration`,`last_sync_date`),
  KEY `mautic_internal_integration_entity` (`internal_entity_id`,`integration_entity_id`,`internal_entity`,`integration_entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_integration_entity
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_ip_addresses
-- ----------------------------
DROP TABLE IF EXISTS `mautic_ip_addresses`;
CREATE TABLE `mautic_ip_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_details` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `mautic_ip_search` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_ip_addresses
-- ----------------------------
INSERT INTO `mautic_ip_addresses` VALUES ('1', '127.0.0.1', 'a:10:{s:4:\"city\";s:0:\"\";s:6:\"region\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:8:\"latitude\";s:0:\"\";s:9:\"longitude\";s:0:\"\";s:3:\"isp\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"timezone\";s:0:\"\";s:5:\"extra\";s:0:\"\";}');

-- ----------------------------
-- Table structure for mautic_leads
-- ----------------------------
DROP TABLE IF EXISTS `mautic_leads`;
CREATE TABLE `mautic_leads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `stage_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` int(11) NOT NULL,
  `last_active` datetime DEFAULT NULL,
  `internal` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `social_cache` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `date_identified` datetime DEFAULT NULL,
  `preferred_profile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferred_locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribution_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `attribution` double DEFAULT NULL,
  `website` longtext COLLATE utf8mb4_unicode_ci,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foursquare` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B8CDDBF17E3C61F9` (`owner_id`),
  KEY `IDX_B8CDDBF12298D193` (`stage_id`),
  KEY `mautic_lead_date_added` (`date_added`),
  KEY `mautic_date_identified` (`date_identified`),
  KEY `mautic_title_search` (`title`),
  KEY `mautic_firstname_search` (`firstname`),
  KEY `mautic_lastname_search` (`lastname`),
  KEY `mautic_company_search` (`company`),
  KEY `mautic_position_search` (`position`),
  KEY `mautic_email_search` (`email`),
  KEY `mautic_mobile_search` (`mobile`),
  KEY `mautic_phone_search` (`phone`),
  KEY `mautic_points_search` (`points`),
  KEY `mautic_fax_search` (`fax`),
  KEY `mautic_address1_search` (`address1`),
  KEY `mautic_address2_search` (`address2`),
  KEY `mautic_city_search` (`city`),
  KEY `mautic_state_search` (`state`),
  KEY `mautic_zipcode_search` (`zipcode`),
  KEY `mautic_country_search` (`country`),
  KEY `mautic_preferred_locale_search` (`preferred_locale`),
  KEY `mautic_timezone_search` (`timezone`),
  KEY `mautic_last_active_search` (`last_active`),
  KEY `mautic_attribution_date_search` (`attribution_date`),
  KEY `mautic_attribution_search` (`attribution`),
  KEY `mautic_facebook_search` (`facebook`),
  KEY `mautic_foursquare_search` (`foursquare`),
  KEY `mautic_instagram_search` (`instagram`),
  KEY `mautic_linkedin_search` (`linkedin`),
  KEY `mautic_skype_search` (`skype`),
  KEY `mautic_twitter_search` (`twitter`),
  KEY `mautic_contact_attribution` (`attribution`,`attribution_date`),
  KEY `mautic_date_added_country_index` (`date_added`,`country`),
  CONSTRAINT `FK_B8CDDBF12298D193` FOREIGN KEY (`stage_id`) REFERENCES `mautic_stages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B8CDDBF17E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `mautic_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_leads
-- ----------------------------
INSERT INTO `mautic_leads` VALUES ('1', null, null, '1', '2020-11-10 06:15:33', null, null, '2020-11-10 06:15:34', null, ' ', null, null, null, '0', '2020-11-10 06:15:34', 'a:0:{}', 'a:0:{}', null, 'gravatar', null, null, null, null, null, null, null, null, null, null, null, null, null, 'Asia/Shanghai', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `mautic_leads` VALUES ('2', null, null, '1', '2020-11-10 06:15:56', null, null, '2020-11-10 06:15:58', null, ' ', null, null, null, '0', '2020-11-11 05:54:50', 'a:0:{}', 'a:0:{}', null, 'gravatar', null, null, null, null, null, null, null, null, null, null, null, null, null, 'Asia/Shanghai', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for mautic_lead_categories
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_categories`;
CREATE TABLE `mautic_lead_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2D90301A12469DE2` (`category_id`),
  KEY `IDX_2D90301A55458D` (`lead_id`),
  CONSTRAINT `FK_2D90301A12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2D90301A55458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_categories
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_lead_companies_change_log
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_companies_change_log`;
CREATE TABLE `mautic_lead_companies_change_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `type` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5696496E55458D` (`lead_id`),
  KEY `mautic_company_date_added` (`date_added`),
  CONSTRAINT `FK_5696496E55458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_companies_change_log
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_lead_devices
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_devices`;
CREATE TABLE `mautic_lead_devices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `client_info` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `device` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_os_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_os_shortname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_os_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_os_platform` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CC6DAE1D7D05ABBE` (`tracking_id`),
  KEY `IDX_CC6DAE1D55458D` (`lead_id`),
  KEY `mautic_date_added_search` (`date_added`),
  KEY `mautic_device_search` (`device`),
  KEY `mautic_device_os_name_search` (`device_os_name`),
  KEY `mautic_device_os_shortname_search` (`device_os_shortname`),
  KEY `mautic_device_os_version_search` (`device_os_version`),
  KEY `mautic_device_os_platform_search` (`device_os_platform`),
  KEY `mautic_device_brand_search` (`device_brand`),
  KEY `mautic_device_model_search` (`device_model`),
  CONSTRAINT `FK_CC6DAE1D55458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_devices
-- ----------------------------
INSERT INTO `mautic_lead_devices` VALUES ('1', '1', '2020-11-10 06:15:34', 'a:6:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:4:\"86.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";}', 'desktop', 'Windows', 'WIN', '10', 'x64', '', '', 'dab8zs8gjs6vz3yz7yxzjd4');
INSERT INTO `mautic_lead_devices` VALUES ('2', '2', '2020-11-10 06:15:57', 'a:6:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:4:\"86.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";}', 'desktop', 'Windows', 'WIN', '10', 'x64', '', '', '0wijehagy48hcj25v8tcc65');

-- ----------------------------
-- Table structure for mautic_lead_donotcontact
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_donotcontact`;
CREATE TABLE `mautic_lead_donotcontact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `reason` smallint(6) NOT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_8222F76255458D` (`lead_id`),
  KEY `mautic_dnc_reason_search` (`reason`),
  CONSTRAINT `FK_8222F76255458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_donotcontact
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_lead_event_log
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_event_log`;
CREATE TABLE `mautic_lead_event_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bundle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `properties` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `mautic_lead_id_index` (`lead_id`),
  KEY `mautic_lead_object_index` (`object`,`object_id`),
  KEY `mautic_lead_timeline_index` (`bundle`,`object`,`action`,`object_id`),
  KEY `mautic_lead_timeline_action_index` (`action`),
  KEY `mautic_lead_date_added_index` (`date_added`),
  CONSTRAINT `FK_4A389C8855458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_event_log
-- ----------------------------
INSERT INTO `mautic_lead_event_log` VALUES ('1', '1', null, null, 'page', 'hit', 'created_contact', '1', '2020-11-10 06:15:34', '{\"object_description\": \"http://test.localhost.com/index.html\"}');
INSERT INTO `mautic_lead_event_log` VALUES ('2', '2', null, null, 'page', 'hit', 'created_contact', '2', '2020-11-10 06:15:58', '{\"object_description\": \"http://test.localhost.com/index.html\"}');

-- ----------------------------
-- Table structure for mautic_lead_fields
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_fields`;
CREATE TABLE `mautic_lead_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_fixed` tinyint(1) NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `is_short_visible` tinyint(1) NOT NULL,
  `is_listable` tinyint(1) NOT NULL,
  `is_publicly_updatable` tinyint(1) NOT NULL,
  `is_unique_identifer` tinyint(1) DEFAULT NULL,
  `field_order` int(11) DEFAULT NULL,
  `object` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `mautic_search_by_object` (`object`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_fields
-- ----------------------------
INSERT INTO `mautic_lead_fields` VALUES ('1', '1', null, null, null, null, null, null, null, null, null, 'Title', 'title', 'lookup', 'core', null, '0', '1', '1', '0', '1', '0', '0', '1', 'lead', 'a:1:{s:4:\"list\";a:3:{i:0;s:2:\"Mr\";i:1;s:3:\"Mrs\";i:2;s:4:\"Miss\";}}');
INSERT INTO `mautic_lead_fields` VALUES ('2', '1', null, null, null, null, null, null, null, null, null, 'First Name', 'firstname', 'text', 'core', null, '0', '1', '1', '1', '1', '0', '0', '2', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('3', '1', null, null, null, null, null, null, null, null, null, 'Last Name', 'lastname', 'text', 'core', null, '0', '1', '1', '1', '1', '0', '0', '3', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('4', '1', null, null, null, null, null, null, null, null, null, 'Primary company', 'company', 'text', 'core', null, '0', '1', '1', '0', '1', '0', '0', '4', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('5', '1', null, null, null, null, null, null, null, null, null, 'Position', 'position', 'text', 'core', null, '0', '1', '1', '0', '1', '0', '0', '5', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('6', '1', null, null, null, null, null, null, null, null, null, 'Email', 'email', 'email', 'core', null, '0', '1', '1', '1', '1', '0', '1', '6', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('7', '1', null, null, null, null, null, null, null, null, null, 'Mobile', 'mobile', 'tel', 'core', null, '0', '1', '1', '0', '1', '0', '0', '7', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('8', '1', null, null, null, null, null, null, null, null, null, 'Phone', 'phone', 'tel', 'core', null, '0', '1', '1', '0', '1', '0', '0', '8', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('9', '1', null, null, null, null, null, null, null, null, null, 'Points', 'points', 'number', 'core', '0', '0', '1', '1', '0', '1', '0', '0', '9', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('10', '1', null, null, null, null, null, null, null, null, null, 'Fax', 'fax', 'tel', 'core', null, '0', '0', '1', '0', '1', '0', '0', '10', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('11', '1', null, null, null, null, null, null, null, null, null, 'Address Line 1', 'address1', 'text', 'core', null, '0', '1', '1', '0', '1', '0', '0', '11', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('12', '1', null, null, null, null, null, null, null, null, null, 'Address Line 2', 'address2', 'text', 'core', null, '0', '1', '1', '0', '1', '0', '0', '12', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('13', '1', null, null, null, null, null, null, null, null, null, 'City', 'city', 'text', 'core', null, '0', '1', '1', '0', '1', '0', '0', '13', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('14', '1', null, null, null, null, null, null, null, null, null, 'State', 'state', 'region', 'core', null, '0', '1', '1', '0', '1', '0', '0', '14', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('15', '1', null, null, null, null, null, null, null, null, null, 'Zip Code', 'zipcode', 'text', 'core', null, '0', '1', '1', '0', '1', '0', '0', '15', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('16', '1', null, null, null, null, null, null, null, null, null, 'Country', 'country', 'country', 'core', null, '0', '1', '1', '0', '1', '0', '0', '16', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('17', '1', null, null, null, null, null, null, null, null, null, 'Preferred Locale', 'preferred_locale', 'locale', 'core', null, '0', '1', '1', '0', '1', '0', '0', '17', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('18', '1', null, null, null, null, null, null, null, null, null, 'Preferred Timezone', 'timezone', 'timezone', 'core', null, '0', '1', '1', '0', '1', '0', '0', '18', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('19', '1', null, null, null, null, null, null, null, null, null, 'Date Last Active', 'last_active', 'datetime', 'core', null, '0', '1', '1', '0', '1', '0', '0', '19', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('20', '1', null, null, null, null, null, null, null, null, null, 'Attribution Date', 'attribution_date', 'datetime', 'core', null, '0', '1', '1', '0', '1', '0', '0', '20', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('21', '1', null, null, null, null, null, null, null, null, null, 'Attribution', 'attribution', 'number', 'core', null, '0', '1', '1', '0', '1', '0', '0', '21', 'lead', 'a:2:{s:9:\"roundmode\";i:4;s:5:\"scale\";i:2;}');
INSERT INTO `mautic_lead_fields` VALUES ('22', '1', null, null, null, null, null, null, null, null, null, 'Website', 'website', 'url', 'core', null, '0', '0', '1', '0', '1', '0', '0', '22', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('23', '1', null, null, null, null, null, null, null, null, null, 'Facebook', 'facebook', 'text', 'social', null, '0', '0', '1', '0', '1', '0', '0', '23', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('24', '1', null, null, null, null, null, null, null, null, null, 'Foursquare', 'foursquare', 'text', 'social', null, '0', '0', '1', '0', '1', '0', '0', '24', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('25', '1', null, null, null, null, null, null, null, null, null, 'Instagram', 'instagram', 'text', 'social', null, '0', '0', '1', '0', '1', '0', '0', '25', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('26', '1', null, null, null, null, null, null, null, null, null, 'LinkedIn', 'linkedin', 'text', 'social', null, '0', '0', '1', '0', '1', '0', '0', '26', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('27', '1', null, null, null, null, null, null, null, null, null, 'Skype', 'skype', 'text', 'social', null, '0', '0', '1', '0', '1', '0', '0', '27', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('28', '1', null, null, null, null, null, null, null, null, null, 'Twitter', 'twitter', 'text', 'social', null, '0', '0', '1', '0', '1', '0', '0', '28', 'lead', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('29', '1', null, null, null, null, null, null, null, null, null, 'Address 1', 'companyaddress1', 'text', 'core', null, '0', '1', '1', '0', '1', '0', '0', '1', 'company', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('30', '1', null, null, null, null, null, null, null, null, null, 'Address 2', 'companyaddress2', 'text', 'core', null, '0', '1', '1', '0', '1', '0', '0', '2', 'company', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('31', '1', null, null, null, null, null, null, null, null, null, 'Company Email', 'companyemail', 'email', 'core', null, '0', '1', '1', '0', '1', '0', '1', '3', 'company', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('32', '1', null, null, null, null, null, null, null, null, null, 'Phone', 'companyphone', 'tel', 'core', null, '0', '1', '1', '0', '1', '0', '0', '4', 'company', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('33', '1', null, null, null, null, null, null, null, null, null, 'City', 'companycity', 'text', 'core', null, '0', '1', '1', '0', '1', '0', '0', '5', 'company', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('34', '1', null, null, null, null, null, null, null, null, null, 'State', 'companystate', 'region', 'core', null, '0', '1', '1', '0', '1', '0', '0', '6', 'company', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('35', '1', null, null, null, null, null, null, null, null, null, 'Zip Code', 'companyzipcode', 'text', 'core', null, '0', '1', '1', '0', '1', '0', '0', '7', 'company', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('36', '1', null, null, null, null, null, null, null, null, null, 'Country', 'companycountry', 'country', 'core', null, '0', '1', '1', '0', '1', '0', '0', '8', 'company', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('37', '1', null, null, null, null, null, null, null, null, null, 'Company Name', 'companyname', 'text', 'core', null, '1', '1', '1', '0', '1', '0', '0', '9', 'company', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('38', '1', null, null, null, null, null, null, null, null, null, 'Website', 'companywebsite', 'url', 'core', null, '0', '1', '1', '0', '1', '0', '0', '10', 'company', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('39', '1', null, null, null, null, null, null, null, null, null, 'Number of Employees', 'companynumber_of_employees', 'number', 'professional', null, '0', '0', '1', '0', '1', '0', '0', '11', 'company', 'a:2:{s:9:\"roundmode\";i:4;s:5:\"scale\";i:0;}');
INSERT INTO `mautic_lead_fields` VALUES ('40', '1', null, null, null, null, null, null, null, null, null, 'Fax', 'companyfax', 'tel', 'professional', null, '0', '0', '1', '0', '1', '0', '0', '12', 'company', 'a:0:{}');
INSERT INTO `mautic_lead_fields` VALUES ('41', '1', null, null, null, null, null, null, null, null, null, 'Annual Revenue', 'companyannual_revenue', 'number', 'professional', null, '0', '0', '1', '0', '1', '0', '0', '13', 'company', 'a:2:{s:9:\"roundmode\";i:4;s:5:\"scale\";i:2;}');
INSERT INTO `mautic_lead_fields` VALUES ('42', '1', null, null, null, null, null, null, null, null, null, 'Industry', 'companyindustry', 'select', 'professional', null, '0', '1', '1', '0', '1', '0', '0', '14', 'company', 'a:1:{s:4:\"list\";a:31:{i:0;a:2:{s:5:\"label\";s:11:\"Agriculture\";s:5:\"value\";s:11:\"Agriculture\";}i:1;a:2:{s:5:\"label\";s:7:\"Apparel\";s:5:\"value\";s:7:\"Apparel\";}i:2;a:2:{s:5:\"label\";s:7:\"Banking\";s:5:\"value\";s:7:\"Banking\";}i:3;a:2:{s:5:\"label\";s:13:\"Biotechnology\";s:5:\"value\";s:13:\"Biotechnology\";}i:4;a:2:{s:5:\"label\";s:9:\"Chemicals\";s:5:\"value\";s:9:\"Chemicals\";}i:5;a:2:{s:5:\"label\";s:14:\"Communications\";s:5:\"value\";s:14:\"Communications\";}i:6;a:2:{s:5:\"label\";s:12:\"Construction\";s:5:\"value\";s:12:\"Construction\";}i:7;a:2:{s:5:\"label\";s:9:\"Education\";s:5:\"value\";s:9:\"Education\";}i:8;a:2:{s:5:\"label\";s:11:\"Electronics\";s:5:\"value\";s:11:\"Electronics\";}i:9;a:2:{s:5:\"label\";s:6:\"Energy\";s:5:\"value\";s:6:\"Energy\";}i:10;a:2:{s:5:\"label\";s:11:\"Engineering\";s:5:\"value\";s:11:\"Engineering\";}i:11;a:2:{s:5:\"label\";s:13:\"Entertainment\";s:5:\"value\";s:13:\"Entertainment\";}i:12;a:2:{s:5:\"label\";s:13:\"Environmental\";s:5:\"value\";s:13:\"Environmental\";}i:13;a:2:{s:5:\"label\";s:7:\"Finance\";s:5:\"value\";s:7:\"Finance\";}i:14;a:2:{s:5:\"label\";s:15:\"Food & Beverage\";s:5:\"value\";s:15:\"Food & Beverage\";}i:15;a:2:{s:5:\"label\";s:10:\"Government\";s:5:\"value\";s:10:\"Government\";}i:16;a:2:{s:5:\"label\";s:10:\"Healthcare\";s:5:\"value\";s:10:\"Healthcare\";}i:17;a:2:{s:5:\"label\";s:11:\"Hospitality\";s:5:\"value\";s:11:\"Hospitality\";}i:18;a:2:{s:5:\"label\";s:9:\"Insurance\";s:5:\"value\";s:9:\"Insurance\";}i:19;a:2:{s:5:\"label\";s:9:\"Machinery\";s:5:\"value\";s:9:\"Machinery\";}i:20;a:2:{s:5:\"label\";s:13:\"Manufacturing\";s:5:\"value\";s:13:\"Manufacturing\";}i:21;a:2:{s:5:\"label\";s:5:\"Media\";s:5:\"value\";s:5:\"Media\";}i:22;a:2:{s:5:\"label\";s:14:\"Not for Profit\";s:5:\"value\";s:14:\"Not for Profit\";}i:23;a:2:{s:5:\"label\";s:10:\"Recreation\";s:5:\"value\";s:10:\"Recreation\";}i:24;a:2:{s:5:\"label\";s:6:\"Retail\";s:5:\"value\";s:6:\"Retail\";}i:25;a:2:{s:5:\"label\";s:8:\"Shipping\";s:5:\"value\";s:8:\"Shipping\";}i:26;a:2:{s:5:\"label\";s:10:\"Technology\";s:5:\"value\";s:10:\"Technology\";}i:27;a:2:{s:5:\"label\";s:18:\"Telecommunications\";s:5:\"value\";s:18:\"Telecommunications\";}i:28;a:2:{s:5:\"label\";s:14:\"Transportation\";s:5:\"value\";s:14:\"Transportation\";}i:29;a:2:{s:5:\"label\";s:9:\"Utilities\";s:5:\"value\";s:9:\"Utilities\";}i:30;a:2:{s:5:\"label\";s:5:\"Other\";s:5:\"value\";s:5:\"Other\";}}}');
INSERT INTO `mautic_lead_fields` VALUES ('43', '1', null, null, null, null, null, null, null, null, null, 'Description', 'companydescription', 'text', 'professional', null, '0', '1', '1', '0', '1', '0', '0', '15', 'company', 'a:0:{}');

-- ----------------------------
-- Table structure for mautic_lead_frequencyrules
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_frequencyrules`;
CREATE TABLE `mautic_lead_frequencyrules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `frequency_number` smallint(6) DEFAULT NULL,
  `frequency_time` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preferred_channel` tinyint(1) NOT NULL,
  `pause_from_date` datetime DEFAULT NULL,
  `pause_to_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6267F0455458D` (`lead_id`),
  KEY `mautic_channel_frequency` (`channel`),
  CONSTRAINT `FK_B6267F0455458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_frequencyrules
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_lead_ips_xref
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_ips_xref`;
CREATE TABLE `mautic_lead_ips_xref` (
  `lead_id` bigint(20) unsigned NOT NULL,
  `ip_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lead_id`,`ip_id`),
  KEY `IDX_47BF800655458D` (`lead_id`),
  KEY `IDX_47BF8006A03F5E9F` (`ip_id`),
  CONSTRAINT `FK_47BF800655458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_47BF8006A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_ips_xref
-- ----------------------------
INSERT INTO `mautic_lead_ips_xref` VALUES ('1', '1');
INSERT INTO `mautic_lead_ips_xref` VALUES ('2', '1');

-- ----------------------------
-- Table structure for mautic_lead_lists
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_lists`;
CREATE TABLE `mautic_lead_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filters` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `is_global` tinyint(1) NOT NULL,
  `is_preference_center` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_lists
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_lead_lists_leads
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_lists_leads`;
CREATE TABLE `mautic_lead_lists_leads` (
  `leadlist_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  PRIMARY KEY (`leadlist_id`,`lead_id`),
  KEY `IDX_B2794B6EB9FC8874` (`leadlist_id`),
  KEY `IDX_B2794B6E55458D` (`lead_id`),
  KEY `mautic_manually_removed` (`manually_removed`),
  CONSTRAINT `FK_B2794B6E55458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B2794B6EB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `mautic_lead_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_lists_leads
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_lead_notes
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_notes`;
CREATE TABLE `mautic_lead_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_401F051755458D` (`lead_id`),
  CONSTRAINT `FK_401F051755458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_notes
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_lead_points_change_log
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_points_change_log`;
CREATE TABLE `mautic_lead_points_change_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `ip_id` int(10) unsigned NOT NULL,
  `type` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delta` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A3651E6955458D` (`lead_id`),
  KEY `IDX_A3651E69A03F5E9F` (`ip_id`),
  KEY `mautic_point_date_added` (`date_added`),
  CONSTRAINT `FK_A3651E6955458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A3651E69A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_points_change_log
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_lead_stages_change_log
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_stages_change_log`;
CREATE TABLE `mautic_lead_stages_change_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `stage_id` int(10) unsigned DEFAULT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_444D1C5655458D` (`lead_id`),
  KEY `IDX_444D1C562298D193` (`stage_id`),
  CONSTRAINT `FK_444D1C562298D193` FOREIGN KEY (`stage_id`) REFERENCES `mautic_stages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_444D1C5655458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_stages_change_log
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_lead_tags
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_tags`;
CREATE TABLE `mautic_lead_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mautic_lead_tag_search` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_tags
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_lead_tags_xref
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_tags_xref`;
CREATE TABLE `mautic_lead_tags_xref` (
  `lead_id` bigint(20) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lead_id`,`tag_id`),
  KEY `IDX_BF8E2D1055458D` (`lead_id`),
  KEY `IDX_BF8E2D10BAD26311` (`tag_id`),
  CONSTRAINT `FK_BF8E2D1055458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BF8E2D10BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `mautic_lead_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_tags_xref
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_lead_utmtags
-- ----------------------------
DROP TABLE IF EXISTS `mautic_lead_utmtags`;
CREATE TABLE `mautic_lead_utmtags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `remote_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci,
  `user_agent` longtext COLLATE utf8mb4_unicode_ci,
  `utm_campaign` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_41BF776455458D` (`lead_id`),
  CONSTRAINT `FK_41BF776455458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_lead_utmtags
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_messages
-- ----------------------------
DROP TABLE IF EXISTS `mautic_messages`;
CREATE TABLE `mautic_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FA2477DD12469DE2` (`category_id`),
  KEY `mautic_date_message_added` (`date_added`),
  CONSTRAINT `FK_FA2477DD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_messages
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_message_channels
-- ----------------------------
DROP TABLE IF EXISTS `mautic_message_channels`;
CREATE TABLE `mautic_message_channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `properties` json NOT NULL COMMENT '(DC2Type:json_array)',
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mautic_channel_index` (`message_id`,`channel`),
  KEY `IDX_BDBF11B5537A1329` (`message_id`),
  KEY `mautic_channel_entity_index` (`channel`,`channel_id`),
  KEY `mautic_channel_enabled_index` (`channel`,`is_enabled`),
  CONSTRAINT `FK_BDBF11B5537A1329` FOREIGN KEY (`message_id`) REFERENCES `mautic_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_message_channels
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_message_queue
-- ----------------------------
DROP TABLE IF EXISTS `mautic_message_queue`;
CREATE TABLE `mautic_message_queue` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int(11) NOT NULL,
  `priority` smallint(6) NOT NULL,
  `max_attempts` smallint(6) NOT NULL,
  `attempts` smallint(6) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_published` datetime DEFAULT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `last_attempt` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_59097EE871F7E88B` (`event_id`),
  KEY `IDX_59097EE855458D` (`lead_id`),
  KEY `mautic_message_status_search` (`status`),
  KEY `mautic_message_date_sent` (`date_sent`),
  KEY `mautic_message_scheduled_date` (`scheduled_date`),
  KEY `mautic_message_priority` (`priority`),
  KEY `mautic_message_success` (`success`),
  KEY `mautic_message_channel_search` (`channel`,`channel_id`),
  CONSTRAINT `FK_59097EE855458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_59097EE871F7E88B` FOREIGN KEY (`event_id`) REFERENCES `mautic_campaign_events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_message_queue
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_monitoring
-- ----------------------------
DROP TABLE IF EXISTS `mautic_monitoring`;
CREATE TABLE `mautic_monitoring` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `lists` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `network_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision` int(11) NOT NULL,
  `stats` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `properties` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9DACF94912469DE2` (`category_id`),
  CONSTRAINT `FK_9DACF94912469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_monitoring
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_monitoring_leads
-- ----------------------------
DROP TABLE IF EXISTS `mautic_monitoring_leads`;
CREATE TABLE `mautic_monitoring_leads` (
  `monitor_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`monitor_id`,`lead_id`),
  KEY `IDX_2AD4D584CE1C902` (`monitor_id`),
  KEY `IDX_2AD4D5855458D` (`lead_id`),
  CONSTRAINT `FK_2AD4D584CE1C902` FOREIGN KEY (`monitor_id`) REFERENCES `mautic_monitoring` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2AD4D5855458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_monitoring_leads
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_monitor_post_count
-- ----------------------------
DROP TABLE IF EXISTS `mautic_monitor_post_count`;
CREATE TABLE `mautic_monitor_post_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned DEFAULT NULL,
  `post_date` date NOT NULL,
  `post_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_23E5B29B4CE1C902` (`monitor_id`),
  CONSTRAINT `FK_23E5B29B4CE1C902` FOREIGN KEY (`monitor_id`) REFERENCES `mautic_monitoring` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_monitor_post_count
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_notifications
-- ----------------------------
DROP TABLE IF EXISTS `mautic_notifications`;
CREATE TABLE `mautic_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B9524EB3A76ED395` (`user_id`),
  KEY `mautic_notification_read_status` (`is_read`),
  KEY `mautic_notification_type` (`type`),
  KEY `mautic_notification_user_read_status` (`is_read`,`user_id`),
  CONSTRAINT `FK_B9524EB3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `mautic_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_notifications
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_oauth1_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `mautic_oauth1_access_tokens`;
CREATE TABLE `mautic_oauth1_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumer_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7E9B965637FDBD6D` (`consumer_id`),
  KEY `IDX_7E9B9656A76ED395` (`user_id`),
  KEY `mautic_oauth1_access_token_search` (`token`),
  CONSTRAINT `FK_7E9B965637FDBD6D` FOREIGN KEY (`consumer_id`) REFERENCES `mautic_oauth1_consumers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7E9B9656A76ED395` FOREIGN KEY (`user_id`) REFERENCES `mautic_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_oauth1_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_oauth1_consumers
-- ----------------------------
DROP TABLE IF EXISTS `mautic_oauth1_consumers`;
CREATE TABLE `mautic_oauth1_consumers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `callback` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mautic_consumer_search` (`consumer_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_oauth1_consumers
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_oauth1_nonces
-- ----------------------------
DROP TABLE IF EXISTS `mautic_oauth1_nonces`;
CREATE TABLE `mautic_oauth1_nonces` (
  `nonce` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_oauth1_nonces
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_oauth1_request_tokens
-- ----------------------------
DROP TABLE IF EXISTS `mautic_oauth1_request_tokens`;
CREATE TABLE `mautic_oauth1_request_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumer_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `verifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A1FA930137FDBD6D` (`consumer_id`),
  KEY `IDX_A1FA9301A76ED395` (`user_id`),
  KEY `mautic_oauth1_request_token_search` (`token`),
  CONSTRAINT `FK_A1FA930137FDBD6D` FOREIGN KEY (`consumer_id`) REFERENCES `mautic_oauth1_consumers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A1FA9301A76ED395` FOREIGN KEY (`user_id`) REFERENCES `mautic_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_oauth1_request_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_oauth2_accesstokens
-- ----------------------------
DROP TABLE IF EXISTS `mautic_oauth2_accesstokens`;
CREATE TABLE `mautic_oauth2_accesstokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` bigint(20) DEFAULT NULL,
  `scope` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_26B4E2AA5F37A13B` (`token`),
  KEY `IDX_26B4E2AA19EB6921` (`client_id`),
  KEY `IDX_26B4E2AAA76ED395` (`user_id`),
  KEY `mautic_oauth2_access_token_search` (`token`),
  CONSTRAINT `FK_26B4E2AA19EB6921` FOREIGN KEY (`client_id`) REFERENCES `mautic_oauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_26B4E2AAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `mautic_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_oauth2_accesstokens
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_oauth2_authcodes
-- ----------------------------
DROP TABLE IF EXISTS `mautic_oauth2_authcodes`;
CREATE TABLE `mautic_oauth2_authcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` bigint(20) DEFAULT NULL,
  `scope` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9539B3695F37A13B` (`token`),
  KEY `IDX_9539B36919EB6921` (`client_id`),
  KEY `IDX_9539B369A76ED395` (`user_id`),
  CONSTRAINT `FK_9539B36919EB6921` FOREIGN KEY (`client_id`) REFERENCES `mautic_oauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9539B369A76ED395` FOREIGN KEY (`user_id`) REFERENCES `mautic_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_oauth2_authcodes
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_oauth2_clients
-- ----------------------------
DROP TABLE IF EXISTS `mautic_oauth2_clients`;
CREATE TABLE `mautic_oauth2_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `random_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `allowed_grant_types` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `mautic_client_id_search` (`random_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_oauth2_clients
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_oauth2_refreshtokens
-- ----------------------------
DROP TABLE IF EXISTS `mautic_oauth2_refreshtokens`;
CREATE TABLE `mautic_oauth2_refreshtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` bigint(20) DEFAULT NULL,
  `scope` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8F2D052F5F37A13B` (`token`),
  KEY `IDX_8F2D052F19EB6921` (`client_id`),
  KEY `IDX_8F2D052FA76ED395` (`user_id`),
  KEY `mautic_oauth2_refresh_token_search` (`token`),
  CONSTRAINT `FK_8F2D052F19EB6921` FOREIGN KEY (`client_id`) REFERENCES `mautic_oauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8F2D052FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `mautic_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_oauth2_refreshtokens
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_oauth2_user_client_xref
-- ----------------------------
DROP TABLE IF EXISTS `mautic_oauth2_user_client_xref`;
CREATE TABLE `mautic_oauth2_user_client_xref` (
  `client_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`client_id`,`user_id`),
  KEY `IDX_BC68EA4619EB6921` (`client_id`),
  KEY `IDX_BC68EA46A76ED395` (`user_id`),
  CONSTRAINT `FK_BC68EA4619EB6921` FOREIGN KEY (`client_id`) REFERENCES `mautic_oauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BC68EA46A76ED395` FOREIGN KEY (`user_id`) REFERENCES `mautic_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_oauth2_user_client_xref
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_pages
-- ----------------------------
DROP TABLE IF EXISTS `mautic_pages`;
CREATE TABLE `mautic_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `translation_parent_id` int(10) unsigned DEFAULT NULL,
  `variant_parent_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_html` longtext COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `unique_hits` int(11) NOT NULL,
  `variant_hits` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_preference_center` tinyint(1) DEFAULT NULL,
  `no_index` tinyint(1) DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_settings` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `variant_start_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8F297BD612469DE2` (`category_id`),
  KEY `IDX_8F297BD69091A2FB` (`translation_parent_id`),
  KEY `IDX_8F297BD691861123` (`variant_parent_id`),
  KEY `mautic_page_alias_search` (`alias`),
  CONSTRAINT `FK_8F297BD612469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_8F297BD69091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `mautic_pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8F297BD691861123` FOREIGN KEY (`variant_parent_id`) REFERENCES `mautic_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_pages
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_page_hits
-- ----------------------------
DROP TABLE IF EXISTS `mautic_page_hits`;
CREATE TABLE `mautic_page_hits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned DEFAULT NULL,
  `redirect_id` bigint(20) unsigned DEFAULT NULL,
  `email_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned NOT NULL,
  `device_id` bigint(20) unsigned DEFAULT NULL,
  `date_hit` datetime NOT NULL,
  `date_left` datetime DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` int(11) NOT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `url` longtext COLLATE utf8mb4_unicode_ci,
  `url_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` longtext COLLATE utf8mb4_unicode_ci,
  `remote_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_languages` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_7C64CE80C4663E4` (`page_id`),
  KEY `IDX_7C64CE80B42D874D` (`redirect_id`),
  KEY `IDX_7C64CE80A832C1C9` (`email_id`),
  KEY `IDX_7C64CE8055458D` (`lead_id`),
  KEY `IDX_7C64CE80A03F5E9F` (`ip_id`),
  KEY `IDX_7C64CE8094A4C7D4` (`device_id`),
  KEY `mautic_page_hit_tracking_search` (`tracking_id`),
  KEY `mautic_page_hit_code_search` (`code`),
  KEY `mautic_page_hit_source_search` (`source`,`source_id`),
  KEY `mautic_date_hit_left_index` (`date_hit`,`date_left`),
  KEY `mautic_page_hit_url` (`url`(128)),
  CONSTRAINT `FK_7C64CE8055458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_7C64CE8094A4C7D4` FOREIGN KEY (`device_id`) REFERENCES `mautic_lead_devices` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_7C64CE80A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`),
  CONSTRAINT `FK_7C64CE80A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `mautic_emails` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_7C64CE80B42D874D` FOREIGN KEY (`redirect_id`) REFERENCES `mautic_page_redirects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_7C64CE80C4663E4` FOREIGN KEY (`page_id`) REFERENCES `mautic_pages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_page_hits
-- ----------------------------
INSERT INTO `mautic_page_hits` VALUES ('1', null, null, null, '1', '1', '1', '2020-11-10 06:15:34', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', 'dab8zs8gjs6vz3yz7yxzjd4', null, null, 'a:9:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";}');
INSERT INTO `mautic_page_hits` VALUES ('2', null, null, null, '2', '1', '2', '2020-11-10 06:15:58', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:9:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";}');
INSERT INTO `mautic_page_hits` VALUES ('3', null, null, null, '2', '1', '2', '2020-11-10 06:16:13', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('4', null, null, null, '2', '1', '2', '2020-11-10 06:16:14', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('5', null, null, null, '2', '1', '2', '2020-11-10 06:17:12', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('6', null, null, null, '2', '1', '2', '2020-11-10 06:50:26', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('7', null, null, null, '2', '1', '2', '2020-11-10 06:50:27', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('8', null, null, null, '2', '1', '2', '2020-11-10 07:01:32', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('9', null, null, null, '2', '1', '2', '2020-11-10 07:11:05', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('10', null, null, null, '2', '1', '2', '2020-11-10 07:17:12', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('11', null, null, null, '2', '1', '2', '2020-11-10 07:23:05', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('12', null, null, null, '2', '1', '2', '2020-11-10 07:23:06', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('13', null, null, null, '2', '1', '2', '2020-11-10 07:24:36', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('14', null, null, null, '2', '1', '2', '2020-11-10 07:28:28', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('15', null, null, null, '2', '1', '2', '2020-11-10 07:33:48', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('16', null, null, null, '2', '1', '2', '2020-11-10 07:59:52', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('17', null, null, null, '2', '1', '2', '2020-11-10 08:01:19', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('18', null, null, null, '2', '1', '2', '2020-11-10 08:01:21', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('19', null, null, null, '2', '1', '2', '2020-11-11 01:57:00', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('20', null, null, null, '2', '1', '2', '2020-11-11 01:57:02', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('21', null, null, null, '2', '1', '2', '2020-11-11 05:42:10', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');
INSERT INTO `mautic_page_hits` VALUES ('22', null, null, null, '2', '1', '2', '2020-11-11 05:54:50', null, '', '', '', '', '', '200', 'http://test.localhost.com/', 'http://test.localhost.com/index.html', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', null, 'zh-CN', 'a:5:{i:0;s:5:\"zh-CN\";i:1;s:8:\"zh;q=0.9\";i:2;s:8:\"en;q=0.8\";i:3;s:8:\"ko;q=0.7\";i:4;s:11:\"zh-HK;q=0.6\";}', '0wijehagy48hcj25v8tcc65', null, null, 'a:10:{s:10:\"page_title\";s:0:\"\";s:13:\"page_language\";s:5:\"zh-CN\";s:13:\"page_referrer\";s:0:\"\";s:8:\"page_url\";s:36:\"http://test.localhost.com/index.html\";s:7:\"counter\";s:1:\"0\";s:15:\"timezone_offset\";s:4:\"-480\";s:10:\"resolution\";s:9:\"1920x1080\";s:8:\"platform\";s:7:\"Windows\";s:12:\"do_not_track\";s:5:\"false\";s:16:\"mautic_device_id\";s:23:\"0wijehagy48hcj25v8tcc65\";}');

-- ----------------------------
-- Table structure for mautic_page_redirects
-- ----------------------------
DROP TABLE IF EXISTS `mautic_page_redirects`;
CREATE TABLE `mautic_page_redirects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(11) NOT NULL,
  `unique_hits` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_page_redirects
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_permissions
-- ----------------------------
DROP TABLE IF EXISTS `mautic_permissions`;
CREATE TABLE `mautic_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `bundle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bitwise` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mautic_unique_perm` (`bundle`,`name`,`role_id`),
  KEY `IDX_3710FB7CD60322AC` (`role_id`),
  CONSTRAINT `FK_3710FB7CD60322AC` FOREIGN KEY (`role_id`) REFERENCES `mautic_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_plugins
-- ----------------------------
DROP TABLE IF EXISTS `mautic_plugins`;
CREATE TABLE `mautic_plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `is_missing` tinyint(1) NOT NULL,
  `bundle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mautic_unique_bundle` (`bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_plugin_citrix_events
-- ----------------------------
DROP TABLE IF EXISTS `mautic_plugin_citrix_events`;
CREATE TABLE `mautic_plugin_citrix_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `product` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B0D62D2455458D` (`lead_id`),
  KEY `mautic_citrix_event_email` (`product`,`email`),
  KEY `mautic_citrix_event_name` (`product`,`event_name`,`event_type`),
  KEY `mautic_citrix_event_type` (`product`,`event_type`,`event_date`),
  KEY `mautic_citrix_event_product` (`product`,`email`,`event_type`),
  KEY `mautic_citrix_event_product_name` (`product`,`email`,`event_type`,`event_name`),
  KEY `mautic_citrix_event_product_name_lead` (`product`,`event_type`,`event_name`,`lead_id`),
  KEY `mautic_citrix_event_product_type_lead` (`product`,`event_type`,`lead_id`),
  KEY `mautic_citrix_event_date` (`event_date`),
  CONSTRAINT `FK_B0D62D2455458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_plugin_citrix_events
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_plugin_crm_pipedrive_owners
-- ----------------------------
DROP TABLE IF EXISTS `mautic_plugin_crm_pipedrive_owners`;
CREATE TABLE `mautic_plugin_crm_pipedrive_owners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mautic_email` (`email`),
  KEY `mautic_owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_plugin_crm_pipedrive_owners
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_plugin_integration_settings
-- ----------------------------
DROP TABLE IF EXISTS `mautic_plugin_integration_settings`;
CREATE TABLE `mautic_plugin_integration_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `supported_features` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `api_keys` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `feature_settings` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_5CEDE447EC942BCF` (`plugin_id`),
  CONSTRAINT `FK_5CEDE447EC942BCF` FOREIGN KEY (`plugin_id`) REFERENCES `mautic_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_plugin_integration_settings
-- ----------------------------
INSERT INTO `mautic_plugin_integration_settings` VALUES ('1', null, 'OneSignal', '0', 'a:4:{i:0;s:6:\"mobile\";i:1;s:20:\"landing_page_enabled\";i:2;s:28:\"welcome_notification_enabled\";i:3;s:21:\"tracking_page_enabled\";}', 'a:0:{}', 'a:0:{}');
INSERT INTO `mautic_plugin_integration_settings` VALUES ('2', null, 'Twilio', '0', 'a:0:{}', 'a:0:{}', 'a:0:{}');

-- ----------------------------
-- Table structure for mautic_points
-- ----------------------------
DROP TABLE IF EXISTS `mautic_points`;
CREATE TABLE `mautic_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `repeatable` tinyint(1) NOT NULL,
  `delta` int(11) NOT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_68CA21E512469DE2` (`category_id`),
  KEY `mautic_point_type_search` (`type`),
  CONSTRAINT `FK_68CA21E512469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_points
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_point_lead_action_log
-- ----------------------------
DROP TABLE IF EXISTS `mautic_point_lead_action_log`;
CREATE TABLE `mautic_point_lead_action_log` (
  `point_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_fired` datetime NOT NULL,
  PRIMARY KEY (`point_id`,`lead_id`),
  KEY `IDX_4CF01FBDC028CEA2` (`point_id`),
  KEY `IDX_4CF01FBD55458D` (`lead_id`),
  KEY `IDX_4CF01FBDA03F5E9F` (`ip_id`),
  CONSTRAINT `FK_4CF01FBD55458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4CF01FBDA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`),
  CONSTRAINT `FK_4CF01FBDC028CEA2` FOREIGN KEY (`point_id`) REFERENCES `mautic_points` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_point_lead_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_point_lead_event_log
-- ----------------------------
DROP TABLE IF EXISTS `mautic_point_lead_event_log`;
CREATE TABLE `mautic_point_lead_event_log` (
  `event_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_fired` datetime NOT NULL,
  PRIMARY KEY (`event_id`,`lead_id`),
  KEY `IDX_7F02E38E71F7E88B` (`event_id`),
  KEY `IDX_7F02E38E55458D` (`lead_id`),
  KEY `IDX_7F02E38EA03F5E9F` (`ip_id`),
  CONSTRAINT `FK_7F02E38E55458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7F02E38E71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `mautic_point_trigger_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7F02E38EA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_point_lead_event_log
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_point_triggers
-- ----------------------------
DROP TABLE IF EXISTS `mautic_point_triggers`;
CREATE TABLE `mautic_point_triggers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `points` int(11) NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trigger_existing_leads` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D1C0E08912469DE2` (`category_id`),
  CONSTRAINT `FK_D1C0E08912469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_point_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_point_trigger_events
-- ----------------------------
DROP TABLE IF EXISTS `mautic_point_trigger_events`;
CREATE TABLE `mautic_point_trigger_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trigger_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_order` int(11) NOT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_B0F7376C5FDDDCD6` (`trigger_id`),
  KEY `mautic_trigger_type_search` (`type`),
  CONSTRAINT `FK_B0F7376C5FDDDCD6` FOREIGN KEY (`trigger_id`) REFERENCES `mautic_point_triggers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_point_trigger_events
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_push_ids
-- ----------------------------
DROP TABLE IF EXISTS `mautic_push_ids`;
CREATE TABLE `mautic_push_ids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `push_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `mobile` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6E05FAA355458D` (`lead_id`),
  CONSTRAINT `FK_6E05FAA355458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_push_ids
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_push_notifications
-- ----------------------------
DROP TABLE IF EXISTS `mautic_push_notifications`;
CREATE TABLE `mautic_push_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci,
  `heading` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `button` longtext COLLATE utf8mb4_unicode_ci,
  `utm_tags` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `notification_type` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `read_count` int(11) NOT NULL,
  `sent_count` int(11) NOT NULL,
  `mobile` tinyint(1) NOT NULL,
  `mobileSettings` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_9BD2EC1E12469DE2` (`category_id`),
  CONSTRAINT `FK_9BD2EC1E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_push_notifications
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_push_notification_list_xref
-- ----------------------------
DROP TABLE IF EXISTS `mautic_push_notification_list_xref`;
CREATE TABLE `mautic_push_notification_list_xref` (
  `notification_id` int(10) unsigned NOT NULL,
  `leadlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`notification_id`,`leadlist_id`),
  KEY `IDX_8FCED148EF1A9D84` (`notification_id`),
  KEY `IDX_8FCED148B9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_8FCED148B9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `mautic_lead_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8FCED148EF1A9D84` FOREIGN KEY (`notification_id`) REFERENCES `mautic_push_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_push_notification_list_xref
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_push_notification_stats
-- ----------------------------
DROP TABLE IF EXISTS `mautic_push_notification_stats`;
CREATE TABLE `mautic_push_notification_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `list_id` int(10) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `is_clicked` tinyint(1) NOT NULL,
  `date_clicked` datetime DEFAULT NULL,
  `tracking_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `tokens` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `click_count` int(11) DEFAULT NULL,
  `last_clicked` datetime DEFAULT NULL,
  `click_details` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_78E8C70BEF1A9D84` (`notification_id`),
  KEY `IDX_78E8C70B55458D` (`lead_id`),
  KEY `IDX_78E8C70B3DAE168B` (`list_id`),
  KEY `IDX_78E8C70BA03F5E9F` (`ip_id`),
  KEY `mautic_stat_notification_search` (`notification_id`,`lead_id`),
  KEY `mautic_stat_notification_clicked_search` (`is_clicked`),
  KEY `mautic_stat_notification_hash_search` (`tracking_hash`),
  KEY `mautic_stat_notification_source_search` (`source`,`source_id`),
  CONSTRAINT `FK_78E8C70B3DAE168B` FOREIGN KEY (`list_id`) REFERENCES `mautic_lead_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_78E8C70B55458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_78E8C70BA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`),
  CONSTRAINT `FK_78E8C70BEF1A9D84` FOREIGN KEY (`notification_id`) REFERENCES `mautic_push_notifications` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_push_notification_stats
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_reports
-- ----------------------------
DROP TABLE IF EXISTS `mautic_reports`;
CREATE TABLE `mautic_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `system` tinyint(1) NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `columns` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `filters` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `table_order` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `graphs` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `group_by` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `aggregators` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `settings` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_scheduled` tinyint(1) NOT NULL,
  `schedule_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_day` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_month_frequency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_reports
-- ----------------------------
INSERT INTO `mautic_reports` VALUES ('1', '1', null, null, null, '2020-11-10 03:17:07', '1', 'jia haorui', null, null, 'jia haorui', 'Visits published Pages', null, '1', 'page.hits', 'a:7:{i:0;s:11:\"ph.date_hit\";i:1;s:6:\"ph.url\";i:2;s:12:\"ph.url_title\";i:3;s:10:\"ph.referer\";i:4;s:12:\"i.ip_address\";i:5;s:7:\"ph.city\";i:6;s:10:\"ph.country\";}', 'a:2:{i:0;a:5:{s:6:\"column\";s:7:\"ph.code\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:3:\"200\";s:4:\"glue\";s:3:\"and\";s:7:\"dynamic\";N;}i:1;a:5:{s:6:\"column\";s:14:\"p.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";s:4:\"glue\";s:3:\"and\";s:7:\"dynamic\";N;}}', 'a:1:{i:0;a:2:{s:6:\"column\";s:11:\"ph.date_hit\";s:9:\"direction\";s:3:\"ASC\";}}', 'a:9:{i:0;s:35:\"mautic.page.graph.line.time.on.site\";i:1;s:37:\"mautic.page.table.most.visited.unique\";i:2;s:30:\"mautic.page.table.most.visited\";i:3;s:38:\"mautic.page.graph.pie.new.vs.returning\";i:4;s:27:\"mautic.page.graph.line.hits\";i:5;s:31:\"mautic.page.graph.pie.languages\";i:6;s:34:\"mautic.page.graph.pie.time.on.site\";i:7;s:29:\"mautic.page.graph.pie.devices\";i:8;s:27:\"mautic.page.table.referrers\";}', 'a:31:{i:0;s:7:\"l.email\";i:1;s:10:\"l.facebook\";i:2;s:5:\"l.fax\";i:3;s:11:\"l.firstname\";i:4;s:12:\"l.foursquare\";i:5;s:4:\"l.id\";i:6;s:11:\"l.instagram\";i:7;s:10:\"l.lastname\";i:8;s:10:\"l.linkedin\";i:9;s:7:\"l.phone\";i:10;s:8:\"l.points\";i:11;s:10:\"l.position\";i:12;s:18:\"l.preferred_locale\";i:13;s:10:\"l.timezone\";i:14;s:9:\"l.company\";i:15;s:7:\"l.skype\";i:16;s:7:\"l.state\";i:17;s:7:\"l.title\";i:18;s:9:\"l.twitter\";i:19;s:9:\"l.website\";i:20;s:9:\"l.zipcode\";i:21;s:8:\"l.mobile\";i:22;s:25:\"companies_lead.date_added\";i:23;s:12:\"p.date_added\";i:24;s:11:\"ph.date_hit\";i:25;s:15:\"p.date_modified\";i:26;s:12:\"ph.date_left\";i:27;s:6:\"ph.isp\";i:28;s:6:\"ph.url\";i:29;s:20:\"ph.browser_languages\";i:30;s:7:\"ph.city\";}', 'a:0:{}', '{\"showDynamicFilters\": 0, \"hideDateRangeFilter\": 0, \"showGraphsAboveTable\": 1}', '0', null, null, null, null);
INSERT INTO `mautic_reports` VALUES ('2', '1', null, null, null, null, null, null, null, null, null, 'Downloads of all Assets', null, '1', 'asset.downloads', 'a:7:{i:0;s:16:\"ad.date_download\";i:1;s:7:\"a.title\";i:2;s:12:\"i.ip_address\";i:3;s:11:\"l.firstname\";i:4;s:10:\"l.lastname\";i:5;s:7:\"l.email\";i:6;s:4:\"a.id\";}', 'a:1:{i:0;a:3:{s:6:\"column\";s:14:\"a.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}', 'a:1:{i:0;a:2:{s:6:\"column\";s:16:\"ad.date_download\";s:9:\"direction\";s:3:\"ASC\";}}', 'a:4:{i:0;s:33:\"mautic.asset.graph.line.downloads\";i:1;s:31:\"mautic.asset.graph.pie.statuses\";i:2;s:34:\"mautic.asset.table.most.downloaded\";i:3;s:32:\"mautic.asset.table.top.referrers\";}', 'a:0:{}', 'a:0:{}', '[]', '0', null, null, null, null);
INSERT INTO `mautic_reports` VALUES ('3', '1', null, null, null, null, null, null, null, null, null, 'Submissions of published Forms', null, '1', 'form.submissions', 'a:0:{}', 'a:1:{i:1;a:3:{s:6:\"column\";s:14:\"f.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}', 'a:0:{}', 'a:3:{i:0;s:34:\"mautic.form.graph.line.submissions\";i:1;s:32:\"mautic.form.table.most.submitted\";i:2;s:31:\"mautic.form.table.top.referrers\";}', 'a:0:{}', 'a:0:{}', '[]', '0', null, null, null, null);
INSERT INTO `mautic_reports` VALUES ('4', '1', null, null, null, null, null, null, null, null, null, 'All Emails', null, '1', 'email.stats', 'a:5:{i:0;s:12:\"es.date_sent\";i:1;s:12:\"es.date_read\";i:2;s:9:\"e.subject\";i:3;s:16:\"es.email_address\";i:4;s:4:\"e.id\";}', 'a:1:{i:0;a:3:{s:6:\"column\";s:14:\"e.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}', 'a:1:{i:0;a:2:{s:6:\"column\";s:12:\"es.date_sent\";s:9:\"direction\";s:3:\"ASC\";}}', 'a:6:{i:0;s:29:\"mautic.email.graph.line.stats\";i:1;s:42:\"mautic.email.graph.pie.ignored.read.failed\";i:2;s:35:\"mautic.email.table.most.emails.read\";i:3;s:35:\"mautic.email.table.most.emails.sent\";i:4;s:43:\"mautic.email.table.most.emails.read.percent\";i:5;s:37:\"mautic.email.table.most.emails.failed\";}', 'a:0:{}', 'a:0:{}', '[]', '0', null, null, null, null);
INSERT INTO `mautic_reports` VALUES ('5', '1', null, null, null, null, null, null, null, null, null, 'Leads and Points', null, '1', 'lead.pointlog', 'a:7:{i:0;s:13:\"lp.date_added\";i:1;s:7:\"lp.type\";i:2;s:13:\"lp.event_name\";i:3;s:11:\"l.firstname\";i:4;s:10:\"l.lastname\";i:5;s:7:\"l.email\";i:6;s:8:\"lp.delta\";}', 'a:0:{}', 'a:1:{i:0;a:2:{s:6:\"column\";s:13:\"lp.date_added\";s:9:\"direction\";s:3:\"ASC\";}}', 'a:6:{i:0;s:29:\"mautic.lead.graph.line.points\";i:1;s:29:\"mautic.lead.table.most.points\";i:2;s:29:\"mautic.lead.table.top.actions\";i:3;s:28:\"mautic.lead.table.top.cities\";i:4;s:31:\"mautic.lead.table.top.countries\";i:5;s:28:\"mautic.lead.table.top.events\";}', 'a:0:{}', 'a:0:{}', '[]', '0', null, null, null, null);

-- ----------------------------
-- Table structure for mautic_reports_schedulers
-- ----------------------------
DROP TABLE IF EXISTS `mautic_reports_schedulers`;
CREATE TABLE `mautic_reports_schedulers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(10) unsigned NOT NULL,
  `schedule_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_70534E94BD2A4C0` (`report_id`),
  CONSTRAINT `FK_70534E94BD2A4C0` FOREIGN KEY (`report_id`) REFERENCES `mautic_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_reports_schedulers
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_roles
-- ----------------------------
DROP TABLE IF EXISTS `mautic_roles`;
CREATE TABLE `mautic_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `is_admin` tinyint(1) NOT NULL,
  `readable_permissions` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_roles
-- ----------------------------
INSERT INTO `mautic_roles` VALUES ('1', '1', null, null, null, null, null, null, null, null, null, 'Administrator', 'Full system access', '1', 'N;');

-- ----------------------------
-- Table structure for mautic_saml_id_entry
-- ----------------------------
DROP TABLE IF EXISTS `mautic_saml_id_entry`;
CREATE TABLE `mautic_saml_id_entry` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiryTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_saml_id_entry
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_sms_messages
-- ----------------------------
DROP TABLE IF EXISTS `mautic_sms_messages`;
CREATE TABLE `mautic_sms_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_type` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `sent_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3950837E12469DE2` (`category_id`),
  CONSTRAINT `FK_3950837E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_sms_messages
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_sms_message_list_xref
-- ----------------------------
DROP TABLE IF EXISTS `mautic_sms_message_list_xref`;
CREATE TABLE `mautic_sms_message_list_xref` (
  `sms_id` int(10) unsigned NOT NULL,
  `leadlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sms_id`,`leadlist_id`),
  KEY `IDX_913BA9C5BD5C7E60` (`sms_id`),
  KEY `IDX_913BA9C5B9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_913BA9C5B9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `mautic_lead_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_913BA9C5BD5C7E60` FOREIGN KEY (`sms_id`) REFERENCES `mautic_sms_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_sms_message_list_xref
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_sms_message_stats
-- ----------------------------
DROP TABLE IF EXISTS `mautic_sms_message_stats`;
CREATE TABLE `mautic_sms_message_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sms_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `list_id` int(10) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `tracking_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `tokens` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_FC1F4696BD5C7E60` (`sms_id`),
  KEY `IDX_FC1F469655458D` (`lead_id`),
  KEY `IDX_FC1F46963DAE168B` (`list_id`),
  KEY `IDX_FC1F4696A03F5E9F` (`ip_id`),
  KEY `mautic_stat_sms_search` (`sms_id`,`lead_id`),
  KEY `mautic_stat_sms_hash_search` (`tracking_hash`),
  KEY `mautic_stat_sms_source_search` (`source`,`source_id`),
  CONSTRAINT `FK_FC1F46963DAE168B` FOREIGN KEY (`list_id`) REFERENCES `mautic_lead_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_FC1F469655458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_FC1F4696A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`),
  CONSTRAINT `FK_FC1F4696BD5C7E60` FOREIGN KEY (`sms_id`) REFERENCES `mautic_sms_messages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_sms_message_stats
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_stages
-- ----------------------------
DROP TABLE IF EXISTS `mautic_stages`;
CREATE TABLE `mautic_stages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `weight` int(11) NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_60D2C5A812469DE2` (`category_id`),
  CONSTRAINT `FK_60D2C5A812469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_stages
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_stage_lead_action_log
-- ----------------------------
DROP TABLE IF EXISTS `mautic_stage_lead_action_log`;
CREATE TABLE `mautic_stage_lead_action_log` (
  `stage_id` int(10) unsigned NOT NULL,
  `lead_id` bigint(20) unsigned NOT NULL,
  `ip_id` int(10) unsigned DEFAULT NULL,
  `date_fired` datetime NOT NULL,
  PRIMARY KEY (`stage_id`,`lead_id`),
  KEY `IDX_840FFA552298D193` (`stage_id`),
  KEY `IDX_840FFA5555458D` (`lead_id`),
  KEY `IDX_840FFA55A03F5E9F` (`ip_id`),
  CONSTRAINT `FK_840FFA552298D193` FOREIGN KEY (`stage_id`) REFERENCES `mautic_stages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_840FFA5555458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_840FFA55A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_stage_lead_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_sync_object_field_change_report
-- ----------------------------
DROP TABLE IF EXISTS `mautic_sync_object_field_change_report`;
CREATE TABLE `mautic_sync_object_field_change_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `integration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` bigint(20) unsigned NOT NULL,
  `object_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_at` datetime NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mautic_object_composite_key` (`object_type`,`object_id`,`column_name`),
  KEY `mautic_integration_object_composite_key` (`integration`,`object_type`,`object_id`,`column_name`),
  KEY `mautic_integration_object_type_modification_composite_key` (`integration`,`object_type`,`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_sync_object_field_change_report
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_sync_object_mapping
-- ----------------------------
DROP TABLE IF EXISTS `mautic_sync_object_mapping`;
CREATE TABLE `mautic_sync_object_mapping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `integration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `internal_object_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `internal_object_id` bigint(20) unsigned NOT NULL,
  `integration_object_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `integration_object_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_sync_date` datetime NOT NULL,
  `internal_storage` json NOT NULL COMMENT '(DC2Type:json_array)',
  `is_deleted` tinyint(1) NOT NULL,
  `integration_reference_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mautic_integration_object` (`integration`,`integration_object_name`,`integration_object_id`,`integration_reference_id`),
  KEY `mautic_integration_reference` (`integration`,`integration_object_name`,`integration_reference_id`,`integration_object_id`),
  KEY `mautic_integration_last_sync_date` (`integration`,`last_sync_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_sync_object_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_tweets
-- ----------------------------
DROP TABLE IF EXISTS `mautic_tweets`;
CREATE TABLE `mautic_tweets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `asset_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `media_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_count` int(11) DEFAULT NULL,
  `favorite_count` int(11) DEFAULT NULL,
  `retweet_count` int(11) DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E548EFE912469DE2` (`category_id`),
  KEY `IDX_E548EFE9C4663E4` (`page_id`),
  KEY `IDX_E548EFE95DA1941` (`asset_id`),
  KEY `mautic_sent_count_index` (`sent_count`),
  KEY `mautic_favorite_count_index` (`favorite_count`),
  KEY `mautic_retweet_count_index` (`retweet_count`),
  CONSTRAINT `FK_E548EFE912469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E548EFE95DA1941` FOREIGN KEY (`asset_id`) REFERENCES `mautic_assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E548EFE9C4663E4` FOREIGN KEY (`page_id`) REFERENCES `mautic_pages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_tweets
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_tweet_stats
-- ----------------------------
DROP TABLE IF EXISTS `mautic_tweet_stats`;
CREATE TABLE `mautic_tweet_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` int(10) unsigned DEFAULT NULL,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `twitter_tweet_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `is_failed` tinyint(1) DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `favorite_count` int(11) DEFAULT NULL,
  `retweet_count` int(11) DEFAULT NULL,
  `response_details` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `IDX_D1718DF61041E39B` (`tweet_id`),
  KEY `IDX_D1718DF655458D` (`lead_id`),
  KEY `mautic_stat_tweet_search` (`tweet_id`,`lead_id`),
  KEY `mautic_stat_tweet_search2` (`lead_id`,`tweet_id`),
  KEY `mautic_stat_tweet_failed_search` (`is_failed`),
  KEY `mautic_stat_tweet_source_search` (`source`,`source_id`),
  KEY `mautic_favorite_count_index` (`favorite_count`),
  KEY `mautic_retweet_count_index` (`retweet_count`),
  KEY `mautic_tweet_date_sent` (`date_sent`),
  KEY `mautic_twitter_tweet_id_index` (`twitter_tweet_id`),
  CONSTRAINT `FK_D1718DF61041E39B` FOREIGN KEY (`tweet_id`) REFERENCES `mautic_tweets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_D1718DF655458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_tweet_stats
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_users
-- ----------------------------
DROP TABLE IF EXISTS `mautic_users`;
CREATE TABLE `mautic_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `preferences` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `signature` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BBDE3B4AF85E0677` (`username`),
  UNIQUE KEY `UNIQ_BBDE3B4AE7927C74` (`email`),
  KEY `IDX_BBDE3B4AD60322AC` (`role_id`),
  CONSTRAINT `FK_BBDE3B4AD60322AC` FOREIGN KEY (`role_id`) REFERENCES `mautic_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_users
-- ----------------------------
INSERT INTO `mautic_users` VALUES ('1', '1', '1', null, null, null, '2020-11-10 06:12:03', '1', 'haorui jia', null, null, null, 'admin', '$2y$13$G90tC06nT.sAFjsHqQliEefJif305z2LXtm9rPyw5mxcwZrK.jhK.', 'haorui', 'jia', '81405982@qq.com', null, 'Asia/Shanghai', 'zh_CN', '2020-11-10 07:01:47', '2020-11-10 07:01:47', 'a:0:{}', 'Best regards, |FROM_NAME|');

-- ----------------------------
-- Table structure for mautic_user_tokens
-- ----------------------------
DROP TABLE IF EXISTS `mautic_user_tokens`;
CREATE TABLE `mautic_user_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `authorizator` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` datetime DEFAULT NULL,
  `one_time_only` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D5F53DA05CA2E8E5` (`secret`),
  KEY `IDX_D5F53DA0A76ED395` (`user_id`),
  CONSTRAINT `FK_D5F53DA0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `mautic_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_user_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_video_hits
-- ----------------------------
DROP TABLE IF EXISTS `mautic_video_hits`;
CREATE TABLE `mautic_video_hits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned DEFAULT NULL,
  `ip_id` int(10) unsigned NOT NULL,
  `date_hit` datetime NOT NULL,
  `date_left` datetime DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` int(11) NOT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `url` longtext COLLATE utf8mb4_unicode_ci,
  `user_agent` longtext COLLATE utf8mb4_unicode_ci,
  `remote_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_languages` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `time_watched` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_3AFB5FE355458D` (`lead_id`),
  KEY `IDX_3AFB5FE3A03F5E9F` (`ip_id`),
  KEY `mautic_video_date_hit` (`date_hit`),
  KEY `mautic_video_channel_search` (`channel`,`channel_id`),
  KEY `mautic_video_guid_lead_search` (`guid`,`lead_id`),
  CONSTRAINT `FK_3AFB5FE355458D` FOREIGN KEY (`lead_id`) REFERENCES `mautic_leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_3AFB5FE3A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mautic_ip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_video_hits
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_webhooks
-- ----------------------------
DROP TABLE IF EXISTS `mautic_webhooks`;
CREATE TABLE `mautic_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `webhook_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `events_orderby_dir` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B8AA269612469DE2` (`category_id`),
  CONSTRAINT `FK_B8AA269612469DE2` FOREIGN KEY (`category_id`) REFERENCES `mautic_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_webhooks
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_webhook_events
-- ----------------------------
DROP TABLE IF EXISTS `mautic_webhook_events`;
CREATE TABLE `mautic_webhook_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int(10) unsigned NOT NULL,
  `event_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_37BF7D915C9BA60B` (`webhook_id`),
  CONSTRAINT `FK_37BF7D915C9BA60B` FOREIGN KEY (`webhook_id`) REFERENCES `mautic_webhooks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_webhook_events
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_webhook_logs
-- ----------------------------
DROP TABLE IF EXISTS `mautic_webhook_logs`;
CREATE TABLE `mautic_webhook_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int(10) unsigned NOT NULL,
  `status_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `runtime` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C107EFAE5C9BA60B` (`webhook_id`),
  CONSTRAINT `FK_C107EFAE5C9BA60B` FOREIGN KEY (`webhook_id`) REFERENCES `mautic_webhooks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_webhook_logs
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_webhook_queue
-- ----------------------------
DROP TABLE IF EXISTS `mautic_webhook_queue`;
CREATE TABLE `mautic_webhook_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2C7F647A5C9BA60B` (`webhook_id`),
  KEY `IDX_2C7F647A71F7E88B` (`event_id`),
  CONSTRAINT `FK_2C7F647A5C9BA60B` FOREIGN KEY (`webhook_id`) REFERENCES `mautic_webhooks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2C7F647A71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `mautic_webhook_events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_webhook_queue
-- ----------------------------

-- ----------------------------
-- Table structure for mautic_widgets
-- ----------------------------
DROP TABLE IF EXISTS `mautic_widgets`;
CREATE TABLE `mautic_widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `cache_timeout` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mautic_widgets
-- ----------------------------
INSERT INTO `mautic_widgets` VALUES ('1', '1', '2020-11-10 06:06:29', '1', 'haorui jia', '2020-11-10 06:06:29', null, null, null, null, null, 'Contacts Created', 'created.leads.in.time', '100', '330', null, '0', 'a:1:{s:5:\"lists\";s:21:\"identifiedVsAnonymous\";}');
INSERT INTO `mautic_widgets` VALUES ('2', '1', '2020-11-10 06:06:29', '1', 'haorui jia', '2020-11-10 06:06:29', null, null, null, null, null, 'Page Visits', 'page.hits.in.time', '50', '330', null, '1', 'a:1:{s:4:\"flag\";s:6:\"unique\";}');
INSERT INTO `mautic_widgets` VALUES ('3', '1', '2020-11-10 06:06:29', '1', 'haorui jia', '2020-11-10 06:06:29', null, null, null, null, null, 'Form Submissions', 'submissions.in.time', '50', '330', null, '2', 'a:0:{}');
INSERT INTO `mautic_widgets` VALUES ('4', '1', '2020-11-10 06:06:29', '1', 'haorui jia', '2020-11-10 06:06:29', null, null, null, null, null, 'Recent Activity', 'recent.activity', '50', '330', null, '3', 'a:0:{}');
INSERT INTO `mautic_widgets` VALUES ('5', '1', '2020-11-10 06:06:29', '1', 'haorui jia', '2020-11-10 06:06:29', null, null, null, null, null, 'Upcoming Emails', 'upcoming.emails', '50', '330', null, '4', 'a:0:{}');
