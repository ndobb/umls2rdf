\W

SET autocommit=0;
SET unique_checks=0;
SET foreign_key_checks=0;

load data local infile 'MRCOLS.RRF' into table MRCOLS fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@col,@des,@ref,@min,@av,@max,@fil,@dty)
SET COL = NULLIF(@col,''),
DES = NULLIF(@des,''),
REF = NULLIF(@ref,''),
MIN = NULLIF(@min,''),
AV = NULLIF(@av,''),
MAX = NULLIF(@max,''),
FIL = NULLIF(@fil,''),
DTY = NULLIF(@dty,'');

load data local infile 'MRCONSO.RRF' into table MRCONSO fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@cui,@lat,@ts,@lui,@stt,@sui,@ispref,@aui,@saui,@scui,@sdui,@sab,@tty,@code,@str,@srl,@suppress,@cvf)
SET CUI = @cui,
LAT = @lat,
TS = @ts,
LUI = @lui,
STT = @stt,
SUI = @sui,
ISPREF = @ispref,
AUI = @aui,
SAUI = NULLIF(@saui,''),
SCUI = NULLIF(@scui,''),
SDUI = NULLIF(@sdui,''),
SAB = @sab,
TTY = @tty,
CODE = @code,
STR = @str,
SRL = @srl,
SUPPRESS = @suppress,
CVF = NULLIF(@cvf,'');

/*
load data local infile 'MRCUI.RRF' into table MRCUI fields terminated by '|' lines terminated by '\n'
(@cui1,@ver,@rel,@rela,@mapreason,@cui2,@mapin)
SET CUI1 = @cui1,
VER = @ver,
REL = @rel,
RELA = NULLIF(@rela,''),
MAPREASON = NULLIF(@mapreason,''),
CUI2 = NULLIF(@cui2,''),
MAPIN = NULLIF(@mapin,'');
*/

/*
load data local infile 'MRCXT.RRF' into table MRCXT fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@cui,@sui,@aui,@sab,@code,@cxn,@cxl,@mrcxtrank,@cxs,@cui2,@aui2,@hcd,@rela,@xc,@cvf)
SET CUI = NULLIF(@cui,''),
SUI = NULLIF(@sui,''),
AUI = NULLIF(@aui,''),
SAB = NULLIF(@sab,''),
CODE = NULLIF(@code,''),
CXN = NULLIF(@cxn,''),
CXL = NULLIF(@cxl,''),
MRCXTRANK = NULLIF(@mrcxtrank,''),
CXS = NULLIF(@cxs,''),
CUI2 = NULLIF(@cui2,''),
AUI2 = NULLIF(@aui2,''),
HCD = NULLIF(@hcd,''),
RELA = NULLIF(@rela,''),
XC = NULLIF(@xc,''),
CVF = NULLIF(@cvf,'');
*/

load data local infile 'MRDEF.RRF' into table MRDEF fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@cui,@aui,@atui,@satui,@sab,@def,@suppress,@cvf)
SET CUI = @cui,
AUI = @aui,
ATUI = @atui,
SATUI = NULLIF(@satui,''),
SAB = @sab,
DEF = @def,
SUPPRESS = @suppress,
CVF = NULLIF(@cvf,'');

/*
load data local infile 'MRDOC.RRF' into table MRDOC fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@dockey,@value,@type,@expl)
SET DOCKEY = @dockey,
VALUE = NULLIF(@value,''),
TYPE = @type,
EXPL = NULLIF(@expl,'');
*/

/*
load data local infile 'MRFILES.RRF' into table MRFILES fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@fil,@des,@fmt,@cls,@rws,@bts)
SET FIL = NULLIF(@fil,''),
DES = NULLIF(@des,''),
FMT = NULLIF(@fmt,''),
CLS = NULLIF(@cls,''),
RWS = NULLIF(@rws,''),
BTS = NULLIF(@bts,'');
*/

/*
load data local infile 'MRHIER.RRF' into table MRHIER fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@cui,@aui,@cxn,@paui,@sab,@rela,@ptr,@hcd,@cvf)
SET CUI = @cui,
AUI = @aui,
CXN = @cxn,
PAUI = NULLIF(@paui,''),
SAB = @sab,
RELA = NULLIF(@rela,''),
PTR = NULLIF(@ptr,''),
HCD = NULLIF(@hcd,''),
CVF = NULLIF(@cvf,'');
*/

