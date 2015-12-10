# Introduction

*...what, who, when, where...*

# DAIA in a nutshell

*...overview of purpose and specification...*

[@DAIA]

# A brief history of DAIA

*...how did it come, which roads traveled...*

## Motivation and creation

...

## Evangelism and success

...

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

- ng-daia [@ngdaia]
  has already been presented in code4lib journal [@AngularJS2014].

- Suprisingly low interest in Koha, given it is both Open Source
  (should encourage SOA) and written in Perl (DAIA modules are on CPAN)

- ... 

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

- ...

# References
