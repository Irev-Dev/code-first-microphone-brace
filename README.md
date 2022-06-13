# Microphone brace

This repo is first of all a demo of a Code-first CAD pipline, and secondly is a brace for my microphone (needed something to demo).

![mic-photos](https://user-images.githubusercontent.com/29681384/173442178-0a78c227-26d1-4d2c-9fea-c7a23319518f.png)

![output](https://github.com/Irev-Dev/code-first-microphone-brace/releases/latest/download/output.png)

## Code-first?

In short it's a paradigm where designs are made from code, rather than made in a GUI, allowing for teams to leverage software development patterns. Think git, CI/CD pipelines and friends.

## What's happening here?

The source of truth for our brace is in `main.scad`. It uses [OpenSCAD](https://openscad.org/), which is long standing example of a modeling tool using a Code-first approach)

When changes are made to `main.scad` a github workflow is triggered that outputs our part as an STL and also generates a screen shot, then [KittyCAD](https://kittycad.io/) is used to convert to obj and step files.

Lastly all of these file are added to a [Github release](https://github.com/Irev-Dev/code-first-microphone-brace/releases). Meaning that we have we also get a history of how the output files have changes. We can also point to the latest release so that our documentation always stays up-to-date, i.e. this README has links for the lastest files

- [⬇️ stl](https://github.com/Irev-Dev/code-first-microphone-brace/releases/latest/download/output.stl)
- [⬇️ step](https://github.com/Irev-Dev/code-first-microphone-brace/releases/latest/download/output.step)
- [⬇️ obj](https://github.com/Irev-Dev/code-first-microphone-brace/releases/latest/download/output.obj)

And the rendered image above will also automatically update as changes are made to `main.scad`.

Have a look at [the workflow](https://github.com/Irev-Dev/code-first-microphone-brace/blob/main/.github/workflows/create-artifacts.yml) for the details.

## Is there more CAD automation you would like?

Aside from producing STLs and STEP files etc, the code-first paradigm lends itself to automatically producing BOMs, or running FEM and other simulations on parts as part of a pipeline, saving countless hours of re-work which is typical with GUI CAD packages.

If you're interested in this paradigm here are some links:
- [KittyCAD](https://kittycad.io/) is bulding Code-First APIs for hardware teams, and aim's is to make Code-First dream a reality. Read one of the co-founder's break down of the [history of CAD](https://medium.com/embedded-ventures/mechanical-cad-yesterday-today-and-tomorrow-981cef7e06b1).
- [Splitflap](https://github.com/scottbez1/splitflap) is another project that Leverages OpenSCAD as part of Github actions.
- The [OpenFlexure microscope](https://gitlab.com/openflexure/openflexure-microscope) also uses OpenSCAD in CI/CD pipelines, as well as the team publishing ["HardOps: utilising the software development toolchain for hardware design"](https://www.tandfonline.com/doi/full/10.1080/0951192X.2022.2028188)

## Building

In lieu of a package manager for OpenSCAD, run `dependencies.sh` or simply put [this file](https://raw.githubusercontent.com/Irev-Dev/Round-Anything/1.0.4/polyround.scad) into `lib/polyround.scad`

Then open `main.scad` with OpenSCAD as usual.
