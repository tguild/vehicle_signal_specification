---
title: "Instances"
date: 2019-07-31T15:27:36+02:00
weight: 5
---

As VSS resembles primarily the physical structure of the vehicle, so
quite often you'll find repetitions of branches and data entries
(e.g. doors, axles, etc), which leads to hard-coded repetitions of
branches and data entries in the specification. Instances remove the need of
repeating definitions, by defining at the node itself how often it occurs in
the resulting tree. They are meant as a short-cut in the specification and
interpreted by the tools.

![Example tree](/vehicle_signal_specification/images/instances.png?width=60pc)



## Definition

1. An instance can be defined in any branch.
2. The instantiation is done for every node in the following path.
3. Instances are defined with the key-word `instances`, followed by its
   definition, which can be either:
   * a list of strings, where each element defines a single instance, e.g.
     `['Left','Right']` results into two instances of every following
     data entry in the path, named `Left` and `Right`
   * a string, followed by a range defined through `[n..m]`, with `n,m` as integer and `n < m`, which defines the number of instances:
     `Position[1..4]` results into 4 instances of every following
     data entry in the path, named `Position1`, `Position2`, `Position3`
     and `Position4`.
4. If multiple instances occur in one node or on the path to a data entry,
   the instances get combined, by the order of occurrence. Following the example above,
   four position instances will be created for each of the 'Left' and 'Right' instances,
   resulting into a total number of 8 instances.

## Example

The example from above in the specification:

```YAML
# Cabin.vspec
- Door:
  type: branch
  instances:
    - Row[1,4]
    - ["Left","Right"]
  description: All doors, including windows and switches
#include SingleDoor.vspec Door


# SingleDoor.vspec

#
# Definition of a single door
#
- IsOpen:
  datatype: boolean
  type: actuator
  description: Is door open or closed
```

Results in the following dot-notated output:

```
Vehicle.Cabin.Door
Vehicle.Cabin.Door.Row1
Vehicle.Cabin.Door.Row1.Left
Vehicle.Cabin.Door.Row1.Left.IsOpen
Vehicle.Cabin.Door.Row1.Right
Vehicle.Cabin.Door.Row1.Right.IsOpen
Vehicle.Cabin.Door.Row2
Vehicle.Cabin.Door.Row2.Left
Vehicle.Cabin.Door.Row2.Left.IsOpen
Vehicle.Cabin.Door.Row2.Right
Vehicle.Cabin.Door.Row2.Right.IsOpen
Vehicle.Cabin.Door.Row3
Vehicle.Cabin.Door.Row3.Left
Vehicle.Cabin.Door.Row3.Left.IsOpen
Vehicle.Cabin.Door.Row3.Right
Vehicle.Cabin.Door.Row3.Right.IsOpen
Vehicle.Cabin.Door.Row4
Vehicle.Cabin.Door.Row4.Left
Vehicle.Cabin.Door.Row4.Left.IsOpen
Vehicle.Cabin.Door.Row4.Right
Vehicle.Cabin.Door.Row4.Right.IsOpen
```
