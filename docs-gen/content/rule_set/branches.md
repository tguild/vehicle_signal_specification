---
title: "Branch Entry"
date: 2019-07-31T15:27:36+02:00
weight: 1
---

A branch entry describes a tree branch (or node) containing other branches and
signals.

A branch entry example is given below:

```YAML
Trunk:
  type: branch
  description: All signals related to the rear trunk
  aggregate: false
```

The following elements are defined:

**`Body.Trunk`**  
The list element name defines the dot-notated signal name to the signal.
Please note that all parental branches included in the name must be defined as
well.

**```type```**  
The value ```branch``` specifies that this is a branch entry (as
opposed to a signal entry). This is the default, in case ```type``` is omitted.

**```description```**  
A description string to be included (when applicable) in the various
specification files generated from this branch entry.

**```aggregate```** *[optional]*  
Defines whether or not this branch is an aggregate.
If not defined, this defaults to ```false```.
An aggregate is a collection of signals that make sense to handle together in a system.
A typical example could be GNSS location, where latitude and longitude make sense to read
and write together. This is supposed to be deployment and tool specific,
and for that reason no branches are aggregates by default in VSS.