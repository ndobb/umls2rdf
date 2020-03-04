\W

DROP TABLE IF EXISTS MRCOLS;
CREATE TABLE MRCOLS (
    COL	varchar(40),
    DES	varchar(200),
    REF	varchar(40),
    MIN	int unsigned,
    AV	numeric(5,2),
    MAX	int unsigned,
    FIL	varchar(50),
    DTY	varchar(40)
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRCONSO;
CREATE TABLE MRCONSO (
    CUI	char(8) NOT NULL,
    LAT	char(3) NOT NULL,
    TS	char(1) NOT NULL,
    LUI	varchar(10) NOT NULL,
    STT	varchar(3) NOT NULL,
    SUI	varchar(10) NOT NULL,
    ISPREF	char(1) NOT NULL,
    AUI	varchar(9) NOT NULL,
    SAUI	varchar(50),
    SCUI	varchar(100),
    SDUI	varchar(100),
    SAB	varchar(40) NOT NULL,
    TTY	varchar(40) NOT NULL,
    CODE	varchar(100) NOT NULL,
    STR	text NOT NULL,
    SRL	int unsigned NOT NULL,
    SUPPRESS	char(1) NOT NULL,
    CVF	int unsigned
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRCUI;
CREATE TABLE MRCUI (
    CUI1	char(8) NOT NULL,
    VER	varchar(10) NOT NULL,
    REL	varchar(4) NOT NULL,
    RELA	varchar(100),
    MAPREASON	text,
    CUI2	char(8),
    MAPIN	char(1)
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRCXT;
CREATE TABLE MRCXT (
    CUI	char(8),
    SUI	varchar(10),
    AUI	varchar(9),
    SAB	varchar(40),
    CODE	varchar(100),
    CXN	int unsigned,
    CXL	char(3),
    MRCXTRANK	int unsigned,
    CXS	text,
    CUI2	char(8),
    AUI2	varchar(9),
    HCD	varchar(100),
    RELA	varchar(100),
    XC	varchar(1),
    CVF	int unsigned
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRDEF;
CREATE TABLE MRDEF (
    CUI	char(8) NOT NULL,
    AUI	varchar(9) NOT NULL,
    ATUI	varchar(11) NOT NULL,
    SATUI	varchar(50),
    SAB	varchar(40) NOT NULL,
    DEF	text NOT NULL,
    SUPPRESS	char(1) NOT NULL,
    CVF	int unsigned
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRDOC;
CREATE TABLE MRDOC (
    DOCKEY	varchar(50) NOT NULL,
    VALUE	varchar(200),
    TYPE	varchar(50) NOT NULL,
    EXPL	text
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRFILES;
CREATE TABLE MRFILES (
    FIL	varchar(50),
    DES	varchar(200),
    FMT	text,
    CLS	int unsigned,
    RWS	int unsigned,
    BTS	bigint
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRHIER;
CREATE TABLE MRHIER (
    CUI	char(8) NOT NULL,
    AUI	varchar(9) NOT NULL,
    CXN	int unsigned NOT NULL,
    PAUI	varchar(10),
    SAB	varchar(40) NOT NULL,
    RELA	varchar(100),
    PTR	text,
    HCD	varchar(100),
    CVF	int unsigned
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRHIST;
CREATE TABLE MRHIST (
    CUI	char(8),
    SOURCEUI	varchar(100),
    SAB	varchar(40),
    SVER	varchar(40),
    CHANGETYPE	text,
    CHANGEKEY	text,
    CHANGEVAL	text,
    REASON	text,
    CVF	int unsigned
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRMAP;
CREATE TABLE MRMAP (
    MAPSETCUI	char(8) NOT NULL,
    MAPSETSAB	varchar(40) NOT NULL,
    MAPSUBSETID	varchar(10),
    MAPRANK	int unsigned,
    MAPID	varchar(50) NOT NULL,
    MAPSID	varchar(50),
    FROMID	varchar(50) NOT NULL,
    FROMSID	varchar(50),
    FROMEXPR	text NOT NULL,
    FROMTYPE	varchar(50) NOT NULL,
    FROMRULE	text,
    FROMRES	text,
    REL	varchar(4) NOT NULL,
    RELA	varchar(100),
    TOID	varchar(50),
    TOSID	varchar(50),
    TOEXPR	text,
    TOTYPE	varchar(50),
    TORULE	text,
    TORES	text,
    MAPRULE	text,
    MAPRES	text,
    MAPTYPE	varchar(50),
    MAPATN	varchar(100),
    MAPATV	text,
    CVF	int unsigned
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRRANK;
CREATE TABLE MRRANK (
    MRRANK_RANK	int unsigned NOT NULL,
    SAB	varchar(40) NOT NULL,
    TTY	varchar(40) NOT NULL,
    SUPPRESS	char(1) NOT NULL
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRREL;
CREATE TABLE MRREL (
    CUI1	char(8) NOT NULL,
    AUI1	varchar(9),
    STYPE1	varchar(50) NOT NULL,
    REL	varchar(4) NOT NULL,
    CUI2	char(8) NOT NULL,
    AUI2	varchar(9),
    STYPE2	varchar(50) NOT NULL,
    RELA	varchar(100),
    RUI	varchar(10) NOT NULL,
    SRUI	varchar(50),
    SAB	varchar(40) NOT NULL,
    SL	varchar(40) NOT NULL,
    RG	varchar(10),
    DIR	varchar(1),
    SUPPRESS	char(1) NOT NULL,
    CVF	int unsigned
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRSAB;
CREATE TABLE MRSAB (
    VCUI	char(8),
    RCUI	char(8),
    VSAB	varchar(40) NOT NULL,
    RSAB	varchar(40) NOT NULL,
    SON	text NOT NULL,
    SF	varchar(40) NOT NULL,
    SVER	varchar(40),
    VSTART	char(8),
    VEND	char(8),
    IMETA	varchar(10) NOT NULL,
    RMETA	varchar(10),
    SLC	text,
    SCC	text,
    SRL	int unsigned NOT NULL,
    TFR	int unsigned,
    CFR	int unsigned,
    CXTY	varchar(50),
    TTYL	varchar(400),
    ATNL	text,
    LAT	char(3),
    CENC	varchar(40) NOT NULL,
    CURVER	char(1) NOT NULL,
    SABIN	char(1) NOT NULL,
    SSN	text NOT NULL,
    SCIT	text NOT NULL
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRSAT;
CREATE TABLE MRSAT (
    CUI	char(8) NOT NULL,
    LUI	varchar(10),
    SUI	varchar(10),
    METAUI	varchar(100),
    STYPE	varchar(50) NOT NULL,
    CODE	varchar(100),
    ATUI	varchar(11) NOT NULL,
    SATUI	varchar(50),
    ATN	varchar(100) NOT NULL,
    SAB	varchar(40) NOT NULL,
    ATV	text,
    SUPPRESS	char(1) NOT NULL,
    CVF	int unsigned
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRSMAP;
CREATE TABLE MRSMAP (
    MAPSETCUI	char(8) NOT NULL,
    MAPSETSAB	varchar(40) NOT NULL,
    MAPID	varchar(50) NOT NULL,
    MAPSID	varchar(50),
    FROMEXPR	text NOT NULL,
    FROMTYPE	varchar(50) NOT NULL,
    REL	varchar(4) NOT NULL,
    RELA	varchar(100),
    TOEXPR	text,
    TOTYPE	varchar(50),
    CVF	int unsigned
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRSTY;
CREATE TABLE MRSTY (
    CUI	char(8) NOT NULL,
    TUI	char(4) NOT NULL,
    STN	varchar(100) NOT NULL,
    STY	varchar(50) NOT NULL,
    ATUI	varchar(11) NOT NULL,
    CVF	int unsigned
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRXNS_ENG;
CREATE TABLE MRXNS_ENG (
    LAT	char(3) NOT NULL,
    NSTR	text NOT NULL,
    CUI	char(8) NOT NULL,
    LUI	varchar(10) NOT NULL,
    SUI	varchar(10) NOT NULL
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRXNW_ENG;
CREATE TABLE MRXNW_ENG (
    LAT	char(3) NOT NULL,
    NWD	varchar(100) NOT NULL,
    CUI	char(8) NOT NULL,
    LUI	varchar(10) NOT NULL,
    SUI	varchar(10) NOT NULL
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MRAUI;
CREATE TABLE MRAUI (
    AUI1	varchar(9) NOT NULL,
    CUI1	char(8) NOT NULL,
    VER	varchar(10) NOT NULL,
    REL	varchar(4),
    RELA	varchar(100),
    MAPREASON	text NOT NULL,
    AUI2	varchar(9) NOT NULL,
    CUI2	char(8) NOT NULL,
    MAPIN	char(1) NOT NULL
) CHARACTER SET utf8;

DROP TABLE IF EXISTS AMBIGSUI;
CREATE TABLE AMBIGSUI (
    SUI	varchar(10) NOT NULL,
    CUI	char(8) NOT NULL
) CHARACTER SET utf8;

DROP TABLE IF EXISTS AMBIGLUI;
CREATE TABLE AMBIGLUI (
    LUI	varchar(10) NOT NULL,
    CUI	char(8) NOT NULL
) CHARACTER SET utf8;

DROP TABLE IF EXISTS DELETEDCUI;
CREATE TABLE DELETEDCUI (
    PCUI	char(8) NOT NULL,
    PSTR	text NOT NULL
) CHARACTER SET utf8;

DROP TABLE IF EXISTS DELETEDLUI;
CREATE TABLE DELETEDLUI (
    PLUI	varchar(10) NOT NULL,
    PSTR	text NOT NULL
) CHARACTER SET utf8;

DROP TABLE IF EXISTS DELETEDSUI;
CREATE TABLE DELETEDSUI (
    PSUI	varchar(10) NOT NULL,
    LAT	char(3) NOT NULL,
    PSTR	text NOT NULL
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MERGEDCUI;
CREATE TABLE MERGEDCUI (
    PCUI	char(8) NOT NULL,
    CUI	char(8) NOT NULL
) CHARACTER SET utf8;

DROP TABLE IF EXISTS MERGEDLUI;
CREATE TABLE MERGEDLUI (
    PLUI	varchar(10),
    LUI	varchar(10)
) CHARACTER SET utf8;



ALTER TABLE MRCONSO ADD CONSTRAINT X_MRCONSO_PK PRIMARY KEY BTREE (AUI);
ALTER TABLE MRDEF   ADD CONSTRAINT X_MRDEF_PK   PRIMARY KEY BTREE (ATUI);
ALTER TABLE MRRANK  ADD CONSTRAINT X_MRRANK_PK  PRIMARY KEY BTREE (SAB,TTY);
ALTER TABLE MRREL   ADD CONSTRAINT X_MRREL_PK   PRIMARY KEY BTREE (RUI);
ALTER TABLE MRSAB   ADD CONSTRAINT X_MRSAB_PK   PRIMARY KEY BTREE (VSAB);
ALTER TABLE MRSAT   ADD CONSTRAINT X_MRSAT_PK   PRIMARY KEY BTREE (ATUI);
ALTER TABLE MRSTY   ADD CONSTRAINT X_MRSTY_PK   PRIMARY KEY BTREE (ATUI);