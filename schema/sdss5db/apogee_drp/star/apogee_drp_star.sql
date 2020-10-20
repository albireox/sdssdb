/*

APOGEE DRP Star information

*/

CREATE TABLE apogee_drp.star (
    PK SERIAL NOT NULL PRIMARY KEY,
    APOGEE_ID	text,
    FILE	text,
    URI         text,
    STARVER     text,
    MJDBEG      text,
    MJDEND	text,
    TELESCOPE	text,
    APRED_VERS  text,
    HEALPIX	text,
    SNR	real,
    RA	double precision,
    DEC	double precision,
    GLON	double precision,
    GLAT	double precision,
    JMAG	real,
    JMAG_ERR	real,
    HMAG	real,
    HMAG_ERR	real,
    KMAG	real,
    KMAG_ERR	real,
    SRC_H	text,
    AKTARG	real,
    AKMETHOD	text,
    AKWISE	real,
    SFD_EBV	real,
    APOGEE_TARGET1	integer,
    APOGEE_TARGET2	integer,
    APOGEE_TARGET3	integer,
    APOGEE2_TARGET1	integer,
    APOGEE2_TARGET2	integer,
    APOGEE2_TARGET3	integer,
    APOGEE2_TARGET4	integer,
    NVISITS		integer,
    STARFLAG	integer,
    ANDFLAG	integer,
    N_COMPONENTS	integer,
    VHELIOBARY	real,
    VSCATTER	real,
    VERR	real,
    RV_TEFF	real,
    RV_FEH	real,
    RV_LOGG	real,
    MEANFIB	real,
    SIGFIB	real,
    NRES	text,
    MODIFIED timestamp with time zone DEFAULT now() NOT NULL,
    UNIQUE(APRED_VERS,TELESCOPE,APOGEE_ID,STARVER)
);
