
**(C) 2016 Jaguar Land Rover - All rights reserved.**<br>

All documents in this repository are licensed under the Creative
Commons Attribution 4.0 International (CC BY 4.0). Click
[here](https://creativecommons.org/licenses/by/4.0/) for details.
All code in this repository is licensed under Mozilla Public License
v2 (MPLv2). Click [here](https://www.mozilla.org/en-US/MPL/2.0/) for
details.

# RELEASE PROCESS
This document describes the process for creating a new version of the
signal specification.

The process, driven by the GENIVI Remote Vehicle Interaction Expert
Group (RVI EG), is aimed at being lightweight and carried out in public, giving both
GENIVI members and non-members a say in the creation of a new version.

In git, the ```develop``` branch is used as an integration branch
accepting pull requests with new and modified vpsec files from
contributors.

Pull requests are reviewed in the public genivi 
list ```genivi-projects@lists.genivi.org```. Once the review process
has concluded, the RVI EG decides if the pull request is to be
accepted or not.

A new signal specification release is created on a quarterly basis at
the following dates: Jan 1, Apr 1, Jul 1, Oct 1.

If no changes have been agreed upon since the last release of the
specification, the release is skipped and no new version is created.

A new release is made by merging the develop branch into master, and
then create a master branch tag named after the release
date such as ```rel_2016-04-01```.


