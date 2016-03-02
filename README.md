(C) 2016 Jaguar Land Rover - All rights reserved.

All documents in this repository are available under the Creative
Commons Attribution 4.0 International (CC BY 4.0).

Click [here](https://creativecommons.org/licenses/by/4.0/) for
details.

All code in this repository is available under Mozilla Public License
v2 (MPLv2).

Click [here](https://www.mozilla.org/en-US/MPL/2.0/) for details.

# VEHICLE SIGNAL SPECIFICATION
This repository specifies a set of vehicle signals that can be used in
automotive applications to communicate the state of various vehicle
systems.

The collection of signal specifications, or simply signals, are vendor
independent. Vendor-specific extensions can be specified in a dediceated and
uncontrolled branch of the signal specification tree. 

The format of the directories and signal specification files is aimed
at allowing easy, git-based management with branching, merging, and
release.

A released signal specification can be used, together with tools in
this repository, to automatically generate a number of different
target specification formats, such as JSON, FrancaIDL, etc.

The release management process will be driven in the context of GENIVI
and its Remote Vehicle Interaction expert group.

# SIGNAL DEFINITION

A signal is a named entity, such as rpm, that at any time can have a
value, such as 3400.

Signals are organized into a tree such as outlined below.

![Signal tree](pics/tree.png)<br>
*Fig 1. A signal tree example*

## SIGNAL TYPE
Each signal specifies a type from the following set (from FrancaIDL):

Name       | Type                       | Min  | Max 
-----------|----------------------------|------|---
UInt8      | unsigned 8-bit integer     |0     | 255
Int8       | signed 8-bit integer       | -128 | 127
UInt16     | unsigned 16-bit integer    |  0   | 65535 
Int16      | signed 16-bit integer      | -32768 | 32767
UInt32     | unsigned 32-bit integer    | 0 | 4294967295
Int32      | signed 32-bit integer      | -2147483648 | 2147483647
UInt64     | unsigned 64-bit integer    | 0    | 2^64
Int64      | signed 64-bit integer      | -2^63 | 2^63 - 1
Boolean    | boolean value              | 0/false | 1/true
Float      | floating point number      | -3.4e -38 | 3.4e 38
Double     | double precision floating point number | -1.7e -300 | 1.7e 300
String     | character string           | n/a  | n/a
ByteBuffer | buffer of bytes (aka BLOB) | n/a | n/a

## SIGNAL RANGE [OPTIONAL]
A signal can optionally be specified with a min and max limit,
defining a range that the signal can assume a value within.

## SIGNAL ENUMERATION [OPTIONAL]
A signal can optionally be specified with a set of allowed values that
the signal can take, effectively turning it into an enumerator.  The
values are of the same type as the signal itself.

## SIGNAL UNIT TYPE [OPTIONAL]
A signal can optionally specify a unit type from the following set:

Unit type  | Domain | Description
-----------|--------|-------------
kph        | Speed       | Kilometers per hour
celsius    | Temperature | Degrees celsius
mbar       | Pressure    | millibar
percent    | Percent     | Percent
hz         | frequency   | Frequency
lat        | position    | Decimal latitude 
lon        | position    | Decimal longitude
millimeter | distance    | Millimeter
meter      | distance    | Meter
kilometer  | distance    | Kilometer
[more to come] | ... | ...


## SIGNAL NAMING CONVENTION
Signals are named, left-to-right, from the root of the signal tree
toward the signal itself. Each element in the name is deliniated with
a period (".") .

In Fig 1 above the left mirror heated signal would be:

    body.mirrors.left.heated




# SIGNAL SPECIFICATION FORMAT

## ENTRY

### TYPE
### INTERVAL
### ENUMERATION

## FILE

## INCLUDE DIRECTIVES

# TOOLS

# SPECIFICATION VERSIONING

## BRANCHING
## RELEASES
