
.. _target-selection-example:

How to use sdssdb for target selection
======================================

One of the tenets of SDSS-V is that target selection needs to be performed and documented in a way that is reproducible. That means that the product of target selection should not be a table of targets but instead an algorithm that, based on some standard inputs, produces the list of targets to observe.

To help with this endeavour we have ``catalogdb`` (part of the ``sdss5db`` database), which contains target catalogues from a variety of sources (SDSS, 2MASS, Gaia) as well as cross-match and helper tables. All target selection should happen *against* ``catalogdb``. Here we present an example of how to accomplish that using ``catalogdb`` and ``sdssdb``.


The Galactic Genesis Survey
---------------------------

The SDSS-V Galactic Genesis Survey aims to better understand Galactic formation by compiling data about the orbit, age, and abundances of stars across the Milky Way. In this case the target selection is quite simple:

    Observe all stars with :math:`H\lesssim 11` and :math:`(G-H)>3.5`

Here we need to use the 2MASS catalogue to get the H magnitudes and Gaia for the H-band magnitudes and astrometric information. Let's see how to accomplish that.

``catalogdb`` provides tables from Gaia DR2 (``Gaia_DR2``) and 2MASS (``TwoMassPSC``), as well as an already computed best-neighbour relational table. To start with, let's join these tables ::

    >>> from sdssdb.peewee.sdss5db.catalogdb import database, Gaia_DR2, TwoMassPSC, Gaia_DR2_TwoMass_Best_Neighbour, Gaia_DR2_Clean
    >>> gaia_tmass = Gaia_DR2.select().join(Gaia_DR2_TwoMass_Best_Neighbour).join(TwoMassPSC).limit(100)

The ``limit(100)`` allows us to test the expression without doing the full join, which may take hours. From each one of the Gaia sources we can access the Gaia information but also navigate to the best 2MASS match ::

    >>> g1 = gaia_tmass[0]
    >>> g1.phot_g_mean_mag  # G magnitude
    17.413
    >>> g1.tmass_best[0]
    <TwoMassPSC: 337808783>
    >>> g1.tmass_best[0].h_m  # H magnitude
    15.395

Here ``tmass_best`` uses ``Gaia_DR2_TwoMass_Best_Neighbour`` to return a list of the 2MASS sources associted with the instance of ``Gaia_DR2``. The list can be empty if there are no matches or even have more than one 2MASS target, depending on how the cross-match was done.

The next step is to add the target selection constraints ::

    >>> selection = Gaia_DR2.select().join(Gaia_DR2_TwoMass_Best_Neighbour).join(TwoMassPSC).where(TwoMassPSC.h_m < 11).where((Gaia_DR2.phot_g_mean_mag - TwoMassPSC.h_m) > 3.5).limit(100)

Quite simple! Let's improve things a bit. For Gaia ``catalogdb`` provides a "clean" table, i.e., a subset of the original table in which certain targets (e.g., those with bad astrometry, saturated, high proper motion) have alredy been rejected. By joining to that table we can make sure the resulting target selection also avoids them ::

    >>> selection_clean = Gaia_DR2.select().join(Gaia_DR2_Clean).switch(Gaia_DR2).join(Gaia_DR2_TwoMass_Best_Neighbour).join(TwoMassPSC).where(TwoMassPSC.h_m < 11).where((Gaia_DR2.phot_g_mean_mag - TwoMassPSC.h_m) > 3.5)

Note the use of `switch <http://docs.peewee-orm.com/en/latest/peewee/api.html?highlight=switch#ModelSelect.switch>`__ to return the pointer to ``Gaia_DR2`` before joining again with ``Gaia_DR2_TwoMass_Best_Neighbour``.

The ``SELECT`` statement for this query is ``Gaia_DR2``, which are returned as model class instances. From there we can navigate to all the relevant information, as we did to get ``h_m`` from the 2MASS table. To generate a list of targets to observe we are interested in only a few of the parameters (RA, declination, magnitude). We can select only those values and return the results as a list of tuples ::

    >>> galactic_genesis = Gaia_DR2.select(
        Gaia_DR2.source_id,
        TwoMassPSC.designation,
        Gaia_DR2.ra,
        Gaia_DR2.dec,
        Gaia_DR2.phot_g_mean_mag,
        TwoMassPSC.h_m).join(Gaia_DR2_Clean).switch(Gaia_DR2).join(Gaia_DR2_TwoMass_Best_Neighbour).join(TwoMassPSC).where(TwoMassPSC.h_m < 11, (Gaia_DR2.phot_g_mean_mag - TwoMassPSC.h_m) > 3.5)
    >>> list(galactic_genesis.limit(100).tuples())
    [(1866735487144411648,
      '21002432+3525317 ',
      315.101337448339,
      35.4254665619372,
      9.34731,
      5.224),
     (1866735688994546688,
      '21002769+3528065 ',
      315.115434580443,
      35.4684515624814,
      10.7767,
      7.232),
     (1869736363613931008,
      '20583835+3530225 ',
      314.660649460474,
      35.505858779861,
      14.0828,
      10.521),
     (1869764882197177984,
      '20575860+3551396 ',
      314.494113150012,
      35.8609520692133,
      12.0406,
      8.205),
      ... ]

From a list such as that one it's easy to create a new database table or FITS file with the target selection.


Using SQLAlchemy
----------------

.. warning:: At this time, there are not models implemented for ``sdss5db`` in SQLAlchemy.


Cone searches
-------------

``sdssdb`` provides a simple way of performing elliptical cone searches using `q3c <https://github.com/segasai/q3c>`__. Using the ``galactic_genesis`` query defined above, let's now get the targets within 1.5 degrees of :math:`(200, 40)` degrees ::

    >>> cone = galactic_genesis.where(Gaia_DR2.cone_search(200, 40, 1.5))
    >>> list(cone)
    [<Gaia_DR2: 1524783316445526016>,
     <Gaia_DR2: 1524577913928477568>,
     <Gaia_DR2: 1524637493714681216>,
     <Gaia_DR2: 1525140554643949568>]

Refer to the `~sdssdb.peewee.BaseModel.cone_search` documentation for more details.
