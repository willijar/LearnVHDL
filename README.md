# Introduction to VHDL Design and Synthesis

This repository provides the starting template for students
to complete the practical exercises for my
the Introduction to VHDL Design and Synthesis course.

The primary aim of the practical exercies is to enable you to
design and implement digitals circuit using VHDL.

You will do this by implementing and testing separate components as
you go along and then combining them at the end to produce a finished
complete working system. As you go through the individual exercises
the amount of additional hints and support provided here decreases, and
you will be expected to be able to find things out for yourself.

As part of this process your will gain familiarity with:

* using a text editor (Visual Studio COde) to edit and save your source files;
* the VHDL tool chain;
* writing a simple test-benche and using testbenches and simulations to test your digital
  designs;
* using synthesis tools to generate bit files to program FPGAs.

The exercises require that you have installed [AMD Vivado Design Suite](https://www.amd.com/en/products/software/adaptive-socs-and-fpgas/vivado.html)
and [Microsoft Visual Studio Code](https://code.visualstudio.com/download) and that you are
using the [Basys3 Artix-7 FPGA Board](https://www.digikey.co.uk/en/product-highlight/d/digilent/basys3-artix-7-fpga-board).
Other boards using AMD FPGAs and  with equialent features can be used however you will need to modify the constraints (xdc) files to map the device pins to the VHDL signals, and change the partnumber specified in the file "Taskfile.yml".

You may use a recent Windows or Linux system supported by the Vivado design suite.

The advantages of using the Linux command line interface compared to using an integrated
development environment (IDE) which you may previously have used for
software development are:

* the command line tools are ubiquitous and widely used;
* the tools are generally more mature - tried,tested and proven;
* it is faster and more robust;
* you can use many of the same tools across different types of
  projects - you don't have to learn a different set of editor
  commands for every programming environment;
* it is easier to automate many tasks;
* it is therefore more efficient for larger complex systems.

Many of these skills are transferable to writing software code and so this
practical should be considered as general training to developing
software as well as hardware.

Both a Taskfile and a more traditional Makefile (Linux only) are provided to automate the analyzing, testing and synthesis of your designs and to hide many of the complex details of the Vivado tool-chain can be hidden allowing a focus on VHDL design in this course.

The more modern Taskfile provides better integration with VS Code via the Task extension which provides a list of the key tasks in the Explorer window,
and supports both Linux and Windows consistently and is now preferred, however makefiles are potentially more powerful and flexible.

While the Vivado GUI IDE supports more advanced features such as live
debugging, and optimizing and visualizing timing and power handling
these are not needed  in this introductory course. The proprietary Vivado
gui is not well-designed and is very complex to learn to use.

I recommend commiting and pushing your work onto github
regularly, at least at the end of every practical session but also
every time you have completed one of the tasks.

To do this:

* Go to the "Source Control" panel in Visual Studio Code.
* Select the changed files you want to push from the changes list
      (I suggest selecting all) and the "Commit and Sync" Option.
