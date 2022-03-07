# minishell_42_WOB_fix
a script that insures full access to the readline library (workaround 42 Wob)

If you are a Student at 42 Wolfsburg, the current installation and linking of a required library is "solved in an unfortunate way"

this workaround should make the use of it possible, although the process tases a few steps and a few minutes to finish setting up.

TO DO:
run:
	bash fix.sh

Add
	-I $(HOME)/goinfre/.brew/opt/readline/include/ -L $(HOME)/goinfre/.brew/opt/readline/lib/ -lreadline
to the part of your Makefile that compiles your work

initial problem and solving Method:

In the current Setup of the 42 Wolfsburg infrastructure the library necessary to correctly compile and execute a minishell-project
is installed in a way that it malfunctions. I don't know the exact cause of this but the issue I found is that while compiling the
needed Header-Files of the library, those fall back on other header file of the sambe library, but cannot find them with relative
Paths and therefore mark them missing and obstruct function.
My current work around is to change the header files to include each other by the absolute path of our computers in order to avoid
this. But to do so I need to reinstall the library itself, which required Homebrew-Access, which we students don't have.
My current work around for this is to reinstall Homebrew on the local storage of the computer and change the include files in the
compilation later.