/*
load data local infile 'MRHIST.RRF' into table MRHIST fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@cui,@sourceui,@sab,@sver,@changetype,@changekey,@changeval,@reason,@cvf)
SET CUI = NULLIF(@cui,''),
SOURCEUI = NULLIF(@sourceui,''),
SAB = NULLIF(@sab,''),
SVER = NULLIF(@sver,''),
CHANGETYPE = NULLIF(@changetype,''),
CHANGEKEY = NULLIF(@changekey,''),
CHANGEVAL = NULLIF(@changeval,''),
REASON = NULLIF(@reason,''),
CVF = NULLIF(@cvf,'');
*/

/*
load data local infile 'MRMAP.RRF' into table MRMAP fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@mapsetcui,@mapsetsab,@mapsubsetid,@maprank,@mapid,@mapsid,@fromid,@fromsid,@fromexpr,@fromtype,@fromrule,@fromres,@rel,@rela,@toid,@tosid,@toexpr,@totype,@torule,@tores,@maprule,@mapres,@maptype,@mapatn,@mapatv,@cvf)
SET MAPSETCUI = @mapsetcui,
MAPSETSAB = @mapsetsab,
MAPSUBSETID = NULLIF(@mapsubsetid,''),
MAPRANK = NULLIF(@maprank,''),
MAPID = @mapid,
MAPSID = NULLIF(@mapsid,''),
FROMID = @fromid,
FROMSID = NULLIF(@fromsid,''),
FROMEXPR = @fromexpr,
FROMTYPE = @fromtype,
FROMRULE = NULLIF(@fromrule,''),
FROMRES = NULLIF(@fromres,''),
REL = @rel,
RELA = NULLIF(@rela,''),
TOID = @toid,
TOSID = NULLIF(@tosid,''),
TOEXPR = @toexpr,
TOTYPE = @totype,
TORULE = NULLIF(@torule,''),
TORES = NULLIF(@tores,''),
MAPRULE = NULLIF(@maprule,''),
MAPRES = NULLIF(@mapres,''),
MAPTYPE = @maptype,
MAPATN = NULLIF(@mapatn,''),
MAPATV = NULLIF(@mapatv,''),
CVF = NULLIF(@cvf,'');
*/

load data local infile 'MRRANK.RRF' into table MRRANK fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@mrrank_rank,@sab,@tty,@suppress)
SET MRRANK_RANK = @mrrank_rank,
SAB = @sab,
TTY = @tty,
SUPPRESS = @suppress;

load data local infile 'MRREL.RRF' into table MRREL fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@cui1,@aui1,@stype1,@rel,@cui2,@aui2,@stype2,@rela,@rui,@srui,@sab,@sl,@rg,@dir,@suppress,@cvf)
SET CUI1 = @cui1,
AUI1 = NULLIF(@aui1,''),
STYPE1 = @stype1,
REL = @rel,
CUI2 = @cui2,
AUI2 = NULLIF(@aui2,''),
STYPE2 = @stype2,
RELA = NULLIF(@rela,''),
RUI = @rui,
SRUI = NULLIF(@srui,''),
SAB = @sab,
SL = @sl,
RG = NULLIF(@rg,''),
DIR = NULLIF(@dir,''),
SUPPRESS = @suppress,
CVF = NULLIF(@cvf,'');

load data local infile 'MRSAB.RRF' into table MRSAB fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@vcui,@rcui,@vsab,@rsab,@son,@sf,@sver,@vstart,@vend,@imeta,@rmeta,@slc,@scc,@srl,@tfr,@cfr,@cxty,@ttyl,@atnl,@lat,@cenc,@curver,@sabin,@ssn,@scit)
SET VCUI = NULLIF(@vcui,''),
RCUI = @rcui,
VSAB = @vsab,
RSAB = @rsab,
SON = @son,
SF = @sf,
SVER = NULLIF(@sver,''),
VSTART = NULLIF(@vstart,''),
VEND = NULLIF(@vend,''),
IMETA = @imeta,
RMETA = NULLIF(@rmeta,''),
SLC = NULLIF(@slc,''),
SCC = NULLIF(@scc,''),
SRL = @srl,
TFR = NULLIF(@tfr,''),
CFR = NULLIF(@cfr,''),
CXTY = NULLIF(@cxty,''),
TTYL = NULLIF(@ttyl,''),
ATNL = NULLIF(@atnl,''),
LAT = NULLIF(@lat,''),
CENC = @cenc,
CURVER = @curver,
SABIN = @sabin,
SSN = @ssn,
SCIT = @scit;

