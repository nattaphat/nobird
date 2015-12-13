Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_2 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A501 Safari/9537.53
$phone_iPhone = 'iPhone|iPod';
CALL jN_ParseUserAgent('Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_2 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A501 Safari/9537.53',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	200	1000	3060	4090
Actual Result:
	200	1000	3060	4090

/************************************/
Mozilla/5.0 (BlackBerry; U; BlackBerry 9810; en-US) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.0.0.261 Mobile Safari/534.11+
$phone_BlackBerry = 'BlackBerry|\bBB10\b|rim[0-9]+';
CALL jN_ParseUserAgent('Mozilla/5.0 (BlackBerry; U; BlackBerry 9810; en-US) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.0.0.261 Mobile Safari/534.11+',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	200	1010	3010	4090
Actual Result:
	200	1010	3010	4090

/************************************/
Mozilla/5.0 (Linux; Android 4.1.1; HTC One X Build/JRO03C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.59 Mobile Safari/537.36
$phone_HTC = 'HTC|HTC.*(Sensation|Evo|Vision|Explorer|6800|8100|8900|A7272|S510e|C110e|Legend|Desire|T8282)|HD_mini|Sensation.*Z710e|PG86100|Z715e|Desire.*(A8181|HD)|Inspire 4G|Android.*\bEVO\b|T-Mobile G1|Z520m';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; Android 4.1.1; HTC One X Build/JRO03C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.59 Mobile Safari/537.36',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	200	1020	3000	4000
Actual Result:
	200	1020	3000	4000

/************************************/
Mozilla/5.0 (Linux; Android 4.4.2; Nexus 5 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.99 Mobile Safari/537.36
$phone_Nexus = 'Nexus One|Nexus S|Galaxy.*Nexus|Android.*Nexus.*Mobile|Nexus 4|Nexus 5|Nexus 6';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; Android 4.4.2; Nexus 5 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.99 Mobile Safari/537.36',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	200	1030	3000	4000
Actual Result:
	200	1030	3000	4000

/************************************/
Mozilla/5.0 (Linux; U; Android 3.2; en-us; Dell Streak 7 Build/HTJ85B) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13
$phone_Dell = 'Dell.*Streak|Dell.*Aero|Dell.*Venue|DELL.*Venue Pro|Dell Flash|Dell Smoke|Dell Mini 3iX';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 3.2; en-us; Dell Streak 7 Build/HTJ85B) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2160	3000	0
Actual Result:
	300	2160	3000	0

/************************************/
Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; Xoom Build/JZO54M) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30
$phone_Motorola = 'Motorola|DROIDX|DROID BIONIC|\bDroid\b.*Build|Android.*Xoom|Motorola.*ELECTRIFY|Motorola.*i1|\bMoto E\b';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; Xoom Build/JZO54M) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2090	3000	0
Actual Result:
	300	2090	3000	0

/************************************/
Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; SAMSUNG-SGH-I317 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30
$phone_Samsung = 'Samsung|SM-G9250|GT-19300|SGH-I337|BGT-S5230|GT-B2100|GT-B2700|GT-B2710|GT-B3210';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; SAMSUNG-SGH-I317 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	200	1060	3000	4090
Actual Result:
	200	1060	3000	4090

/************************************/
Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; LG-E970/E97020j Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30
$phone_LG = '\bLG\b;|LG[- ]?(C800|C900|E400|E610|E900|E-900|F160|F180K|F180L|F180S|AX840|C729|E970|GS505|272|C395|E739BK)';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; LG-E970/E97020j Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	200	1070	3000	4090
Actual Result:
	200	1070	3000	4090

/************************************/
Mozilla/5.0 (Linux; U; Android 4.1.2; en-gb; SonyLT26i Build/6.2.B.1.96) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30
$phone_Sony = 'SonyST|SonyLT|SonyEricsson|SonyEricssonLT15iv|LT18i|E10i|LT28h|LT26w|SonyEricssonMT27i|C5303|C6902|C6903|C6906|C6943|D2533';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 4.1.2; en-gb; SonyLT26i Build/6.2.B.1.96) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	200	1080	3000	4090
Actual Result:
	200	1080	3000	4090

