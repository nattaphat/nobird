DROP PROCEDURE IF EXISTS jN_ParseUserAgent;

DELIMITER //
CREATE PROCEDURE jN_ParseUserAgent(
	IN userAgent VARCHAR(250),
	OUT deviceType INT,
	OUT deviceBrand INT,
	OUT operatingSystem INT,
	OUT browserName INT
)
	BEGIN
		set @value_deviceType_Unknown = 0;
		set @value_deviceType_Desktop = 100;
		set @value_deviceType_Phone = 200;
		set @value_deviceType_Tablet = 300;
		set @value_deviceType_Other = 900;

		set @value_deviceBrand_Unknown = 0;
		set @value_phone_Unknown = 0;
		set @value_phone_iPhone = 1000;
		set @value_phone_BlackBerry = 1010;
		set @value_phone_HTC = 1020;
		set @value_phone_Nexus = 1030;
		set @value_phone_Dell = 1040;
		set @value_phone_Motorola = 1050;
		set @value_phone_Samsung = 1060;
		set @value_phone_LG = 1070;
		set @value_phone_Sony = 1080;
		set @value_phone_Asus = 1090;

		set @value_tablet_Unknown = 0;
		set @value_tablet_iPad = 2000;
		set @value_tablet_Nexus = 2010;
		set @value_tablet_Samsung =2020;
		set @value_tablet_Kindle =2030;
		set @value_tablet_Surface =2040;
		set @value_tablet_HP =2050;
		set @value_tablet_Asus =2060;
		set @value_tablet_BlackBerry =2070;
		set @value_tablet_HTC =2080;
		set @value_tablet_Motorola =2090;
		set @value_tablet_Acer =2100;
		set @value_tablet_Toshiba =2110;
		set @value_tablet_LG = 2120;
		set @value_tablet_Fujitsu =2130;
		set @value_tablet_Prestigio =2140;
		set @value_tablet_Lenovo = 2150;
		set @value_tablet_Dell =2160;
		set @value_tablet_Sony = 2170;
		set @value_tablet_Philips = 2180;
		set @value_tablet_Huawei = 2190;
		set @value_tablet_Vodafone = 2200;

		set @value_OS_Unknown=0;
		set @value_OS_Android =3000;
		set @value_OS_BlackBerry = 3010;
		set @value_OS_Palm = 3020;
		set @value_OS_Symbian =3030;
		set @value_OS_WindowsMobile =3040;
		set @value_OS_WindowsPhone = 3050;
		set @value_OS_iOS =3060;
		set @value_OS_MeeGo = 3070;
		set @value_OS_Maemo =3080;
		set @value_OS_Java =3090;
		set @value_OS_webOS = 3100;
		set @value_OS_Bada = 3110;
		set @value_OS_BREW = 3120;

		set @value_Browser_Unknown=0;
		set @value_Browser_Chrome= 4000;
		set @value_Browser_Dolfin=4010;
		set @value_Browser_Opera= 4020;
		set @value_Browser_Skyfire=4030;
		set @value_Browser_IE=4040;
		set @value_Browser_Firefox=4050;
		set @value_Browser_Bolt=4060;
		set @value_Browser_TeaShark= 4070;
		set @value_Browser_Blazer=4080;
		set @value_Browser_Safari= 4090;
		set @value_Browser_Tizen=4100;
		set @value_Browser_UCBrowser=4110;
		set @value_Browser_baiduboxapp= 4120;
		set @value_Browser_baidubrowser= 4130;
		set @value_Browser_DiigoBrowser= 4140;
		set @value_Browser_Puffin= 4150;
		set @value_Browser_Mercury=4160;
		set @value_Browser_ObigoBrowser=4170;
		set @value_Browser_NetFront=4180;
		set @value_Browser_GenericBrowser=4190;

		set @phone_iPhone = 'iPhone|iPod';
		set @phone_BlackBerry = 'BlackBerry|\bBB10\b|rim[0-9]+';
		set @phone_HTC = 'HTC|HTC.*(Sensation|Evo|Vision|Explorer|6800|8100|8900|A7272|S510e|C110e|Legend|Desire|T8282)|HD_mini|Sensation.*Z710e|PG86100|Z715e|Desire.*(A8181|HD)|Inspire 4G|Android.*\bEVO\b|T-Mobile G1|Z520m';
		set @phone_Nexus = 'Nexus One|Nexus S|Galaxy.*Nexus|Android.*Nexus.*Mobile|Nexus 4|Nexus 5|Nexus 6';
		set @phone_Dell = 'Dell.*Streak|Dell.*Aero|Dell.*Venue|DELL.*Venue Pro|Dell Flash|Dell Smoke|Dell Mini 3iX';
		set @phone_Motorola = 'Motorola|DROIDX|DROID BIONIC|\bDroid\b.*Build|Android.*Xoom|Motorola.*ELECTRIFY|Motorola.*i1|\bMoto E\b';
		set @phone_Samsung = 'Samsung|SM-G9250|GT-19300|SGH-I337|BGT-S5230|GT-B2100|GT-B2700|GT-B2710|GT-B3210';
		set @phone_LG = '\bLG\b;|LG[- ]?(C800|C900|E400|E610|E900|E-900|F160|F180K|F180L|F180S|AX840|C729|E970|GS505|272|C395|E739BK)';
		set @phone_Sony = 'SonyST|SonyLT|SonyEricsson|SonyEricssonLT15iv|LT18i|E10i|LT28h|LT26w|SonyEricssonMT27i|C5303|C6902|C6903|C6906|C6943|D2533';
		set @phone_Asus = 'Asus.*Galaxy|PadFone.*Mobile';

		set @tablet_iPad ='iPad|iPad.*Mobile';
		set @tablet_Nexus ='Android.*Nexus[\s]+(7|9|10)';
		set @tablet_Samsung ='SAMSUNG.*Tablet|Galaxy.*Tab|SC-01C|GT-P1000|GT-P1003|GT-P1010|GT-P3105|GT-P6210|GT-P6800|GT-P6810|GT-P7100|GT-P7300|GT-P7310|GT-P7500';
		set @tablet_Kindle ='Kindle|Silk.*Accelerated|Android.*\b(KFOT|KFTT|KFJWI|KFJWA|KFOTE|KFSOWI|KFTHWI|KFTHWA|KFAPWI|KFAPWA|WFJWAE|KFSAWA|KFSAWI|KFASWI)\b';
		set @tablet_Surface ='Windows NT [0-9.]+; ARM;.*(Tablet|ARMBJS|Touch)';
		set @tablet_HP ='HP Slate (7|8|10)|HP ElitePad 900|hp-tablet|EliteBook.*Touch|HP 8|Slate 21|HP SlateBook 10';
		set @tablet_Asus ='PadFone|Transformer|TF101|TF101G|TF300T|TF300TG|TF300TL|TF700T|TF700KL|TF701T';
		set @tablet_BlackBerry ='PlayBook|RIM Tablet';
		set @tablet_HTC ='HTC_Flyer_P512|HTC Flyer|HTC Jetstream|HTC-P715a|HTC EVO View 4G|PG41200|PG09410';
		set @tablet_Motorola ='xoom|sholest|MZ615|MZ605|MZ505|MZ601|MZ602|MZ603|MZ604|MZ606|MZ607|MZ608|MZ609|MZ615|MZ616|MZ617';
		set @tablet_Acer ='Android.*; \b(A100|W501|W501P|W510|W511|W700|G100|G100W|B1-A71|B1-710|B1-711|A1-810|A1-811|A1-830)\b|W3-810|\bA3-A10\b|\bA3-A11\b';
		set @tablet_Toshiba ='Android.*(AT100|AT105|AT200|AT205|AT270|AT275|AT300|AT305|AT1S5|AT500|AT570|AT700|AT830)|TOSHIBA.*FOLIO';
		set @tablet_LG = '\bL-06C|LG-V909|LG-V900|LG-V700|LG-V510|LG-V500|LG-V410|LG-V400|LG-VK810\b';
		set @tablet_Fujitsu ='Android.*\b(F-01D|F-02F|F-05E|F-10D|M532|Q572)\b';
		set @tablet_Prestigio ='PMP3170B|PMP3270B|PMP3470B|PMP7170B|PMP3370B|PMP3570C|PMP5870C|PMP3670B|PMP5570C|PMP5770D|PMP3970B';
		set @tablet_Lenovo = 'Idea(Tab|Pad)|ThinkPad|Lenovo.*(S2109|S2110|S5000|S6000|K3011|A3000|A3500|A1000|A2107|A2109|A1107|A5500|A7600|B6000|B8000|B8080)';
		set @tablet_Dell ='Venue 11|Venue 8|Venue 7|Dell Streak 10|Dell Streak 7';
		set @tablet_Sony = 'Sony.*Tablet|Xperia Tablet|Sony Tablet S|SO-03E|SGPT12|SGPT13|SGPT114|SGPT121|SGPT122|SGPT123|SGPT111|SGPT112|SGPT113|SGPT131|SGPT132|SGPT133|SGPT211|SGPT212|SGPT213';
		set @tablet_Philips = '\b(PI2010|PI3000|PI3100|PI3105|PI3110|PI3205|PI3210|PI3900|PI4010|PI7000|PI7100)\b';
		set @tablet_Huawei = 'MediaPad|MediaPad 7 Youth|IDEOS S7|S7-201c|S7-202u|S7-101|S7-103|S7-104|S7-105|S7-106|S7-201|S7-Slim';
		set @tablet_Vodafone = 'SmartTab([ ]+)?[0-9]+|SmartTabII10|SmartTabII7';

		set @OS_Android='Android';
		set @OS_BlackBerry= 'blackberry|\bBB10\b|rim tablet os';
		set @OS_Palm= 'PalmOS|avantgo|blazer|elaine|hiptop|palm|plucker|xiino';
		set @OS_Symbian='Symbian|SymbOS|Series60|Series40|SYB-[0-9]+|\bS60\b';
		set @OS_WindowsMobile='Windows CE.*(PPC|Smartphone|Mobile|[0-9]{3}x[0-9]{3})|Window Mobile|Windows Phone [0-9.]+|WCE;';
		set @OS_WindowsPhone= 'Windows Phone 8.1|Windows Phone 8.0|Windows Phone OS|XBLWP7|ZuneWP7|Windows NT 6.[23]; ARM;';
		set @OS_iOS='iPhone.*Mobile|iPod|iPad';
		set @OS_MeeGo= 'MeeGo';
		set @OS_Maemo= 'Maemo';
		set @OS_Java='J2ME/|\bMIDP\b|\bCLDC\b|Java';
		set @OS_webOS= 'webOS|hpwOS';
		set @OS_Bada= '\bBada\b';
		set @OS_BREW= 'BREW';

		set @Browser_Chrome= '\bCrMo\b|CriOS|Android.*Chrome/[.0-9]* (Mobile)?';
		set @Browser_Dolfin='\bDolfin\b';
		set @Browser_Opera= 'Opera.*Mini|Opera.*Mobi|Android.*Opera|Mobile.*OPR/[0-9.]+|Coast/[0-9.]+';
		set @Browser_Skyfire='Skyfire';
		set @Browser_IE='IEMobile|MSIEMobile|Trident/[.0-9]+';
		set @Browser_Firefox= 'fennec|firefox.*maemo|(Mobile|Tablet).*Firefox|Firefox.*Mobile';
		set @Browser_Bolt='bolt';
		set @Browser_TeaShark= 'teashark';
		set @Browser_Blazer='Blazer';
		set @Browser_Safari= 'Version.*Mobile.*Safari|Safari.*Mobile|MobileSafari';
		set @Browser_Tizen='Tizen';
		set @Browser_UCBrowser='UC.*Browser|UCWEB';
		set @Browser_baiduboxapp= 'baiduboxapp';
		set @Browser_baidubrowser= 'baidubrowser';
		set @Browser_DiigoBrowser= 'DiigoBrowser';
		set @Browser_Puffin= 'Puffin';
		set @Browser_Mercury='\bMercury\b';
		set @Browser_ObigoBrowser='Obigo';
		set @Browser_NetFront='NF-Browser';
		set @Browser_GenericBrowser='NokiaBrowser|OviBrowser|OneBrowser|TwonkyBeamBrowser|SEMC.*Browser|FlyFlow|Minimo|NetFront|Novarra-Vision|MQQBrowser|MicroMessenger';

		/* prevent userAgent from null */
		set userAgent = concat(userAgent, '' );

		/* Check for Tablet first */
		if userAgent = '' THEN
			set deviceType = @value_deviceType_Unknown;
			set deviceBrand = @value_deviceBrand_Unknown;

		elseif userAgent REGEXP @tablet_iPad THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_iPad;

		elseif userAgent REGEXP @tablet_Nexus THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Nexus;

		elseif userAgent REGEXP @tablet_Samsung THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Samsung;

		elseif userAgent REGEXP @tablet_Kindle THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Kindle;

		elseif userAgent REGEXP @tablet_Surface THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Surface;

		elseif userAgent REGEXP @tablet_HP THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_HP;

		elseif userAgent REGEXP @tablet_Asus THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Asus;

		elseif userAgent REGEXP @tablet_BlackBerry THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_BlackBerry;

		elseif userAgent REGEXP @tablet_HTC THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_HTC;

		elseif userAgent REGEXP @tablet_Motorola THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Motorola;

		elseif userAgent REGEXP @tablet_Acer THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Acer;

		elseif userAgent REGEXP @tablet_Toshiba THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Toshiba;

		elseif userAgent REGEXP @tablet_LG THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_LG;

		elseif userAgent REGEXP @tablet_Fujitsu THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Fujitsu;

		elseif userAgent REGEXP @tablet_Prestigio THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Prestigio;

		elseif userAgent REGEXP @tablet_Lenovo THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Lenovo;

		elseif userAgent REGEXP @tablet_Dell THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Dell;

		elseif userAgent REGEXP @tablet_Sony THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Sony;

		elseif userAgent REGEXP @tablet_Philips THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Philips;

		elseif userAgent REGEXP @tablet_Huawei THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Huawei;

		elseif userAgent REGEXP @tablet_Vodafone THEN
			set deviceType = @value_deviceType_Tablet;
			set deviceBrand = @value_tablet_Vodafone;

		/* Check for Phone */
		elseif userAgent REGEXP @phone_iPhone THEN
			set deviceType = @value_deviceType_Phone;
			set deviceBrand = @value_phone_iPhone;

		elseif userAgent REGEXP @phone_BlackBerry THEN
			set deviceType = @value_deviceType_Phone;
			set deviceBrand = @value_phone_BlackBerry;

		elseif userAgent REGEXP @phone_HTC THEN
			set deviceType = @value_deviceType_Phone;
			set deviceBrand = @value_phone_HTC;

		elseif userAgent REGEXP @phone_Nexus THEN
			set deviceType = @value_deviceType_Phone;
			set deviceBrand = @value_phone_Nexus;

		elseif userAgent REGEXP @phone_Dell THEN
			set deviceType = @value_deviceType_Phone;
			set deviceBrand = @value_phone_Dell;

		elseif userAgent REGEXP @phone_Motorola THEN
			set deviceType = @value_deviceType_Phone;
			set deviceBrand = @value_phone_Motorola;

		elseif userAgent REGEXP @phone_Samsung THEN
			set deviceType = @value_deviceType_Phone;
			set deviceBrand = @value_phone_Samsung;

		elseif userAgent REGEXP @phone_LG THEN
			set deviceType = @value_deviceType_Phone;
			set deviceBrand = @value_phone_LG;

		elseif userAgent REGEXP @phone_Sony THEN
			set deviceType = @value_deviceType_Phone;
			set deviceBrand = @value_phone_Sony;

		elseif userAgent REGEXP @phone_Asus THEN
			set deviceType = @value_deviceType_Phone;
			set deviceBrand = @value_phone_Asus;

		else
			set deviceType = @value_deviceType_Desktop;
			set deviceBrand = @value_deviceBrand_Unknown;

		end if;


		/* Determine Operating System */
		if userAgent = '' THEN
			set operatingSystem = @value_OS_Unknown;

		elseif userAgent REGEXP @OS_Android THEN
			set operatingSystem = @value_OS_Android;

		elseif userAgent REGEXP @OS_BlackBerry THEN
			set operatingSystem = @value_OS_BlackBerry;

		elseif userAgent REGEXP @OS_Palm THEN
			set operatingSystem = @value_OS_Palm;

		elseif userAgent REGEXP @OS_Symbian THEN
			set operatingSystem = @value_OS_Symbian;

		elseif userAgent REGEXP @OS_WindowsMobile THEN
			set operatingSystem = @value_OS_WindowsMobile;

		elseif userAgent REGEXP @OS_WindowsPhone THEN
			set operatingSystem = @value_OS_WindowsPhone;

		elseif userAgent REGEXP @OS_iOS THEN
			set operatingSystem = @value_OS_iOS;

		elseif userAgent REGEXP @OS_MeeGo THEN
			set operatingSystem = @value_OS_MeeGo;

		elseif userAgent REGEXP @OS_Maemo THEN
			set operatingSystem = @value_OS_Maemo;

		elseif userAgent REGEXP @OS_Java THEN
			set operatingSystem = @value_OS_Java;

		elseif userAgent REGEXP @OS_webOS THEN
			set operatingSystem = @value_OS_webOS;

		elseif userAgent REGEXP @OS_Bada THEN
			set operatingSystem = @value_OS_Bada;

		elseif userAgent REGEXP @OS_BREW THEN
			set operatingSystem = @value_OS_BREW;

		else
			set operatingSystem = @value_OS_Unknown;

		end if;


		/* Determine BrowswerName */
		if userAgent = '' THEN
			set browserName = @value_Browser_Unknown;

		elseif userAgent REGEXP @Browser_Chrome THEN
			set browserName = @value_Browser_Chrome;

		elseif userAgent REGEXP @Browser_Dolfin THEN
			set browserName = @value_Browser_Dolfin;

		elseif userAgent REGEXP @Browser_Opera THEN
			set browserName = @value_Browser_Opera;

		elseif userAgent REGEXP @Browser_Skyfire THEN
			set browserName = @value_Browser_Skyfire;

		elseif userAgent REGEXP @Browser_IE THEN
			set browserName = @value_Browser_IE;

		elseif userAgent REGEXP @Browser_Firefox THEN
			set browserName = @value_Browser_Firefox;

		elseif userAgent REGEXP @Browser_Bolt THEN
			set browserName = @value_Browser_Bolt;

		elseif userAgent REGEXP @Browser_TeaShark THEN
			set browserName = @value_Browser_TeaShark;

		elseif userAgent REGEXP @Browser_Blazer THEN
			set browserName = @value_Browser_Blazer;

		elseif userAgent REGEXP @Browser_Safari THEN
			set browserName = @value_Browser_Safari;

		elseif userAgent REGEXP @Browser_Tizen THEN
			set browserName = @value_Browser_Tizen;

		elseif userAgent REGEXP @Browser_UCBrowser THEN
			set browserName = @value_Browser_UCBrowser;

		elseif userAgent REGEXP @Browser_baiduboxapp THEN
			set browserName = @value_Browser_baiduboxapp;

		elseif userAgent REGEXP @Browser_baidubrowser THEN
			set browserName = @value_Browser_baidubrowser;

		elseif userAgent REGEXP @Browser_DiigoBrowser THEN
			set browserName = @value_Browser_DiigoBrowser;

		elseif userAgent REGEXP @Browser_Puffin THEN
			set browserName = @value_Browser_Puffin;

		elseif userAgent REGEXP @Browser_Mercury THEN
			set browserName = @value_Browser_Mercury;

		elseif userAgent REGEXP @Browser_ObigoBrowser THEN
			set browserName = @value_Browser_ObigoBrowser;

		elseif userAgent REGEXP @Browser_NetFront THEN
			set browserName = @value_Browser_NetFront;

		elseif userAgent REGEXP @Browser_GenericBrowser THEN
			set browserName = @value_Browser_GenericBrowser;

		else
			set browserName = @value_Browser_Unknown;

		end if;

		SELECT deviceType,deviceBrand,operatingSystem,browserName;
	END//
DELIMITER ;