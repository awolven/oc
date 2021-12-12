* compile [swig-3.0.12](https://github.com/swig/swig/releases/tag/rel-3.0.12): you need replace  `swig-3.0.12/Source/Modules/cffi.cxx`with the cffi.cxx file from `oc/util/cffi.cxx`

* generating `oc.lisp`, `oc_wrap.cxx` by command `swig -cffi -c++ oc.i`, the `oc_wrap.cxx` file have some issue can be fixed by manually change code.

* run `cd ./util & ./build.sh` to generate `oc.so` file.

example code with sbcl:
```
* (asdf:load-system :oc)
* (defvar a-bottle (oc::make-bottle))
A-BOTTLE
* (describe a-bottle)
#<OC::TOPODS-COMPOUND {10022D9FC3}>
  [standard-object]
Slots with :INSTANCE allocation:
  FF-POINTER                     = #.(SB-SYS:INT-SAP #X007BE530)
```

how to fixoc_wrap.cxx issue:

change this codes:

```
50896 | Vertex *) &((BRepBuilderAPI_MakeVertex const *)arg1)->Vertex();
51364 | opoDS_Wire *) &((BRepBuilderAPI_MakeWire const *)arg1)->Wire();
52899 | opoDS_Edge *) &((BRepBuilderAPI_MakeEdge const *)arg1)->Edge();
```

to: 

```
50896 | Vertex *) &(arg1)->Vertex();
51364 | opoDS_Wire *) &(arg1)->Wire();
52899 | opoDS_Edge *) &(arg1)->Edge();
```

This is some bug in cffi.cxx or swig itself as [issue#1](https://github.com/awolven/oc/issues/1#) mentions.