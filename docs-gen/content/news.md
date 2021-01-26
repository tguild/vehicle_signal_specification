---
title: "News"
date: 2019-07-31T12:11:31+02:00
weight: 2
---

### VSS Version 2.0 released

A new version of VSS has been released. 
The most important changes since Version 1.0 are:

#### Vehicle as new root node

Before, the tree of the specification started with an empty node, 
followed by an Attribute and a Signal branch.
Now the root node is called Vehicle and every following branch is attached to it.

#### Attribute and signal now elements of Data Entries

Attributes and Signals were branches before. 
Now they are elements of the Data Entries.
For more information, please consult the documentation.

#### Instances as branch elements

Instances were defined by duplication in the specification in Version 1.0.
Now they are defined as elements of a branch and recognized by the tooling.
The documentation helps you, by offering details on how it works in practice.

#### Tools repository

Tools reside now in the [vss-tools repository](https://github.com/GENIVI/vss-tools) and
are integrated in the Vehicle Signal Specification by using git sub-modules.


In case of problems, feel free to open a ticket on the github repository!


### Updated Documentation

Up to now the documentation was realized as readme within the repository.
Now it has moved to [GitHub Pages](http://genivi.github.io/vehicle_signal_specification/).
If you find an issue feel free raise an [issue](https://github.com/GENIVI/vehicle_signal_specification/issues) or
[contribute](/vehicle_signal_specification/tools/vss_documentation).
