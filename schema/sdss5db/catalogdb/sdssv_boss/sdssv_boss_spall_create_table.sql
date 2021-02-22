-- Based on the information in the below fits file
-- spAll-master.fits

create table catalogdb.sdssv_boss_spall (
    programname text, --  format = '12a'
    chunk text, --  format = '17a'
    survey text, -- format = '7A'
    platequality text, --  format = '4a'
    platesn2 real, --  format = 'e'
    deredsn2 real, --  format = 'e'
    primtarget integer, --  format = 'j'
    sectarget integer, --  format = 'j'
    lambda_eff real, --  format = 'e'
    bluefiber integer, --  format = 'j'
    zoffset real, --  format = 'e'
    xfocal real, --  format = 'e'
    yfocal real, --  format = 'e'
    specprimary smallint, --  format = 'b'
    specboss smallint, --  format = 'b'
    boss_specobj_id integer, --  format = 'j'
    nspecobs smallint, --  format = 'i'
    calibflux real[5], --  format = '5e'
    calibflux_ivar real[5], --  format = '5e'
    gaia_bp real, --  format = 'e'
    gaia_rp real, --  format = 'e'
    gaia_g real, --  format = 'e'
    firstcarton text, --  format = '48a'
    mag real[5], --  format = '5e'
    plate smallint, --  format = 'i'
    designid smallint, -- format = 'I'
    nexp smallint, --  format = 'i'
    exptime smallint, --  format = 'i'
    airmass real, --  format = 'e'
    healpix integer, -- format = 'J'
    healpixgrp smallint, -- format = 'I'
    healpix_dir text, -- format = '68A'
    mjd_final real, -- format = 'E'
    mjd_list text, -- format = '23A'
    catalogid bigint, --  format = 'k'
    sdssv_boss_target0 bigint, --  format = 'k'
    field integer, --  format = 'j'
    tile integer, --  format = 'j'
    mjd integer, --  format = 'j'
    fiberid integer, --  format = 'j'
    run2d text, --  format = '6a'
    run1d text, --  format = '6a'
    objtype text, --  format = '16a'
    plug_ra double precision, --  format = 'd'
    plug_dec double precision, --  format = 'd'
    class text, --  format = '6a'
    subclass text, --  format = '21a'
    z real, --  format = 'e'
    z_err real, --  format = 'e'
    rchi2 real, --  format = 'e'
    dof integer, --  format = 'j'
    rchi2diff real, --  format = 'e'
    tfile text, --  format = '24a'
    tcolumn integer[10], --  format = '10j'
    npoly integer, --  format = 'j'
    theta real[10], --  format = '10e'
    vdisp real, --  format = 'e'
    vdisp_err real, --  format = 'e'
    vdispz real, --  format = 'e'
    vdispz_err real, --  format = 'e'
    vdispchi2 real, --  format = 'e'
    vdispnpix real, --  format = 'e'
    vdispdof integer, --  format = 'j'
    wavemin real, --  format = 'e'
    wavemax real, --  format = 'e'
    wcoverage real, --  format = 'e'
    zwarning integer, --  format = 'j'
    sn_median real[5], --  format = '5e'
    sn_median_all real, --  format = 'e'
    chi68p real, --  format = 'e'
    fracnsigma real[10], --  format = '10e'
    fracnsighi real[10], --  format = '10e'
    fracnsiglo real[10], --  format = '10e'
    spectroflux real[5], --  format = '5e'
    spectroflux_ivar real[5], --  format = '5e'
    spectrosynflux real[5], --  format = '5e'
    spectrosynflux_ivar real[5], --  format = '5e'
    spectroskyflux real[5], --  format = '5e'
    anyandmask integer, --  format = 'j'
    anyormask integer, --  format = 'j'
    spec1_g real, --  format = 'e'
    spec1_r real, --  format = 'e'
    spec1_i real, --  format = 'e'
    elodie_filename text, --  format = '16a'
    elodie_object text, --  format = '9a'
    elodie_sptype text, --  format = '12a'
    elodie_bv real, --  format = 'e'
    elodie_teff real, --  format = 'e'
    elodie_logg real, --  format = 'e'
    elodie_feh real, --  format = 'e'
    elodie_z real, --  format = 'e'
    elodie_z_err real, --  format = 'e'
    elodie_z_modelerr real, --  format = 'e'
    elodie_rchi2 real, --  format = 'e'
    elodie_dof integer, --  format = 'j'
    z_noqso real, --  format = 'e'
    z_err_noqso real, --  format = 'e'
    znum_noqso integer, --  format = 'j'
    zwarning_noqso integer, --  format = 'j'
    class_noqso text, --  format = '6a'
    subclass_noqso text, --  format = '21a'
    rchi2diff_noqso real, --  format = 'e'
    specobjid bigint --  format = 'k'
);
