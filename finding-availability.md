# Introduction

*...what, who, when, where...*

When I started to work with actual library systems I was suprised by the lack of documented APIs...

The article first provides an overview of the current DAIA specification to
show purpose and properties of the API. The history of DAIA is then told to
show why it was created in the first place and which roads were traveled to 
finally reach at DAIA 1.0. Current applications are listed afterwards before
a a concluding summary and outlook.

# DAIA in a nutshell

*...overview of purpose and specification...*

real-time availability information

[@DAIA]

# A brief history of DAIA

## Motivation and creation

*...how did it come?...*

The Document Availability Information API originates in the age of Library 2.0
that some readers may remember as a time of hope and struggle.  Shortcomings
of online public access catalogs (OPAC) and library services had become so
obvious, compared to manifold possibilities of web techonologies, so there was
momentum for change and experiments.  This allowed the Hamburg State and
University Library to get three years of funding for a project to create some
kind of "Catalog 2.0". The development of **Project Beluga** and the resulting
discovery interface can be followed in its blog and presentations since
2007.^[See <http://beluga-blog.sub.uni-hamburg.de/> (in German).] The VZG as
service provider of Hamburg University libraries was asked to supply access to
the integrated library system (ILS).  I had just started to work at VZG with a
degree in library science and computer science, motivated to replace the
inaccessible library IT with service oriented architecture (SOA) and similar
buzz.^[See [@Voss2008] for another API developed during this time.].

DAIA web service was created in 2008 to provide clean access to real-time
availability information for the "next generation catalog" developed in
project Beluga. Based on use cases an API was discussed, implemented, and
defined by Anne Christensen from Beluga, Uwe Reh from HeBis library union
network^[HeBis uses the same ILS as GBV/VZG so he provided valuable
information about its data format and access. Ironically, the DAIA server for
Hamburg library was implemented and hosted by HeBis and although the library
is a customer of VZG. I take this cooperation as early lesson that library IT
developers can best work together if they are free to ignore politics.] and
me.

...

[@Christensen2010]: http://nbn-resolving.de/urn/resolver.pl?urn:nbn:de:0290-opus-8394

## Evangelism and Adoption

To promote the newly defined API, a lightning talk was given at the European
Library Automation Group (ELAG) conference 2009 [@elag2009] and DAIA was
presented at the annual German library conference [@bibtag2009].^[I remember 
even talking with some ILS vendors at the conference fair.]

Despite further efforts in DAIA documentation and publication of an open
source reference implementation [@DAIApm] the outcome was limited (only later
I realized that technical arguments are mostly fruitless because of an
ill-fated relationship between libraries and library IT vendors).

*...2010-2012...*

...locations in RDF (side-project)...

[@DAIA_0.5]

Over the years the central DAIA server of VZG was used more and more, but
signs of code smelll and software rot became undeniable.

- Prolem: code base directly origined from first prototype,
  implementation and specification being maintained by the same 
  person (me)

- Both server and specification had became too complex to quickly rewrite them
  from scratch. it was difficult the change the implementation without
  touching the main implementation and vice versa.

- Running system: no motivation to revise specification and/or implementation

- multiple output formats: complex without benefit. 

- retrospectively: DAIA tried to put two much data modeling into the
  specification (lesson learned: data modeling is important but should be
  invisible in the final product)

- ...

## With PAIA to DAIA 1.0

The final motivation to eventually finish DAIA 1.0 specification came with
implementation of another API for access to patron accounts: the Patrons
Account Information API (PAIA) was specified as complement to DAIA during
development of the mobile library application "BibApp" in 2012.^[See
<https://www.gbv.de/wikis/cls/BibApp> for a German overview of BibApp. The
application is available as Open Source at <https://github.com/gbv/bibapp-ios>
and <https://github.com/gbv/bibapp-android>.] Although PAIA is more complex
than DAIA, as it also includes authentification and write access, the
specification turned out to be but easier and cleaner than DAIA 0.5. 

Based on the specification of PAIA [@PAIA], a first PAIA server was
implemented by a contractor^[Creation and maintanance of BibApp is done by the
software company [effective WEBWORK](http://www.effective-webwork.de/) and
paid by all libraries that use BibApp while VZG provides APIs to their library
systems.] as simple wrapper to the library loan system and later replaced by a
second implementation with internal access to the ILS in 2013/2014.  Having a
module to directly access ILS functionality allowed us to think about
replacing the old DAIA server with a more robust implementation. This new
implementation of a DAIA server motivated a major revision of DAIA
specification.

## What's new in DAIA 1.0

*...comparision of DAIA 0.5 with DAIA 1.0...*

- Removal of options that had showed to be unnecessary over the years
  and addition of missing features.

- Maintaining backwards-compatibility as best as possible.

Main decicision: get rid of XML and RDF

# Applications

*...servers, clients, usage...*

## DAIA clients

The first use case and application of DAIA was Beluga...

Unfortunately Beluga was created when VuFind was not available yet, so
the project had to support its own code base.
...

The DAIA driver in VuFind has been created and improved collaboratively by
several VuFind users.

BibApp...

The JavaScript module ng-daia [@ngdaia] for use with the AngularJS framework
has already been presented in code4lib journal [@AngularJS2014].

Within VZG DAIA is also used for interlibrary-loan checking for selected
libraries.

KOBV...

...

No public use known so far (e.g. display in learning management systems or
reference managers) - one reason might be a lacking proactive publication of
the API by libraries


## DAIA servers

DAIA services have been implemented for several ILS so far. The supported ILS
are mainly used in Germany. All implementations have been created by ILS users
instead of being provided as official APIs by the ISL vendors.

The first DAIA server at VZG, wrapping the **LBS** ILS from OCLC (formerly
from PICA),^[<http://www.oclc.org/en-europe/lbs.html>] is being replaced by a
new implementation with direct access to the LBS database.  Parts of the first
server have been released as Perl modules at CPAN to facilitate the creation
of DAIA\ 0.5 wrappers [@DAIApm,@PlackDAIA].  DAIA servers for ILS
**Bibliotheca** (originally from BOND, now also
OCLC)^[<https://www.oclc.org/de-DE/bibliotheca.html>] and **Libero** from
LIB-IT^[<http://www.lib-it.de/produkte/libero.html>] have been created
independently as part of the Saxonian project finc.^[See <https://finc.info>
for project information, <https://github.com/finc/DaiaTheca> and
<https://github.com/finc/DaiaLibero> for DAIA servers implemented in Java.]
The Bibliotheksservice-Zentrum Baden-Württemberg (BSZ) provides DAIA servers
for their customers with ILS **aDIS/BMS** from
a|S|te|c^[<https://www.astec.de/>] and for **Koha**.^[See
<https://wiki.bsz-bw.de/doku.php?id=l-team:daia:start>] Both are implemented
as closed wrappers not integrated in the ILS, so neither Koha provides a
native DAIA service so far. The lack of interest within the Koha community
suprised me, given that the ILS is both Open Source and written in Perl just
like the public reference implementation of DAIA 0.5.

# Summary and outlook

...

- International adoption and independent implementations in other
  ILS? (VZG will probably implement DAIA at Kuali OLE but what about
  other sofware). More clients? 

- Make DAIA endpoints more popular also to third parties

- Rule learned: no API implementation without specification, no specification
  without implementation (at least of a client). Sure throw-away prototypes
  are still important but a fresh implementation from scratch is needed once
  the specification has been finished.

- difficulty of digital publications and licenses
  but if we cannot cleanly encode availability information for
  traditional, physical documents, how can be expect to do better
  with digital documents?

- ...

# References
