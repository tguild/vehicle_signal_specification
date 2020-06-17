---
title: "Instances"
date: 2019-07-31T15:27:36+02:00
weight: 5
---

As VSS resembles primarily the physical structure of the vehicle. So
quite often  you'll find repetitions of branches and data entries
(e.g. doors, axles, etc), which leads to:
1. Hard-coded repetitions in the specification.
2. Span-out of the tree from the top, without gaining much information to it.
3. Issues with instance driven implementations, which might use the specification.

![Example tree](/vehicle_signal_specification/images/instances.png?width=60pc)


Moreover, they're dynamic and depend heavily on the vehicle type. To
overcome these issues, instances are introduced as a concept. In its
core, it defines the instances at the node, where they occur and keeps the
core concepts of the taxonomy together and spans out, where it's needed.
The URI, as the path from the root to the data entry, determines its
identifier. For the concept itself (e.g. a single tire), it stays stable.
From there you can then address the single resources.


## Definition

1. An instance can be defined in any branch or data entry.
2. The instantiation is done for every data entry in the following path.
3. Instances are defined with the key-word `instances`, followed by its
   definition, which can be either:
   * a list of strings, where each element defines a single instance, e.g.
     `['Left','Right']` results into two instances of every following
     data entry in the path, named `Left` and `Right`
   * a string, followed by a range, which defines the number of instances:
     `Position[1,4]` results into 4 instances of every following
     data entry in the path, named `Position1`, `Position2`, `Position3`
     and `Position4`.
4. If multiple instances occur in one node or on the path to a data entry,
   the instances get combined, by the order of occurrence. Following the example above, for each instance `Left` and `Right`, 4 position
   instances shall be created, addressed by the dot-notation.


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
Vehicle.Cabin.Door.IsOpen
Vehicle.Cabin.Door.IsOpen.Row1
Vehicle.Cabin.Door.IsOpen.Row1.Left
Vehicle.Cabin.Door.IsOpen.Row1.Right
Vehicle.Cabin.Door.IsOpen.Row2
Vehicle.Cabin.Door.IsOpen.Row2.Left
Vehicle.Cabin.Door.IsOpen.Row2.Right
Vehicle.Cabin.Door.IsOpen.Row3
Vehicle.Cabin.Door.IsOpen.Row3.Left
Vehicle.Cabin.Door.IsOpen.Row3.Right
Vehicle.Cabin.Door.IsOpen.Row4
Vehicle.Cabin.Door.IsOpen.Row4.Left
Vehicle.Cabin.Door.IsOpen.Row4.Right
```