load data local infile 'MRSAT.RRF' into table MRSAT fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@cui,@lui,@sui,@metaui,@stype,@code,@atui,@satui,@atn,@sab,@atv,@suppress,@cvf)
SET CUI = @cui,
LUI = NULLIF(@lui,''),
SUI = NULLIF(@sui,''),
METAUI = NULLIF(@metaui,''),
STYPE = @stype,
CODE = NULLIF(@code,''),
ATUI = @atui,
SATUI = NULLIF(@satui,''),
ATN = @atn,
SAB = @sab,
ATV = @atv,
SUPPRESS = @suppress,
CVF = NULLIF(@cvf,'');

/*
load data local infile 'MRSMAP.RRF' into table MRSMAP fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@mapsetcui,@mapsetsab,@mapid,@mapsid,@fromexpr,@fromtype,@rel,@rela,@toexpr,@totype,@cvf)
SET MAPSETCUI = @mapsetcui,
MAPSETSAB = @mapsetsab,
MAPID = @mapid,
MAPSID = NULLIF(@mapsid,''),
FROMEXPR = @fromexpr,
FROMTYPE = @fromtype,
REL = @rel,
RELA = NULLIF(@rela,''),
TOEXPR = @toexpr,
TOTYPE = @totype,
CVF = NULLIF(@cvf,'');
*/

load data local infile 'MRSTY.RRF' into table MRSTY fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@cui,@tui,@stn,@sty,@atui,@cvf)
SET CUI = @cui,
TUI = @tui,
STN = @stn,
STY = @sty,
ATUI = @atui,
CVF = NULLIF(@cvf,'');

/*
load data local infile 'MRXNS_ENG.RRF' into table MRXNS_ENG fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@lat,@nstr,@cui,@lui,@sui)
SET LAT = @lat,
NSTR = @nstr,
CUI = @cui,
LUI = @lui,
SUI = @sui;

load data local infile 'MRXNW_ENG.RRF' into table MRXNW_ENG fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@lat,@nwd,@cui,@lui,@sui)
SET LAT = @lat,
NWD = @nwd,
CUI = @cui,
LUI = @lui,
SUI = @sui;


load data local infile 'MRAUI.RRF' into table MRAUI fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@aui1,@cui1,@ver,@rel,@rela,@mapreason,@aui2,@cui2,@mapin)
SET AUI1 = @aui1,
CUI1 = @cui1,
VER = @ver,
REL = NULLIF(@rel,''),
RELA = NULLIF(@rela,''),
MAPREASON = @mapreason,
AUI2 = @aui2,
CUI2 = @cui2,
MAPIN = @mapin;

load data local infile 'AMBIGSUI.RRF' into table AMBIGSUI fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@sui,@cui)
SET SUI = @sui,
CUI = @cui;

load data local infile 'AMBIGLUI.RRF' into table AMBIGLUI fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@lui,@cui)
SET LUI = @lui,
CUI = @cui;
*/

load data local infile 'CHANGE/DELETEDCUI.RRF' into table DELETEDCUI fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@pcui,@pstr)
SET PCUI = @pcui,
PSTR = @pstr;

load data local infile 'CHANGE/DELETEDLUI.RRF' into table DELETEDLUI fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@plui,@pstr)
SET PLUI = @plui,
PSTR = @pstr;

load data local infile 'CHANGE/DELETEDSUI.RRF' into table DELETEDSUI fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@psui,@lat,@pstr)
SET PSUI = @psui,
LAT = @lat,
PSTR = @pstr;

load data local infile 'CHANGE/MERGEDCUI.RRF' into table MERGEDCUI fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@pcui,@cui)
SET PCUI = @pcui,
CUI = @cui;

load data local infile 'CHANGE/MERGEDLUI.RRF' into table MERGEDLUI fields terminated by '|' ESCAPED BY '' lines terminated by '\n'
(@plui,@lui)
SET PLUI = NULLIF(@plui,''),
LUI = NULLIF(@lui,'');

COMMIT;
SET autocommit=1;
SET unique_checks=1;
SET foreign_key_checks=1;