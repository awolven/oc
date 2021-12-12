Users:

```
* # to run:

* # install sbcl.

* git clone git@github.com:awolven/oc.git

* # no need to install opencascade, as the binaries for version 7.1.0 are included

* sbcl # currently only sbcl is supported, but only for minor reasons which will change in the future

* (asdf:load-system :oc) ;; whatever method you use to load an asdf system

* (oc::make-bottle)
#<OC::TOPODS-COMPOUND {10022D9FC3}>

* ;; oc has no graphics, see https://github.com/awolven/cl-vulkan and https://github.com/awolven/VkTk if you need a graphics subsystem.

* ;; oc has bindings for generating meshes from solids which you can feed into opengl/vulkan/metal.
```

Developers:

```
* cd oc

* git submodule update --recursive --init # this downloads a custom swig build

* cd util

* # modify or add .i files as desired

* generate.sh # or generate.bat for Windows

* # known bug with cffi.cxx or swig:

* build.sh

* # look for this error in the output and change respective lines in oc_wrap.cxx

50896 | Vertex *) &((BRepBuilderAPI_MakeVertex const *)arg1)->Vertex();
51364 | opoDS_Wire *) &((BRepBuilderAPI_MakeWire const *)arg1)->Wire();
52899 | opoDS_Edge *) &((BRepBuilderAPI_MakeEdge const *)arg1)->Edge();

to: 

50896 | Vertex *) &(arg1)->Vertex();
51364 | opoDS_Wire *) &(arg1)->Wire();
52899 | opoDS_Edge *) &(arg1)->Edge();

* build.sh # rebuild this time without the casting errors

* # Add or edit lisp files as needed to wrap raw overloads and create your CLOS (or other) lispy interface

* # run lisp, re-load system and test