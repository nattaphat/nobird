DROP PROCEDURE IF EXISTS jN_ParseUserAgent;

DELIMITER //
CREATE PROCEDURE jN_ParseUserAgent(
IN userAgent VARCHAR(300),
OUT deviceType INT,
OUT deviceTypeName VARCHAR(10),
OUT deviceBrand VARCHAR(20),
OUT operatingSystem VARCHAR(20),
OUT browserName VARCHAR(20)
)
LANGUAGE SQL
COMMENT 'A procedure for parse useragent to deviseType,deviseBrand,operatingSystem,browserName'
BEGIN
  DECLARE dType INT;
  DECLARE dTypeName VARCHAR(10);
  DECLARE dBrand VARCHAR(20);
  DECLARE os VARCHAR(20);
  DECLARE bName VARCHAR(20);
   
  
  SET dType = 0;
  
  /** Begin IF **/
  /**For tablet**/
  /**iPad**/
  IF userAgent REGEXP 'iPad|iPad.*Mobile' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'iPad';
        SET os = 'iOS';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Safari';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSE
                SET bName = 'Unknow';
        END IF;

  /**Surface**/
  ELSEIF userAgent REGEXP 'Windows NT [0-9.]+; ARM;.*(Tablet|ARMBJS|Touch)|WOW64|Win64' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'Surface';
        SET os = 'Windows';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Safari';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;  
  
  /**Nexus**/
  ELSEIF userAgent REGEXP 'Android.*Nexus[\s]+(7|9|10)' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'Nexus';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF; 
  
  /**Samsung**/
  ELSEIF userAgent REGEXP 'SAMSUNG.*Tablet|Galaxy.*Tab|SC-01C|GT-P1000|GT-P1003|GT-P1010|GT-P3105|GT-P6210|GT-P6800|GT-P6810|GT-P7100|GT-P7300|GT-P7310|GT-P7500|GT-P7510|SCH-I800|SCH-I815|SCH-I905|SGH-I957|SGH-I987|SGH-T849|SGH-T859|SGH-T869|SPH-P100|GT-P3100|GT-P3108|GT-P3110|GT-P5100|GT-P5110|GT-P6200|GT-P7320|GT-P7511|GT-N8000|GT-P8510|SGH-I497|SPH-P500|SGH-T779|SCH-I705|SCH-I915|GT-N8013|GT-P3113|GT-P5113|GT-P8110|GT-N8010|GT-N8005|GT-N8020|GT-P1013|GT-P6201|GT-P7501|GT-N5100|GT-N5105|GT-N5110|SHV-E140K|SHV-E140L|SHV-E140S|SHV-E150S|SHV-E230K|SHV-E230L|SHV-E230S|SHW-M180K|SHW-M180L|SHW-M180S|SHW-M180W|SHW-M300W|SHW-M305W|SHW-M380K|SHW-M380S|SHW-M380W|SHW-M430W|SHW-M480K|SHW-M480S|SHW-M480W|SHW-M485W|SHW-M486W|SHW-M500W|GT-I9228|SCH-P739|SCH-I925|GT-I9200|GT-P5200|GT-P5210|GT-P5210X|SM-T311|SM-T310|SM-T310X|SM-T210|SM-T210R|SM-T211|SM-P600|SM-P601|SM-P605|SM-P900|SM-P901|SM-T217|SM-T217A|SM-T217S|SM-P6000|SM-T3100|SGH-I467|XE500|SM-T110|GT-P5220|GT-I9200X|GT-N5110X|GT-N5120|SM-P905|SM-T111|SM-T2105|SM-T315|SM-T320|SM-T320X|SM-T321|SM-T520|SM-T525|SM-T530NU|SM-T230NU|SM-T330NU|SM-T900|XE500T1C|SM-P605V|SM-P905V|SM-T337V|SM-T537V|SM-T707V|SM-T807V|SM-P600X|SM-P900X|SM-T210X|SM-T230|SM-T230X|SM-T325|GT-P7503|SM-T531|SM-T330|SM-T530|SM-T705|SM-T705C|SM-T535|SM-T331|SM-T800|SM-T700|SM-T537|SM-T807|SM-P907A|SM-T337A|SM-T537A|SM-T707A|SM-T807A|SM-T237|SM-T807P|SM-P607T|SM-T217T|SM-T337T|SM-T807T|SM-T116NQ|SM-P550|SM-T350|SM-T550|SM-T9000|SM-P9000|SM-T705Y|SM-T805|GT-P3113|SM-T710|SM-T810|SM-T360' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'Samsung';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;
  
  /**Kindle**/
  ELSEIF userAgent REGEXP 'Kindle|Silk.*Accelerated|Android.*\b(KFOT|KFTT|KFJWI|KFJWA|KFOTE|KFSOWI|KFTHWI|KFTHWA|KFAPWI|KFAPWA|WFJWAE|KFSAWA|KFSAWI|KFASWI)\b' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'Kindle';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF; 
  
  /**HP**/
  ELSEIF userAgent REGEXP 'HP Slate (7|8|10)|HP ElitePad 900|hp-tablet|EliteBook.*Touch|HP 8|Slate 21|HP SlateBook 10' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'HP';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;
  
  /**Asus**/
  ELSEIF userAgent REGEXP 'PadFone|Transformer|TF101|TF101G|TF300T|TF300TG|TF300TL|TF700T|TF700KL|TF701T|TF810C|ME171|ME301T|ME302C|ME371MG|ME370T|ME372MG|ME172V|ME173X|ME400C|Slider SL101|\bK00F\b|\bK00C\b|\bK00E\b|\bK00L\b|TX201LA|ME176C|ME102A|\bM80TA\b|ME372CL|ME560CG|ME372CG|ME302KL| K010 | K017 |ME572C|ME103K|ME170C|ME171C|\bME70C\b|ME581C|ME581CL|ME8510C|ME181C' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'Asus';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;
  
  /**BlackBerry**/
  ELSEIF userAgent REGEXP 'PlayBook|RIM Tablet' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'BlackBerry';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Blackberry Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;
  
  /**HTC**/
  ELSEIF userAgent REGEXP 'HTC_Flyer_P512|HTC Flyer|HTC Jetstream|HTC-P715a|HTC EVO View 4G|PG41200|PG09410' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'HTC';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;
  
  /**Motorola**/
  ELSEIF userAgent REGEXP 'xoom|sholest|MZ615|MZ605|MZ505|MZ601|MZ602|MZ603|MZ604|MZ606|MZ607|MZ608|MZ609|MZ615|MZ616|MZ617' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'Motorola';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;     
        
  /**Dell**/
  ELSEIF userAgent REGEXP 'Venue 11|Venue 8|Venue 7|Dell Streak 10|Dell Streak 7' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'Dell';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;    
        
  /**Lenovo**/
  ELSEIF userAgent REGEXP 'Idea(Tab|Pad)|Lenovo.*(S2109|S2110|S5000|S6000|K3011|A3000|A3500|A1000|A2107|A2109|A1107|A5500|A7600|B6000|B8000|B8080)' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'Lenovo';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;  
 
   /**Sony**/
  ELSEIF userAgent REGEXP 'Sony.*Tablet|Xperia Tablet|Sony Tablet S|SO-03E|SGPT12|SGPT13|SGPT114|SGPT121|SGPT122|SGPT123|SGPT111|SGPT112|SGPT113|SGPT131|SGPT132|SGPT133|SGPT211|SGPT212|SGPT213|SGP311|SGP312|SGP321|EBRD1101|EBRD1102|EBRD1201|SGP351|SGP341|SGP511|SGP512|SGP521|SGP541|SGP551|SGP621|SGP612|SOT31' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'Sony';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;   

   /**Huawei**/
  ELSEIF userAgent REGEXP 'MediaPad|MediaPad 7 Youth|IDEOS S7|S7-201c|S7-202u|S7-101|S7-103|S7-104|S7-105|S7-106|S7-201|S7-Slim' THEN
        SET dType = 300;
        SET dTypeName = 'Tablet';
        SET dBrand = 'Huawei';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;  
  
  /**Mobile**/
  /**iPhone**/
  ELSEIF userAgent REGEXP 'iPhone|iPod' THEN
        SET dType = 200;
        SET dTypeName = 'Phone';
        SET dBrand = 'iPhone';
        SET os = 'iOS';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Safari';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;  
  
  /**BlackBerry**/
  ELSEIF userAgent REGEXP 'BlackBerry|\bBB10\b|rim[0-9]' THEN
        SET dType = 200;
        SET dTypeName = 'Phone';
        SET dBrand = 'BlackBerry';
        SET os = 'BlackBerry';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Blackberry Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;
  
  /**HTC**/
  ELSEIF userAgent REGEXP 'HTC|HTC.*(Sensation|Evo|Vision|Explorer|6800|8100|8900|A7272|S510e|C110e|Legend|Desire|T8282)|APX515CKT|Qtek9090|APA9292KT|HD_mini|Sensation.*Z710e|PG86100|Z715e|Desire.*(A8181|HD)|ADR6200|ADR6400L|ADR6425|001HT|Inspire 4G|Android.*\bEVO\b|T-Mobile G1|Z520m' THEN
        SET dType = 200;
        SET dTypeName = 'Phone';
        SET dBrand = 'HTC';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;
 
  /**Nexus**/
  ELSEIF userAgent REGEXP 'Nexus One|Nexus S|Galaxy.*Nexus|Android.*Nexus.*Mobile|Nexus 4|Nexus 5|Nexus 6' THEN
        SET dType = 200;
        SET dTypeName = 'Phone';
        SET dBrand = 'Nexus';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF; 

  /**Dell**/
  ELSEIF userAgent REGEXP 'Dell.*Streak|Dell.*Aero|Dell.*Venue|DELL.*Venue Pro|Dell Flash|Dell Smoke|Dell Mini 3iX|XCD28|XCD35|\b001DL\b|\b101DL\b|\bGS01\b' THEN
        SET dType = 200;
        SET dTypeName = 'Phone';
        SET dBrand = 'Dell';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;  
 
   /**Motorola**/
  ELSEIF userAgent REGEXP 'Motorola|DROIDX|DROID BIONIC|\bDroid\b.*Build|Android.*Xoom|HRI39|MOT-|A1260|A1680|A555|A853|A855|A953|A955|A956|Motorola.*ELECTRIFY|Motorola.*i1|i867|i940|MB200|MB300|MB501|MB502|MB508|MB511|MB520|MB525|MB526|MB611|MB612|MB632|MB810|MB855|MB860|MB861|MB865|MB870|ME501|ME502|ME511|ME525|ME600|ME632|ME722|ME811|ME860|ME863|ME865|MT620|MT710|MT716|MT720|MT810|MT870|MT917|Motorola.*TITANIUM|WX435|WX445|XT300|XT301|XT311|XT316|XT317|XT319|XT320|XT390|XT502|XT530|XT531|XT532|XT535|XT603|XT610|XT611|XT615|XT681|XT701|XT702|XT711|XT720|XT800|XT806|XT860|XT862|XT875|XT882|XT883|XT894|XT901|XT907|XT909|XT910|XT912|XT928|XT926|XT915|XT919|XT925|XT1021|\bMoto E\b' THEN
        SET dType = 200;
        SET dTypeName = 'Phone';
        SET dBrand = 'Motorola';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF; 
        
  /**Samsung**/
  ELSEIF userAgent REGEXP 'Samsung|SM-G9250|GT-19300|SGH-I337|BGT-S5230|GT-B2100|GT-B2700|GT-B2710|GT-B3210|GT-B3310|GT-B3410|GT-B3730|GT-B3740|GT-B5510|GT-B5512|GT-B5722|GT-B6520|GT-B7300|GT-B7320|GT-B7330|GT-B7350|GT-B7510|GT-B7722|GT-B7800|GT-C3010|GT-C3011|GT-C3060|GT-C3200|GT-C3212|GT-C3212I|GT-C3262|GT-C3222|GT-C3300|GT-C3300K|GT-C3303|GT-C3303K|GT-C3310|GT-C3322|GT-C3330|GT-C3350|GT-C3500|GT-C3510|GT-C3530|GT-C3630|GT-C3780|GT-C5010|GT-C5212|GT-C6620|GT-C6625|GT-C6712|GT-E1050|GT-E1070|GT-E1075|GT-E1080|GT-E1081|GT-E1085|GT-E1087|GT-E1100|GT-E1107|GT-E1110|GT-E1120|GT-E1125|GT-E1130|GT-E1160|GT-E1170|GT-E1175|GT-E1180|GT-E1182|GT-E1200|GT-E1210|GT-E1225|GT-E1230|GT-E1390|GT-E2100|GT-E2120|GT-E2121|GT-E2152|GT-E2220|GT-E2222|GT-E2230|GT-E2232|GT-E2250|GT-E2370|GT-E2550|GT-E2652|GT-E3210|GT-E3213|GT-I5500|GT-I5503|GT-I5700|GT-I5800|GT-I5801|GT-I6410|GT-I6420|GT-I7110|GT-I7410|GT-I7500|GT-I8000|GT-I8150|GT-I8160|GT-I8190|GT-I8320|GT-I8330|GT-I8350|GT-I8530|GT-I8700|GT-I8703|GT-I8910|GT-I9000|GT-I9001|GT-I9003|GT-I9010|GT-I9020|GT-I9023|GT-I9070|GT-I9082|GT-I9100|GT-I9103|GT-I9220|GT-I9250|GT-I9300|GT-I9305|GT-I9500|GT-I9505|GT-M3510|GT-M5650|GT-M7500|GT-M7600|GT-M7603|GT-M8800|GT-M8910|GT-N7000|GT-S3110|GT-S3310|GT-S3350|GT-S3353|GT-S3370|GT-S3650|GT-S3653|GT-S3770|GT-S3850|GT-S5210|GT-S5220|GT-S5229|GT-S5230|GT-S5233|GT-S5250|GT-S5253|GT-S5260|GT-S5263|GT-S5270|GT-S5300|GT-S5330|GT-S5350|GT-S5360|GT-S5363|GT-S5369|GT-S5380|GT-S5380D|GT-S5560|GT-S5570|GT-S5600|GT-S5603|GT-S5610|GT-S5620|GT-S5660|GT-S5670|GT-S5690|GT-S5750|GT-S5780|GT-S5830|GT-S5839|GT-S6102|GT-S6500|GT-S7070|GT-S7200|GT-S7220|GT-S7230|GT-S7233|GT-S7250|GT-S7500|GT-S7530|GT-S7550|GT-S7562|GT-S7710|GT-S8000|GT-S8003|GT-S8500|GT-S8530|GT-S8600|SCH-A310|SCH-A530|SCH-A570|SCH-A610|SCH-A630|SCH-A650|SCH-A790|SCH-A795|SCH-A850|SCH-A870|SCH-A890|SCH-A930|SCH-A950|SCH-A970|SCH-A990|SCH-I100|SCH-I110|SCH-I400|SCH-I405|SCH-I500|SCH-I510|SCH-I515|SCH-I600|SCH-I730|SCH-I760|SCH-I770|SCH-I830|SCH-I910|SCH-I920|SCH-I959|SCH-LC11|SCH-N150|SCH-N300|SCH-R100|SCH-R300|SCH-R351|SCH-R400|SCH-R410|SCH-T300|SCH-U310|SCH-U320|SCH-U350|SCH-U360|SCH-U365|SCH-U370|SCH-U380|SCH-U410|SCH-U430|SCH-U450|SCH-U460|SCH-U470|SCH-U490|SCH-U540|SCH-U550|SCH-U620|SCH-U640|SCH-U650|SCH-U660|SCH-U700|SCH-U740|SCH-U750|SCH-U810|SCH-U820|SCH-U900|SCH-U940|SCH-U960|SCS-26UC|SGH-A107|SGH-A117|SGH-A127|SGH-A137|SGH-A157|SGH-A167|SGH-A177|SGH-A187|SGH-A197|SGH-A227|SGH-A237|SGH-A257|SGH-A437|SGH-A517|SGH-A597|SGH-A637|SGH-A657|SGH-A667|SGH-A687|SGH-A697|SGH-A707|SGH-A717|SGH-A727|SGH-A737|SGH-A747|SGH-A767|SGH-A777|SGH-A797|SGH-A817|SGH-A827|SGH-A837|SGH-A847|SGH-A867|SGH-A877|SGH-A887|SGH-A897|SGH-A927|SGH-B100|SGH-B130|SGH-B200|SGH-B220|SGH-C100|SGH-C110|SGH-C120|SGH-C130|SGH-C140|SGH-C160|SGH-C170|SGH-C180|SGH-C200|SGH-C207|SGH-C210|SGH-C225|SGH-C230|SGH-C417|SGH-C450|SGH-D307|SGH-D347|SGH-D357|SGH-D407|SGH-D415|SGH-D780|SGH-D807|SGH-D980|SGH-E105|SGH-E200|SGH-E315|SGH-E316|SGH-E317|SGH-E335|SGH-E590|SGH-E635|SGH-E715|SGH-E890|SGH-F300|SGH-F480|SGH-I200|SGH-I300|SGH-I320|SGH-I550|SGH-I577|SGH-I600|SGH-I607|SGH-I617|SGH-I627|SGH-I637|SGH-I677|SGH-I700|SGH-I717|SGH-I727|SGH-i747M|SGH-I777|SGH-I780|SGH-I827|SGH-I847|SGH-I857|SGH-I896|SGH-I897|SGH-I900|SGH-I907|SGH-I917|SGH-I927|SGH-I937|SGH-I997|SGH-J150|SGH-J200|SGH-L170|SGH-L700|SGH-M110|SGH-M150|SGH-M200|SGH-N105|SGH-N500|SGH-N600|SGH-N620|SGH-N625|SGH-N700|SGH-N710|SGH-P107|SGH-P207|SGH-P300|SGH-P310|SGH-P520|SGH-P735|SGH-P777|SGH-Q105|SGH-R210|SGH-R220|SGH-R225|SGH-S105|SGH-S307|SGH-T109|SGH-T119|SGH-T139|SGH-T209|SGH-T219|SGH-T229|SGH-T239|SGH-T249|SGH-T259|SGH-T309|SGH-T319|SGH-T329|SGH-T339|SGH-T349|SGH-T359|SGH-T369|SGH-T379|SGH-T409|SGH-T429|SGH-T439|SGH-T459|SGH-T469|SGH-T479|SGH-T499|SGH-T509|SGH-T519|SGH-T539|SGH-T559|SGH-T589|SGH-T609|SGH-T619|SGH-T629|SGH-T639|SGH-T659|SGH-T669|SGH-T679|SGH-T709|SGH-T719|SGH-T729|SGH-T739|SGH-T746|SGH-T749|SGH-T759|SGH-T769|SGH-T809|SGH-T819|SGH-T839|SGH-T919|SGH-T929|SGH-T939|SGH-T959|SGH-T989|SGH-U100|SGH-U200|SGH-U800|SGH-V205|SGH-V206|SGH-X100|SGH-X105|SGH-X120|SGH-X140|SGH-X426|SGH-X427|SGH-X475|SGH-X495|SGH-X497|SGH-X507|SGH-X600|SGH-X610|SGH-X620|SGH-X630|SGH-X700|SGH-X820|SGH-X890|SGH-Z130|SGH-Z150|SGH-Z170|SGH-ZX10|SGH-ZX20|SHW-M110|SPH-A120|SPH-A400|SPH-A420|SPH-A460|SPH-A500|SPH-A560|SPH-A600|SPH-A620|SPH-A660|SPH-A700|SPH-A740|SPH-A760|SPH-A790|SPH-A800|SPH-A820|SPH-A840|SPH-A880|SPH-A900|SPH-A940|SPH-A960|SPH-D600|SPH-D700|SPH-D710|SPH-D720|SPH-I300|SPH-I325|SPH-I330|SPH-I350|SPH-I500|SPH-I600|SPH-I700|SPH-L700|SPH-M100|SPH-M220|SPH-M240|SPH-M300|SPH-M305|SPH-M320|SPH-M330|SPH-M350|SPH-M360|SPH-M370|SPH-M380|SPH-M510|SPH-M540|SPH-M550|SPH-M560|SPH-M570|SPH-M580|SPH-M610|SPH-M620|SPH-M630|SPH-M800|SPH-M810|SPH-M850|SPH-M900|SPH-M910|SPH-M920|SPH-M930|SPH-N100|SPH-N200|SPH-N240|SPH-N300|SPH-N400|SPH-Z400|SWC-E100|SCH-i909|GT-N7100|GT-N7105|SCH-I535|SM-N900A|SGH-I317|SGH-T999L|GT-S5360B|GT-I8262|GT-S6802|GT-S6312|GT-S6310|GT-S5312|GT-S5310|GT-I9105|GT-I8510|GT-S6790N|SM-G7105|SM-N9005|GT-S5301|GT-I9295|GT-I9195|SM-C101|GT-S7392|GT-S7560|GT-B7610|GT-I5510|GT-S7582|GT-S7530E|GT-I8750|SM-G9006V|SM-G9008V|SM-G9009D|SM-G900A|SM-G900D|SM-G900F|SM-G900H|SM-G900I|SM-G900J|SM-G900K|SM-G900L|SM-G900M|SM-G900P|SM-G900R4|SM-G900S|SM-G900T|SM-G900V|SM-G900W8|SHV-E160K|SCH-P709|SCH-P729|SM-T2558|GT-I9205' THEN
        SET dType = 200;
        SET dTypeName = 'Phone';
        SET dBrand = 'Samsung';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;  

  /**LG**/
  ELSEIF userAgent REGEXP '\bLG\b;|LG[- ]?(C800|C900|E400|E610|E900|E-900|F160|F180K|F180L|F180S|730|855|L160|LS740|LS840|LS970|LU6200|MS690|MS695|MS770|MS840|MS870|MS910|P500|P700|P705|VM696|AS680|AS695|AX840|C729|E970|GS505|272|C395|E739BK|E960|L55C|L75C|LS696|LS860|P769BK|P350|P500|P509|P870|UN272|US730|VS840|VS950|LN272|LN510|LS670|LS855|LW690|MN270|MN510|P509|P769|P930|UN200|UN270|UN510|UN610|US670|US740|US760|UX265|UX840|VN271|VN530|VS660|VS700|VS740|VS750|VS910|VS920|VS930|VX9200|VX11000|AX840A|LW770|P506|P925|P999|E612|D955|D802)' THEN
        SET dType = 200;
        SET dTypeName = 'Phone';
        SET dBrand = 'LG';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF; 

  /**Sony**/
  ELSEIF userAgent REGEXP 'SonyST*|SonyLT*|SonyEricsson|SonyEricssonLT15iv|LT18i|E10i|LT28h|LT26w|SonyEricssonMT27i|C5303|C6902|C6903|C6906|C6943|D2533' THEN
        SET dType = 200;
        SET dTypeName = 'Phone';
        SET dBrand = 'Sony';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF; 
  
  /**Asus**/
  ELSEIF userAgent REGEXP 'Asus.*Galaxy|PadFone.*Mobile' THEN
        SET dType = 200;
        SET dTypeName = 'Phone';
        SET dBrand = 'Sony';
        SET os = 'Android';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF; 

  /**Windows**/
  ELSEIF userAgent REGEXP 'Windows Phone' THEN
        SET dType = 200;
        SET dTypeName = 'Phone';
        SET dBrand = 'Windows Phone';
        SET os = 'Windows';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Android Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF; 

  /*End Phone*/  
   
  /**Desktop**/
  /**Windows**/
  /**
  REF: https://msdn.microsoft.com/en-us/library/hh920767(v=vs.85).aspx
  **/
  ELSEIF userAgent REGEXP 'compatible|.NET' THEN
        SET dType = 100;
        SET dTypeName = 'Desktop';
        SET dBrand = 'Windows';
        SET os = 'Windows';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Safari Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSEIF userAgent REGEXP 'Trident|rv|compatible|MSIE' THEN
                SET bName = 'Internet Explorer';
        ELSE
                SET bName = 'Unknow';
        END IF;

  /**Mac OS X**/
  ELSEIF userAgent REGEXP 'Macintosh' THEN
        SET dType = 100;
        SET dTypeName = 'Desktop';
        SET dBrand = 'Mac OS X';
        SET os = 'Mac OS X';
        
        IF userAgent REGEXP 'Safari' THEN
                SET bName = 'Safari Browser';
        ELSEIF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSE
                SET bName = 'Unknow';
        END IF;
        
  /**Linux Like**/
  ELSEIF userAgent REGEXP 'Linux|Linux i*|Linux x*' THEN
        SET dType = 100;
        SET dTypeName = 'Desktop';
        SET dBrand = 'Linux';
        SET os = 'Linux';
        
        IF userAgent REGEXP 'Chrome' THEN
                SET bName = 'Google Chrome';
        ELSEIF userAgent REGEXP 'Firefox' THEN
                SET bName = 'Firefox';
        ELSE
                SET bName = 'Unknow';
        END IF;        
  ELSE
        SET dType = 900;
        SET dTypeName = 'Other';
        SET dBrand = 'Other';
        SET bName = 'Other';  
        SET os = 'Other';
                      
  END IF; /**End IF**/
  
  
  -- return success
  SELECT dType as deviceType, dTypeName as deviceTypeName, dBrand as deviceBrand, os as operatingSystem, bName as browserName;   
END //
DELIMITER ;


#CALL jN_ParseUserAgent('Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53',@deviceType,@deviceTypeName,@deviceBrand,@operatingSystem,@browserName)