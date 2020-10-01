create table catalogdb.catwise2020 (
source_name char(21),
source_id char(25),
ra double precision,
dec double precision,
sigra real,
sigdec real,
sigradec real,
wx real,
wy real,
w1sky real,
w1sigsk real,
w1conf real,
w2sky real,
w2sigsk real,
w2conf real,
w1fitr real,
w2fitr real,
w1snr real,
w2snr real,
w1flux real,
w1sigflux real,
w2flux real,
w2sigflux real,
w1mpro real,
w1sigmpro real,
w1rchi2 real,
w2mpro real,
w2sigmpro real,
w2rchi2 real,
rchi2 real,
nb integer,
na integer,
w1Sat real,
w2Sat real,
w1mag real,
w1sigm real,
w1flg integer,
w1Cov real,
w2mag real,
w2sigm real,
w2flg integer,
w2Cov real,
w1mag_1 real,
w1sigm_1 real,
w1flg_1 integer,
w2mag_1 real,
w2sigm_1 real,
w2flg_1 integer,
w1mag_2 real,
w1sigm_2 real,
w1flg_2 integer,
w2mag_2 real,
w2sigm_2 real,
w2flg_2 integer,
w1mag_3 real,
w1sigm_3 real,
w1flg_3 integer,
w2mag_3 real,
w2sigm_3 real,
w2flg_3 integer,
w1mag_4 real,
w1sigm_4 real,
w1flg_4 integer,
w2mag_4 real,
w2sigm_4 real,
w2flg_4 integer,
w1mag_5 real,
w1sigm_5 real,
w1flg_5 integer,
w2mag_5 real,
w2sigm_5 real,
w2flg_5 integer,
w1mag_6 real,
w1sigm_6 real,
w1flg_6 integer,
w2mag_6 real,
w2sigm_6 real,
w2flg_6 integer,
w1mag_7 real,
w1sigm_7 real,
w1flg_7 integer,
w2mag_7 real,
w2sigm_7 real,
w2flg_7 integer,
w1mag_8 real,
w1sigm_8 real,
w1flg_8 integer,
w2mag_8 real,
w2sigm_8 real,
w2flg_8 integer,
w1NM integer,
w1M integer,
w1magP real,
w1sigP1 real,
w1sigP2 real,
w1k real,
w1Ndf integer,
w1mLQ real,
w1mJDmin double precision,
w1mJDmax double precision,
w1mJDmean double precision,
w2NM integer,
w2M integer,
w2magP real,
w2sigP1 real,
w2sigP2 real,
w2k real,
w2Ndf integer,
w2mLQ real,
w2mJDmin double precision,
w2mJDmax double precision,
w2mJDmean double precision,
rho12 integer,
q12 integer,
nIters integer,
nSteps integer,
mdetID integer,
p1 real,
p2 real,
MeanObsMJD double precision,
ra_pm double precision,
dec_pm double precision,
sigra_pm real,
sigdec_pm real,
sigradec_pm real,
PMRA real,
PMDec real,
sigPMRA real,
sigPMDec real,
w1snr_pm real,
w2snr_pm real,
w1flux_pm real,
w1sigflux_pm real,
w2flux_pm real,
w2sigflux_pm real,
w1mpro_pm real,
w1sigmpro_pm real,
w1rchi2_pm real,
w2mpro_pm real,
w2sigmpro_pm real,
w2rchi2_pm real,
rchi2_pm real,
pmcode char(7),
nIters_pm integer,
nSteps_pm integer,
dist real,
dw1mag real,
rch2w1 real,
dw2mag real,
rch2w2 real,
elon_avg double precision,
elonSig real,
elat_avg double precision,
elatSig real,
Delon real,
DelonSig real,
Delat real,
DelatSig real,
DelonSNR real,
DelatSNR real,
chi2pmra real,
chi2pmdec real,
ka integer,
k1 integer,
k2 integer,
km integer,
par_pm real,
par_pmSig real,
par_stat real,
par_sigma real,
dist_x real,
cc_flags char(16),
w1cc_map integer,
w1cc_map_str char(20),
w2cc_map integer,
w2cc_map_str char(20),
n_aw integer,
ab_flags char(9),
w1ab_map integer,
w1ab_map_str char(13),
w2ab_map integer,
w2ab_map_str char(13),
glon double precision,
glat double precision,
elon double precision,
elat double precision,
unwise_objid char(20)
);
