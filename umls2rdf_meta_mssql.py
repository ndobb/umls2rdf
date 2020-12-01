#! /usr/bin/env python

DEBUG = False

import codecs
import sys
import os
import urllib
import collections
import pyodbc
import pdb
import time
from string import Template
from functools import reduce
from urllib import parse

try:
    import conf
except:
    raise

PREFIXES = """
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .
@prefix owl:  <http://www.w3.org/2002/07/owl#> .
@prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix umls: <http://bioportal.bioontology.org/ontologies/umls#> .

"""

ONTOLOGY_HEADER = Template("""
<$uri>
    a owl:Ontology ;
    rdfs:comment "$comment" ;
    rdfs:label "$label" ;
    owl:imports <http://www.w3.org/2004/02/skos/core> ;
    owl:versionInfo "$versioninfo" .

""")

UMLS_URL = "http://bioportal.bioontology.org/ontologies/umls"
STY_URL = "http://bioportal.bioontology.org/ontologies/umls/sty"
HAS_STY = "umls:sty"
HAS_AUI = "umls:aui"
HAS_CUI = "umls:cui"
HAS_TUI = "umls:tui"

MRCONSO_CODE = 13
MRCONSO_AUI = 7
MRCONSO_STR = 14
MRCONSO_STT = 4
MRCONSO_SCUI = 9
MRCONSO_ISPREF = 6
MRCONSO_TTY = 12
MRCONSO_TS = 2
MRCONSO_CUI = 0

# http://www.nlm.nih.gov/research/umls/sourcereleasedocs/current/SNOMEDCT/relationships.html
MRREL_AUI1 = 1
MRREL_AUI2 = 5
MRREL_CUI1 = 0
MRREL_CUI2 = 4
MRREL_REL = 3
MRREL_RELA = 7

MRDEF_AUI = 1
MRDEF_DEF = 5
MRDEF_CUI = 0

MRSAT_CUI = 0
MRSAT_CODE = 5
MRSAT_ATV = 10
MRSAT_ATN = 8

MRDOC_DOCKEY = 0
MRDOC_VALUE = 1
MRDOC_TYPE = 2
MRDOC_DESC = 3

MRRANK_TTY = 2
MRRANK_RANK = 0

MRSTY_CUI = 0
MRSTY_TUI = 1

MRSAB_LAT = 19

UMLS_LANGCODE_MAP = {"eng" : "en", "fre" : "fr", "cze" : "cz", "fin" : "fi", "ger" : "de", "ita" : "it", "jpn" : "jp", "pol" : "pl", "por" : "pt", "rus" : "ru", "spa" : "es", "swe" : "sw", "scr" : "hr", "dut" : "nl", "lav" : "lv", "hun" : "hu", "kor" : "kr", "dan" : "da", "nor" : "no", "heb" : "he", "baq" : "eu"}

def __get_connection():
    return pyodbc.connect('Driver={SQL Server};Server=127.0.0.1;Database=' + conf.DB_NAME + ";Trusted_Connection=yes;")

def get_umls_url(code):
    return "%s%s"%(conf.UMLS_BASE_URI,code)

def get_cuis(con, sabs_of_interest):
    query = "SELECT CUI, TTY, SAB, STR FROM dbo.MRCONSO WHERE LAT = 'ENG' AND SAB IN (" + (",").join([ f"'{s}'" for s in sabs_of_interest ]) + ')'
    cursor = con.cursor()
    cuis = {}
    sys.stdout.write("[UMLS-Query] %s\n" % query)
    sys.stdout.flush()
    for rec in cursor.execute(query):
        cui, tty, sab, name = rec[0], rec[1], rec[2], rec[3]
        if cui in cuis:
            cuis[cui]['ttys'].append({ 'tty': tty, 'name': name, 'sab': sab })
        else:
            cuis[cui] = { 'tuis': [], 'ttys': [{ 'tty': tty, 'name': name, 'sab': sab }] }
    cursor.close()

    return cuis

def add_stys(con, cuis):
    query = 'SELECT CUI, TUI, STY FROM dbo.MRSTY'
    cursor = con.cursor()
    sys.stdout.write("[UMLS-Query] %s\n" % query)
    sys.stdout.flush()
    for rec in cursor.execute(query):
        cui, tui, sty = rec[0], rec[1], rec[2]
        if cui in cuis:
            cuis[cui]['tuis'].append(tui)
            
    cursor.close()

    return cuis

def get_pref_label(concept):
    pref = [ x for x in concept['ttys'] if x['tty'] == 'PT' and x['sab'] == 'SNOMEDCT_US' ]
    if any(pref):
        return pref[0]['name']
    pref = [ x for x in concept['ttys'] if x['sab'] == 'SNOMEDCT_US' ]
    if any(pref):
        return pref[0]['name']
    pref = [ x for x in concept['ttys'] if x['tty'] == 'PT' ]
    if any(pref):
        return pref[0]['name']
    pref = [ x for x in concept['ttys'] if x['tty'] in {'NM','SCN','HX'} ]
    if any(pref):
        return pref[0]['name']
    return concept[0]['name']


if __name__ == "__main__":
    con = __get_connection()
    with open("umls.conf","r") as fconf:
        sabs = []
        umls_conf_tmp = [line.split(",")[0] for line in fconf.read().splitlines() if len(line) > 0 and not line.startswith('#')]
        for l in umls_conf_tmp:
            if ';' in l:
                for d in l.split(';'):
                    sabs.append(d)
            else:
                sabs.append(l)

    if not os.path.isdir(conf.OUTPUT_FOLDER):
        raise Exception("Output folder '%s' not found."%conf.OUTPUT_FOLDER)

    cuis = get_cuis(con, sabs)
    cuis = add_stys(con, cuis)

    with open(os.path.join(conf.OUTPUT_FOLDER, 'UMLS.ttl'),'w+') as fout:

        # Prefixes
        fout.write(PREFIXES)

        # Ontology
        comment = "RDF Version of the UMLS ontology; " +\
                  "converted with the UMLS2RDF tool " +\
                  "(https://github.com/ncbo/umls2rdf), "+\
                  "developed by the NCBO project."
        header_values = dict(
           label = "UMLS",
           comment = comment,
           versioninfo = conf.UMLS_VERSION,
           uri = UMLS_URL+"#"
        )
        fout.write(ONTOLOGY_HEADER.substitute(header_values))

        # CUIs
        for k, cui in cuis.items():
            pref_label = get_pref_label(cui)
            rdf_term = """<%s#%s> a owl:Class ;\n"""%(UMLS_URL, k)
            rdf_term += """\t%s \"\"\"%s\"\"\" ;\n"""%("skos:prefLabel", pref_label+"@en")
            rdf_term += """\t%s \"\"\"%s\"\"\"^^xsd:string ;\n"""%("skos:notation", k)
            for tui in set(cui['tuis']):
                rdf_term += """\t%s <%s#%s> ;\n"""%(HAS_STY, get_umls_url("STY"), tui)
            rdf_term += " .\n\n"
            fout.write(rdf_term)