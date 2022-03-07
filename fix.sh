#!/bin/bash

# in the current Setup of the 42 Wolfsburg infrastructure the library necessary to correctly compile and execute a minishell-project
# is installed in a way that it malfunctions. i don't know the exact cause of this but the issue i found is that while compiling the
# needed Header-Files of the library, those fall back on other header file of the sambe library, but cannot find them with relative
# Paths and therefore mark them missing and obstruct function.
# My current work around is to change the header files to include each other by the absolute path of our computers in order to avoid
# this. But to do so i need to reinstall the library itself, which required Homebrew-Access, which we students don't have.
# My current work around for this is to reinstall Homebrew on the local storage of the computer and change the include files in the
# compilation later.

rm -rf $HOME/goinfre/.brew

git clone --depth=1 https://github.com/Homebrew/brew $HOME/goinfre/.brew

echo 'export PATH=$HOME/goinfre/.brew/bin:$PATH' >> $HOME/goinfre/.zshrc

source $HOME/goinfre/.zshrc && brew update

brew install glfw

# replaces in readline.h

sed -i 's/#  include <readline/rlstdc.h>/#  include </Users/cdahlhof/goinfre/.brew/opt/readline/include/readline/rlstdc.h>' /Users/$USER/goinfre/.brew/opt/readline/include/readline/readline.h>
sed -i 's/#  include <readline/rltypedefs.h>/#  include </Users/cdahlhof/goinfre/.brew/opt/readline/include/readline/rltypedefs.h>' /Users/$USER/goinfre/.brew/opt/readline/include/readline/readline.h>
sed -i 's/#  include <readline/keymaps.h>/#  include </Users/cdahlhof/goinfre/.brew/opt/readline/include/readline/keymaps.h>' /Users/$USER/goinfre/.brew/opt/readline/include/readline/readline.h>
sed -i 's/#  include <readline/tilde.h>/#  include </Users/cdahlhof/goinfre/.brew/opt/readline/include/readline/tilde.h>' /Users/$USER/goinfre/.brew/opt/readline/include/readline/readline.h>

# replaces in keymaps.h

sed -i 's/#  include <readline/rlstdc.h>/#  include </Users/cdahlhof/goinfre/.brew/opt/readline/include/readline/rlstdc.h>' /Users/$USER/goinfre/.brew/opt/readline/include/readline/keymaps.h>
sed -i 's/#  include <readline/chardefs.h>/#  include </Users/cdahlhof/goinfre/.brew/opt/readline/include/readline/chardefs.h>' /Users/$USER/goinfre/.brew/opt/readline/include/readline/keymaps.h>
sed -i 's/#  include <readline/rltypedefs.h>/#  include </Users/cdahlhof/goinfre/.brew/opt/readline/include/readline/rlstdc.h>' /Users/$USER/goinfre/.brew/opt/readline/include/readline/keymaps.h>

# replaces in history.h

sed -i 's/#  include <readline/rlstdc.h>/#  include </Users/cdahlhof/goinfre/.brew/opt/readline/include/readline/rlstdc.h>' /Users/$USER/goinfre/.brew/opt/readline/include/readline/history.h>
sed -i 's/#  include <readline/rltypedefs.h>/#  include </Users/cdahlhof/goinfre/.brew/opt/readline/include/readline/rltypedefs.h>' /Users/$USER/goinfre/.brew/opt/readline/include/readline/history.h>

## CHANGES IN COMPILATION

# header file replacements

sed -i 's/# include <readline/readline.h>/# include </Users/cdahlhof/goinfre/.brew/opt/readline/include/readline/readline.h>' $PDW/minishell.h
sed -i 's/# include <readline/history.h>/# include </Users/cdahlhof/goinfre/.brew/opt/readline/include/readline/history.h>' $PDW/minishell.h

#for compiling use the include flag and the library path flag

-I /Users/$USER/goinfre/.brew/opt/readline/include/ 		-L /Users/$USER/goinfre/.brew/opt/readline/lib/ -lreadline 

