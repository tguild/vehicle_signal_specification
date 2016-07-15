**(C) 2016 Jaguar Land Rover - All rights reserved.**<br>

All documents in this repository are licensed under the Creative
Commons Attribution 4.0 International (CC BY 4.0). Click
[here](https://creativecommons.org/licenses/by/4.0/) for details.
All code in this repository is licensed under Mozilla Public License
v2 (MPLv2). Click [here](https://www.mozilla.org/en-US/MPL/2.0/) for
details.

# VEHICLE SIGNAL SPECIFICATION
This repository specifies a set of vehicle signals that can be used in
automotive applications to communicate the state of various vehicle
systems.

A standardized vehicle signal specification allows for an industry actor
to use a common naming space for communicating vehicle state and,
ultimately, allows the decoupling of the IVI stack from the underlying
vehicle electrical architecture.

The collection of signal specifications, or simply signals, is vendor
independent. Vendor-specific extensions can be specified in a dedicated and
uncontrolled branch of the signal specification tree.

The format of the directories and signal specification files is aimed
at allowing easy, git-based management with branching, merging, and
release. With this in mind, the signal specification can be broken up
into smaller files that can be edited and re-used while minimizing
merge conflicts.

A released signal specification can be used, together with tools in
this repository, to automatically generate a number of different
target specification formats, such as JSON, FrancaIDL, etc.

Below is a schematic showing the top-level process.

![Signal tree](pics/tools.png)<br>
*Fig 1. Generating documents from specification*


The tools are available under the ```tools``` directory.

The release management process will be driven in the context of GENIVI
and its Remote Vehicle Interaction expert group.

# BROWSE JSON VEHICLE SIGNAL SPECIFICATION
A variant of the vehicle signal specification is checked in
as ```vss_$VERSION.json```, where ```$VERSION``` is the content of
the ```VERSION``` file.

A web-based JSON viewer can be used to view the current version.

Click **[here](http://www.jsoneditoronline.org/?url=https://raw.githubusercontent.com/GENIVI/vehicle_signal_specification/develop/vss_rel_1.json)**


# CREATE JSON VEHICLE SIGNAL SPECIFICATION

Make sure that you have the python YAML parser, PyYAML, installed.

## INSTALL PYTHON YAML PARSER
On ubuntu:

    sudo apt-get install python-yaml

On non-ubuntu systems, install from:

    http://pyyaml.org/wiki/PyYAML


## RUN MAKE

    make

The results will be stored in ```vss_$VERSION.[xxx]```,
where ```$VERSION``` is the contents of the ```VERSION``` file and ```xxx``` is
the appropriate file extension for the type of output being produced.  For
example, the JSON version of the output will have a ```.json``` extension.

By default, the ```make``` processor will produce all of the currently
installed output formats.  If only a single format is desired, specify it as
an arguement.  For example, to generate only the json format, type:

    make json

# SIGNAL, BRANCH, AND ATTRIBUTE DEFINITION
Signals, branches, and attributes are organized into a tree such as outlined
below.

![Signal tree](pics/tree.png)<br>
*Fig 2. A signal tree example*


## <a name="branch-entry"/>BRANCH ENTRY
A branch is an entity that can host other branches, signals, and attributes.
A branch is identified as an entry with its signal type set to ```branch```.
The only required field for a branch is ```description```.

## <a name="signal-entry"/>SIGNAL ENTRY
A signal is a named entity, such as rpm, that can have a value, such as 3400,
at any given time.

### <a name="signal-type"/>SIGNAL TYPE
Each signal specifies a type from the following set (from FrancaIDL):

Name       | Type                       | Min  | Max
:----------|:---------------------------|:-----|:---
UInt8      | unsigned 8-bit integer     | 0    | 255
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

Please note that the special type ```branch``` denotes a branch, not a
signal. See the [branch entry](#branch-entry) chapter for details.


### <a name="signal-range"/>SIGNAL RANGE [OPTIONAL]
A signal can optionally be specified with a minimum and maximum limit,
defining the valid range that the signal can assume.

### <a name="signal-enumeration"/>SIGNAL ENUMERATION [OPTIONAL]
A signal can optionally be specified with a set of allowed values that
the signal can be assigned, effectively turning it into an enumerator.  The
values are of the same type as the signal itself.

### <a name="signal-unit-type"/>SIGNAL UNIT TYPE [OPTIONAL]
A signal can optionally specify a unit of measurement from the following set:
TO BE REPLACED BY SI REFERENCE.

Unit type  | Domain      | Description
:----------|:------------|:-------------
km/h       | Speed       | Kilometers per hour
celsius    | Temperature | Degrees Celsius
mbar       | Pressure    | millibar
percent    | Relation    | Percent
lat        | Position    | Decimal latitude
lon        | Position    | Decimal longitude
mm         | Distance    | Millimeter
m          | Distance    | Meter
km         | Distance    | Kilometer
rpm        | Frequency   | Rotations per minute
hz         | Frequency   | Frequency
W          | Power       | Watt
kW         | Power       | Kilowatt
kwh        | Power       | Kilowatt hours
ms         | Time        | Milliseconds
s          | Time        | Seconds
min        | Time        | Minutes
h          | Time        | Hours
g          | Weight      | Grams
kg         | Weight      | Kilograms
g/s        | Flow        | Grams per second
m/s        | Acceleration| Acceleration in meters per second
N          | Force       | Newton
Nm         | Force       | Torque
... | ... | ...


## <a name="attribute-entry"/>ATTRIBUTE ENTRY
An attribute is an entry, such as vehicle weight or fuel type, with a static
value. The difference between a signal and an attribute is that the signal has
a publisher (or producer) that continuously updates the signal value while an
attribute has a set value, defined in the specifiation, that never changes.

Please see chapter
[Mixing signals and attributes](#mixing-signals-and-attributes) for an
example of how attributes can be used.

### <a name="attribute-type"/>ATTRIBUTE TYPE
Each attribute specifies a type in the same way that a signal does.

### <a name="attribute-type"/>ATTRIBUTE VALUE
Each attribute specifies a static value of the correct type.

### <a name="attribute-unit-type"/>ATTRIBUTE UNIT TYPE [OPTIONAL]
An attribute can optionally specify a unit of measurement in the same way that
a signal does.

## SIGNAL NAMING CONVENTION
Signals are named, left-to-right, from the root of the signal tree
toward the signal itself. Each element in the name is delimited with
a period (".") .

In Fig 1 above the left mirror heated signal would be:

    body.mirrors.left.heated


If there are an array of elements, such as door 0 - 3, they will be
named with an index branch:

```
body.doors.0.lock
body.doors.0.windows_pos
body.doors.1.lock
body.doors.1.windows_pos
body.doors.2.lock
body.doors.2.windows_pos
body.doors.3.lock
body.doors.3.windows_pos
```


## PARENT NODES
If a signal is defined, all parent branches included in its name must
be included as well, as shown below:

```
[Signal] body.mirrors.left.heated
[Branch] body.mirrors.left
[Branch] body.mirrors
[Branch] body
```

The branches do not have to be defined in any specific order as long
as each branch component is defined somewhere in the vspec file (or an
included vspec file).

## <a name="mixing-signals-and-attributes"/>MIXING SIGNALS AND ATTRIBUTES
Items, such as which side the driver sits on, the vehicle weight, engine
displacement, and other configuration data can optionally be used with VSS.




# SIGNAL SPECIFICATION FORMAT
A signal specification is written as a flat YAML list, where each signal and
branch is a self-contained YAML list element.

The YAML list is a single file, called a *vspec* file.

A vspec can, in addition to a YAML list, also contain include directives.

An include directive refers to another vspec file that is to replace the
directive, much like ```#include``` in C/C++. Please note that, from a YAML
perspective, the include directive is just another comment.

## <a name="branch-entry"/>BRANCH ENTRY
A branch entry describes a tree branch (or node) containing other branches and
signals.

A branch entry example is given below:

```YAML
- body.door:
  type: branch
  aggregate: true
  description: Some description
```

The following elements are defined:

* **```body.door```**<br>
The list element name defines the dot-notated signal name to the signal.
Please note that all parental branches included in the name must be defined as
well.

* **```type```**<br>
The value ```branch``` specifies that this is a branch entry (as
opposed to a signal entry). This is the default, in case ```type``` is omitted.

* **```aggregate``` [optional]**<br>
Defines whether or not this branch is an aggregate. See
[aggregate branch](#aggregate-branch) chapter for more information.<br>
If not defined, this defaults to ```false```.

* **```description```**<br>
A description string to be included (when applicable) in the various
specification files generated from this branch entry.


## SIGNAL ENTRY
A signal entry defines a single signal and its attributes. A signal
entry example is given below:

```YAML
- chassis.transmission.speed:
	type: Uint16
	unit: km/h
	min: 0
	max: 300
	description: The vehicle speed, as measured by the drivetrain.
```

* **```chassis.transmission.speed```**<br>
Defines the dot-notated signal name of the signal. Please note that
all parental branches included in the name must be defined as well.

* **```type```**<br>
The string value of the type specifies the scalar type of the signal
value. See [signal type](#signal-type) chapter for a list of available types.

* **```min``` [optional]**<br>
The minimum value, within the interval of the given ```type```, that the
signal can be assigned.<br>
If omitted, the minimum value will be the "Min" value for the given type.<br>
Cannot be specified if ```enum``` is specified for the same signal entry.

* **```max``` [optional]**<br>
The maximum value, within the interval of the given ```type```, that the
signal can be assigned.<br>
If omitted, the maximum value will be the "Max" value for the given type.<br>
Cannot be specified if ```enum``` is specified for the same signal entry.

* **```unit``` [optional]**<br>
The unit of measurement that the signal has. See [Unit
Type](#signal-unit-type) chapter for a list of available unit types.<br> This
cannot be specified if ```enum``` is specified as the signal type.

* **```description```**<br>
A description string to be included (when applicable) in the various
specification files generated from this signal entry.


## ENUMERATED SIGNAL ENTRY
A signal can optionally be enumerated, allowing it to be assigned a value from a
specified set of values. An example of an enumerated signal is given below:


```YAML
- chassis.transmission.gear:
	type: Uint16,
	enum: [ -1, 1, 2, 3, 4, 5, 6, 7, 8 ]
	description: The selected gear. -1 is reverse.
```

An enumerated signal entry has no ```min```, ```max```, or ```unit```
element.

The ```enum``` element is an array of values, all of which must be specified
in the emum list.  This signal can only be assigned one of the values
specified in the enum list.
The ```type``` specifier is the type of the individual elements of the enum
list.


## <a name="aggregate-branch"/>AGGREGATE BRANCH
A branch entry's ```aggregate``` set to ```true``` indicates that any
updated signal hosted under the given branch should be distributed
together with all other signals hosted under the same branch, even if
the latter have not changed their values.

This allows for records containing multiple signals to be distributed
as an atomic unit by the Vehicle Signal Interface and other systems.

Below is an example of a complete specification describing a geospatial position:

```YAML
- nav:
  type: branch
  description: Navigational top-level branch.

- nav.location:
  type: branch
  aggregate: true
  description: The current location of the vehicle.

- nav.location.lat:
  type: Float
  description: Latitude.

- nav.location.lon:
  type: Float
  description: Longitude.

- nav.location.alt:
  type: Float
  description: Altitude.

```

The ```nav.location``` branch's ```aggregate``` member indicates that if any
of ```lat```, ```lon```, or ```alt``` are assiged a new value, all three
signals should be distrubuted as a single entity.


# VSPEC FILE FORMAT
Apart from YAML objects, a vspec file can have include directives, described
below.

## INCLUDE DIRECTIVE

An include directive in a vspec file will read the file it refers to and the
contents of that file will be inserted into the current buffer in place of the
include directive.  The included file will, in its turn, be scanned for
include directives to be replaced, effectively forming a tree of included
files.

See below for an example of such a tree.

**INSERT SCHEMATICS HERE**

The include directive has the following format:

    #include <filename> [prefix]

The ```<filename>``` part specifies the path, relative to the file with the
```#include``` directive, to the vspec file to replace the directive with.

The optional ```[prefix]``` specifies a branch name to be
prepended to all signal entries in the included file. This allows a vspec file
to be reused multiple times by different files, each file specifying their
own branch to attach the included file to.

An example of an include directive is:

    #include doors.vpsec chassis.doors

The ```door.vspec``` section specifies the file to include.

The ```chassis.doors``` section specifies that all signal entries in
```door.vspec``` should have their names prefixed with ```chassis.doors```.

If an included vspec file has branch or signal specifications that have
already been defined prior to the included file, the new specifications in the
included file will override the previous specifications.

Below is an example of two files, ```root.vspec```, and ```door.vspec```:


```YAML
#
# root.vspec
#
- chassis:
  type: branch
  description: All things chassis.

- chassis.doors:
  type: branch
  description: All doors.

- chassis.doors.front.left:
  type: branch
  description: Left front door.

- chassis.doors.front.right:
  type: branch
  description: Right front door.

- chassis.doors.rear.left:
  type: branch
  description: Left rear door.

- chassis.doors.rear.right:
  type: branch
  description: Right rear door.

#
# Include door.vspec four times, once
# for each door branch specified above.
#

#include door.vspec chassis.doors.front.left
#include door.vspec chassis.doors.front.right
#include door.vspec chassis.doors.rear.left
#include door.vspec chassis.doors.rear.right
```


```YAML
#
# door.vspec
#
- lock:
  type: Boolean
  description: Indicates if the door is locked (true), or not (false).

- window_pos:
  type: Uint8
  unit: percent
  min: 0
  max: 100
  description: Indicates the window position. 0 = closed. 100 = open
```

The two files above, once the ```#include``` directives have been
processed, will have the following specification.

```YAML
- chassis:
  type: branch
  description: All things chassis.

- chassis.doors:
  type: branch
  description: All doors.

- chassis.doors.front.left:
  type: branch
  description: Left front door.

- chassis.doors.front.right:
  type: branch
  description: Right front door.

- chassis.doors.rear.left:
  type: branch
  description: Left rear door.

- chassis.doors.rear.right:
  type: branch
  description: Right rear door.

#
# Include directive is replaced with file content and updated
# signal names.
#

#
# Left front door
#
- chassis.doors.front.left.lock:
  type: Boolean
  description: Indicates if the door is locked (true), or not (false).

- chassis.doors.front.left.window_pos:
  type: Uint8
  unit: percent
  min: 0
  max: 100
  description: Indicates the window position. 0 = closed. 100 = open

#
# Right front door
#
- chassis.doors.front.right.lock:
  type: Boolean
  description: Indicates if the door is locked (true), or not (false).

- chassis.doors.front.right.window_pos:
  type: Uint8
  unit: percent
  min: 0
  max: 100
  description: Indicates the window position. 0 = closed. 100 = open

#
# Left rear door
#
- chassis.doors.rear.left.lock:
  type: Boolean
  description: Indicates if the door is locked (true), or not (false).

- chassis.doors.rear.left.window_pos:
  type: Uint8
  unit: percent
  min: 0
  max: 100
  description: Indicates the window position. 0 = closed. 100 = open

#
# Right rear door
#
- chassis.doors.rear.right.lock:
  type: Boolean
  description: Indicates if the door is locked (true), or not (false).

- chassis.doors.rear.right.window_pos:
  type: Uint8
  unit: percent
  min: 0
  max: 100
  description: Indicates the window position. 0 = closed. 100 = open
```