/************************************/
$phone_Asus = 'Asus.*Galaxy|PadFone.*Mobile';

/************************************/
Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53
$tablet_iPad ='iPad|iPad.*Mobile';
CALL jN_ParseUserAgent('Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2000	3060	4090
Actual Result:
	300	2000	3060	4090

/************************************/
$tablet_Nexus ='Android.*Nexus[\s]+(7|9|10)';

/************************************/
Mozilla/5.0 (Linux; U; Android 4.0.4; en-us; GT-P7310 Build/IMM76D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30
$tablet_Samsung ='SAMSUNG.*Tablet|Galaxy.*Tab|SC-01C|GT-P1000|GT-P1003|GT-P1010|GT-P3105|GT-P6210|GT-P6800|GT-P6810|GT-P7100|GT-P7300|GT-P7310|GT-P7500';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 4.0.4; en-us; GT-P7310 Build/IMM76D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2020	3000	0
Actual Result:
	300	2020	3000	0

/************************************/
Mozilla/5.0 (Linux; U; en-us; KFJWI Build/IMM76D) AppleWebKit/535.19 (KHTML, like Gecko) Silk/3.10 Safari/535.19 Silk-Accelerated=true
$tablet_Kindle ='Kindle|Silk.*Accelerated|Android.*\b(KFOT|KFTT|KFJWI|KFJWA|KFOTE|KFSOWI|KFTHWI|KFTHWA|KFAPWI|KFAPWA|WFJWAE|KFSAWA|KFSAWI|KFASWI)\b';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; en-us; KFJWI Build/IMM76D) AppleWebKit/535.19 (KHTML, like Gecko) Silk/3.10 Safari/535.19 Silk-Accelerated=true',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2030	0	0
Actual Result:
	300	2030	0	0

/************************************/
Mozilla/5.0 (Windows NT 6.3; ARM; Trident/7.0; Touch; rv:11.0) like Gecko
$tablet_Surface ='Windows NT [0-9.]+; ARM;.*(Tablet|ARMBJS|Touch)';
CALL jN_ParseUserAgent('Mozilla/5.0 (Windows NT 6.3; ARM; Trident/7.0; Touch; rv:11.0) like Gecko',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2040	3050	4040
Actual Result:
	300	2040	3050	4040

/************************************/
Mozilla/5.0 (hp-tablet; Linux; hpwOS/3.0.5; U; en-US) AppleWebKit/534.6 (KHTML, like Gecko) wOSBrowser/234.83 Safari/534.6 TouchPad/1.0
$tablet_HP ='HP Slate (7|8|10)|HP ElitePad 900|hp-tablet|EliteBook.*Touch|HP 8|Slate 21|HP SlateBook 10';
CALL jN_ParseUserAgent('Mozilla/5.0 (hp-tablet; Linux; hpwOS/3.0.5; U; en-US) AppleWebKit/534.6 (KHTML, like Gecko) wOSBrowser/234.83 Safari/534.6 TouchPad/1.0',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2050	3100	0
Actual Result:
	300	2050	3100	0

/************************************/
Mozilla/5.0 (Linux; U; Android 4.2.1; en-us; ASUS Transformer Pad TF300T Build/JOP40D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30
$tablet_Asus ='PadFone|Transformer|TF101|TF101G|TF300T|TF300TG|TF300TL|TF700T|TF700KL|TF701T';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 4.2.1; en-us; ASUS Transformer Pad TF300T Build/JOP40D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2060	3000	0
Actual Result:
	300	2060	3000	0

/************************************/
Mozilla/5.0 (PlayBook; U; RIM Tablet OS 2.1.0; en-US) AppleWebKit/536.2+ (KHTML, like Gecko) Version/7.2.1.0 Safari/536.2+
$tablet_BlackBerry ='PlayBook|RIM Tablet';
CALL jN_ParseUserAgent('Mozilla/5.0 (PlayBook; U; RIM Tablet OS 2.1.0; en-US) AppleWebKit/536.2+ (KHTML, like Gecko) Version/7.2.1.0 Safari/536.2+',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2070	3010	0
Actual Result:
	300	2070	3010	0

/************************************/
$tablet_HTC ='HTC_Flyer_P512|HTC Flyer|HTC Jetstream|HTC-P715a|HTC EVO View 4G|PG41200|PG09410';

/************************************/
Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; Xoom Build/JZO54M) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30
$tablet_Motorola ='xoom|sholest|MZ615|MZ605|MZ505|MZ601|MZ602|MZ603|MZ604|MZ606|MZ607|MZ608|MZ609|MZ615|MZ616|MZ617';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; Xoom Build/JZO54M) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2090	3000	0
Actual Result:
	300	2090	3000	0

/************************************/
$tablet_Acer ='Android.*; \b(A100|W501|W501P|W510|W511|W700|G100|G100W|B1-A71|B1-710|B1-711|A1-810|A1-811|A1-830)\b|W3-810|\bA3-A10\b|\bA3-A11\b';

/************************************/
Mozilla/5.0 (Linux; U; Android 4.0.4; en-us; AT100 Build/IMM76D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30
$tablet_Toshiba ='Android.*(AT100|AT105|AT200|AT205|AT270|AT275|AT300|AT305|AT1S5|AT500|AT570|AT700|AT830)|TOSHIBA.*FOLIO';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 4.0.4; en-us; AT100 Build/IMM76D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2110	3000	0
Actual Result:
	300	2110	3000	0

/************************************/
Mozilla/5.0 (Linux; Android 4.2.2; LG-V500 Build/JDQ39B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.99 Safari/537.36
$tablet_LG = '\bL-06C|LG-V909|LG-V900|LG-V700|LG-V510|LG-V500|LG-V410|LG-V400|LG-VK810\b';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; Android 4.2.2; LG-V500 Build/JDQ39B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.99 Safari/537.36',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2120	3000	4000
Actual Result:
	300	2120	3000	4000

/************************************/
$tablet_Fujitsu ='Android.*\b(F-01D|F-02F|F-05E|F-10D|M532|Q572)\b';

/************************************/
$tablet_Prestigio ='PMP3170B|PMP3270B|PMP3470B|PMP7170B|PMP3370B|PMP3570C|PMP5870C|PMP3670B|PMP5570C|PMP5770D|PMP3970B';

/************************************/
Mozilla/5.0 (Linux; U; Android 4.2.2; en-us; IdeaTab S6000-F Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30
$tablet_Lenovo = 'Idea(Tab|Pad)|ThinkPad|Lenovo.*(S2109|S2110|S5000|S6000|K3011|A3000|A3500|A1000|A2107|A2109|A1107|A5500|A7600|B6000|B8000|B8080)';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 4.2.2; en-us; IdeaTab S6000-F Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2150	3000	0
Actual Result:
	300	2150	3000	0

/************************************/
Mozilla/5.0 (Linux; U; Android 4.3; en-us; Venue 8 3830 Build/JSS15Q) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30
$tablet_Dell ='Venue 11|Venue 8|Venue 7|Dell Streak 10|Dell Streak 7';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 4.3; en-us; Venue 8 3830 Build/JSS15Q) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2160	3000	0
Actual Result:
	300	2160	3000	0

/************************************/
Mozilla/5.0 (Linux; Android 4.0.3; Sony Tablet S Build/TISU0143) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.99 Safari/537.36
$tablet_Sony = 'Sony.*Tablet|Xperia Tablet|Sony Tablet S|SO-03E|SGPT12|SGPT13|SGPT114|SGPT121|SGPT122|SGPT123|SGPT111|SGPT112|SGPT113|SGPT131|SGPT132|SGPT133|SGPT211|SGPT212|SGPT213';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; Android 4.0.3; Sony Tablet S Build/TISU0143) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.99 Safari/537.36',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2170	3000	4000
Actual Result:
	300	2170	3000	4000

/************************************/
$tablet_Philips = '\b(PI2010|PI3000|PI3100|PI3105|PI3110|PI3205|PI3210|PI3900|PI4010|PI7000|PI7100)\b';

/************************************/
$tablet_Huawei = 'MediaPad|MediaPad 7 Youth|IDEOS S7|S7-201c|S7-202u|S7-101|S7-103|S7-104|S7-105|S7-106|S7-201|S7-Slim';

/************************************/
$tablet_Vodafone = 'SmartTab([ ]+)?[0-9]+|SmartTabII10|SmartTabII7';

/************************************/
Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; SAMSUNG-SGH-I317 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30
$OS_Android='Android';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; SAMSUNG-SGH-I317 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	200	1060	3000	4090
Actual Result:
	200	1060	3000	4090

/************************************/
Mozilla/5.0 (PlayBook; U; RIM Tablet OS 2.1.0; en-US) AppleWebKit/536.2+ (KHTML, like Gecko) Version/7.2.1.0 Safari/536.2+
$OS_BlackBerry= 'blackberry|\bBB10\b|rim tablet os';
CALL jN_ParseUserAgent('Mozilla/5.0 (PlayBook; U; RIM Tablet OS 2.1.0; en-US) AppleWebKit/536.2+ (KHTML, like Gecko) Version/7.2.1.0 Safari/536.2+',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2070	3010	0
Actual Result:
	300	2070	3010	0

/************************************/
$OS_Palm= 'PalmOS|avantgo|blazer|elaine|hiptop|palm|plucker|xiino';

/************************************/
$OS_Symbian='Symbian|SymbOS|Series60|Series40|SYB-[0-9]+|\bS60\b';

/************************************/
Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; HTC; PM23300)
$OS_WindowsMobile='Windows CE.*(PPC|Smartphone|Mobile|[0-9]{3}x[0-9]{3})|Window Mobile|Windows Phone [0-9.]+|WCE;';
CALL jN_ParseUserAgent('Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; HTC; PM23300)',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	200	1020	3040	4040
Actual Result:
	200	1020	3040	4040

/************************************/
Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; HTC; PM23300)
$OS_WindowsPhone= 'Windows Phone 8.1|Windows Phone 8.0|Windows Phone OS|XBLWP7|ZuneWP7|Windows NT 6.[23]; ARM;';
CALL jN_ParseUserAgent('Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; HTC; PM23300)',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	200	1020	3040	4040
Actual Result:
	200	1020	3040	4040

/************************************/
Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53
$OS_iOS='iPhone.*Mobile|iPod|iPad';
CALL jN_ParseUserAgent('Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2000	3060	4090
Actual Result:
	300	2000	3060	4090

/************************************/
$OS_MeeGo= 'MeeGo';

/************************************/
$OS_Maemo= 'Maemo';

/************************************/
$OS_Java='J2ME/|\bMIDP\b|\bCLDC\b|Java';

/************************************/
Mozilla/5.0 (hp-tablet; Linux; hpwOS/3.0.5; U; en-US) AppleWebKit/534.6 (KHTML, like Gecko) wOSBrowser/234.83 Safari/534.6 TouchPad/1.0
$OS_webOS= 'webOS|hpwOS';
CALL jN_ParseUserAgent('Mozilla/5.0 (hp-tablet; Linux; hpwOS/3.0.5; U; en-US) AppleWebKit/534.6 (KHTML, like Gecko) wOSBrowser/234.83 Safari/534.6 TouchPad/1.0',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2050	3100	0
Actual Result:
	300	2050	3100	0

/************************************/
$OS_Bada= '\bBada\b';

/************************************/
$OS_BREW= 'BREW';

/************************************/
Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) CriOS/31.0.1650.18 Mobile/11B554a Safari/8536.25
$Browser_Chrome= '\bCrMo\b|CriOS|Android.*Chrome/[.0-9]* (Mobile)?';
CALL jN_ParseUserAgent('Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) CriOS/31.0.1650.18 Mobile/11B554a Safari/8536.25',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2000	3060	4000
Actual Result:
	300	2000	3060	4000

/************************************/
$Browser_Dolfin='\bDolfin\b';

/************************************/
Opera/9.80 (Android 4.0.4; Linux; Opera Tablet/ADR-1309251116) Presto/2.11.355 Version/12.10
$Browser_Opera= 'Opera.*Mini|Opera.*Mobi|Android.*Opera|Mobile.*OPR/[0-9.]+|Coast/[0-9.]+';
CALL jN_ParseUserAgent('Opera/9.80 (Android 4.0.4; Linux; Opera Tablet/ADR-1309251116) Presto/2.11.355 Version/12.10',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	100	0	3000	4020
Actual Result:
	100	0	3000	4020

/************************************/
$Browser_Skyfire='Skyfire';

/************************************/
Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko
$Browser_IE='IEMobile|MSIEMobile|Trident/[.0-9]+';
CALL jN_ParseUserAgent('Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	100	0	0	4040
Actual Result:
	100	0	0	4040

/************************************/
Mozilla/5.0 (Android; Tablet; rv:26.0) Gecko/26.0 Firefox/26.0
$Browser_Firefox= 'fennec|firefox.*maemo|(Mobile|Tablet).*Firefox|Firefox.*Mobile';
Mozilla/5.0 (Android; Tablet; rv:26.0) Gecko/26.0 Firefox/26.0
Expected Result:
	100	0	3000	4050
Actual Result:
	100	0	3000	4050

/************************************/
$Browser_Bolt='bolt';

/************************************/
$Browser_TeaShark= 'teashark';

/************************************/
$Browser_Blazer='Blazer';

/************************************/
Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53
$Browser_Safari= 'Version.*Mobile.*Safari|Safari.*Mobile|MobileSafari';
CALL jN_ParseUserAgent('Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	300	2000	3060	4090
Actual Result:
	300	2000	3060	4090

/************************************/
$Browser_Tizen='Tizen';

/************************************/
Mozilla/5.0 (Linux; U; Android 4.4.2; pt-BR; SM-G900M Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/10.0.0.488 U3/0.8.0 Mobile Safari/533.1
$Browser_UCBrowser='UC.*Browser|UCWEB';
CALL jN_ParseUserAgent('Mozilla/5.0 (Linux; U; Android 4.4.2; pt-BR; SM-G900M Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/10.0.0.488 U3/0.8.0 Mobile Safari/533.1',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	100	0	3000	4090
Actual Result:
	100	0	3000	4090

/************************************/
$Browser_baiduboxapp= 'baiduboxapp';

/************************************/
$Browser_baidubrowser= 'baidubrowser';

/************************************/
$Browser_DiigoBrowser= 'DiigoBrowser';

/************************************/
Mozilla/5.0 (X11; U; Linux x86_64; en-CA) AppleWebKit/534.35 (KHTML, like Gecko)  Chrome/11.0.696.65 Safari/534.35 Puffin/3.10990IT
$Browser_Puffin= 'Puffin';
CALL jN_ParseUserAgent('Mozilla/5.0 (X11; U; Linux x86_64; en-CA) AppleWebKit/534.35 (KHTML, like Gecko)  Chrome/11.0.696.65 Safari/534.35 Puffin/3.10990IT',@deviceType,@deviceBrand,@operatingSystem,@browserName)
Expected Result:
	100	0	0	4150
Actual Result:
	100	0	0	4150
	
/************************************/
$Browser_Mercury='\bMercury\b';

/************************************/
$Browser_ObigoBrowser='Obigo';

/************************************/
$Browser_NetFront='NF-Browser';

/************************************/
$Browser_GenericBrowser='NokiaBrowser|OviBrowser|OneBrowser|TwonkyBeamBrowser|SEMC.*Browser|FlyFlow|Minimo|NetFront|Novarra-Vision|MQQBrowser|MicroMessenger';
