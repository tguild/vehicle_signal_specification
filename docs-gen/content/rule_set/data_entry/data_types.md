---
title: "Data Types"
date: 2019-08-04T11:11:48+02:00
weight: 1
---

Each [data entry](/vehicle_signal_specification/rule_set/data_entry) specifies a ```datatype``` from the following set (from FrancaIDL). Datatypes shall not be used in [branch entry](/vehicle_signal_specification/rule_set/branches)

## Supported datatypes

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


## Arrays

Besides the datatypes described above, VSS supports as well the concept of
`arrays`, as a *collection of elements based on the data entry
definition*, wherein it's specified. Arrays with a fixed number of elements
or variable in size are supported. The following syntax shall be used to declare an array:

```YAML
# undefined number of elements in an array
datatype: UInt32[]
# fixed number of elements in an array
datatype: UInt32[100]
```

Examples for the usage of `arrays` are status information about battery cells or a list of DTCs, which are present in a
vehicle.
