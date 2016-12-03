This repository contain tools for Linux development environment.

# How to Use

1. Clone this repository
2. Execute `./devtools/scripts/gear-fourth`   

# Tools provided

## Dotfiles

+ **Ag**    
   In file `dotfiles/.ag`.    
   This provides ag command for searching a given pattern.
   
+ **Aliases**   
   In file `dotfiles/.aliases`.   
   This creates alias/shortcut to commonly used commands.   
   e.g. `vif() { vim find . -name $1 }`   
   Executing `vif <filename>` in command line will find the file and open it in vim.

+ **Bash Prompt**   
   In file `dotfiles/.bashprompt`.   
   This changes the user prompt in the command line to the following structure:   
   `<username>@<hostname>: <directory>`       
   e.g. `root@kents-centos: ~/Workspace/trunk/nca/Device/Network`   

+ **bashrc**   
   In file `dotfiles/.bashrc`.   
   This is the default script run for every instance of bash.   
   It loads the rest of the dotfiles and set environment variables.

+ **Compilers.**   
   In file `dotfiles/.compiler`.   
   This creates alias/shortcut to various compiler commands.   
   e.g. `alias mkmdic="make PRODUCT=MADRID TARGET=ICE"`   
   Executing `mkmdic` in command line will perform `make PRODUCT=MADRID TARGET=ICE`

+ **GDB Init.**   
   In file `dotfiles/.gdbinit`.   
   This contains set of default commands for each execution of gdb.  
   Commands are specific for NCA Dry-ICE Testing.
   
+ **Git Autocompletion**   
   In file `dotfiles/.gitauto`.   
   This is **not yet available**. The target is to provide completion routines for the following:
   * git subcommands   
   * local and remote branch/tag names   
   
   e.g.   
   
```    
   $ git che<TAB>   
   $ git checkout   
   $ git checkout featu<TAB>   
   $ git checkout feature-nca_porting   
```    
+ **Git Configuration**   
   In file `dotfiles/.gitconfig`.   
   This is the configuration file used for all git repositories.   
   It contains the following configurations: 
   * git aliases for common commands and difficult commands to remember.   
   * color configuration for different kinds of output
   * location of the main `.gitignore` file (`excludesfile`)
   * location of the main git templates directory (`templatedir`)
   
+ **Git Hooks Configuration.**   
   In file `dotfiles/.githooks`.   
   This contains the environment variables that are used for git hooks.  
   
+ **Git Ignore List.**    
   In file `dotfiles/.gitignore`.   
   This contains the list of files that will not be tracked by git. 
   
+ **Trash**   
   In file `dotfiles/.trash`.   
   This provides `tp` command as substitute to `rm` command to avoid accidental removal of files.  
   `tp` command moves files intended to be removed to a `.trash-bin` directory.   
   `rm` command is also disabled to promote usage of `tp` command.   
   
+ **Up**   
   In file `dotfiles/.up`.   
   This provides `up` command which enables to traverse up the current working path easily.   
   e.g.   

```
   root@VM_DG13: ~/Workspace/cinc_trunk/nca/Device/Network/netblelib   
   $ up 3   
   root@VM_DG13: ~/Workspace/cinc_trunk/nca   
   $     
```

+ **vimrc**   
   In file `dotfiles/.vimrc`.   
   This contains configurations and functions for vim. 

## Git Hooks

+ **Pre-commit**   
   In `git_template/hooks/pre-commit`.   
   This contains default pre-commit hook to be used for all git repositories.   
   This is executed before git starts commit process.    
   It currently executes `shinhye` script.
   
+ **Pre-push**   
   In `git_template/hooks/pre-push`.   
   This contains default pre-push hook to be used for all git repositories.   
   This is executed before git starts push process.   
   It currently executes `hyojoo` script.

## Scripts

+ **Marcos Ulol**   
   In `scripts/marcos`.   
   This cleans `~/.trash-bin` directory used to store "removed" files using `tp` command.    
   
+ **Make/remove ctags**   
   In `scripts/mktags` and `scripts/rmtags`.   
   This contains script to make and remove tags that can be used to jump to symbol definitions when using vim.

+ **Oyih.**   
   In `scripts/oyih`.   
   This contains script to update svn repository to a given revision number.     
   Sample usage: `oyih 14344`    
   This is currently used on NCA code base from any CINC repository.    
   Local modifications are saved to a patch file before actual udpate and applied after update.    
   Conflicts are saved in `~/conflicts.log`.    
   Git repositories inside are also backed-up before update and restored after udpate.    
   Tags are created for the whole code base after udpate using `scripts/mktags`.    
   In order to use the latest Nightly Build Update, you can use a command similar to the following:      
   e.g. `command | xargs oyih`  

+ **Shinhye.**   
   In `scripts/shinhye`.   
   This contains script to perform NCA/XPT compilation.  
   It is currently used in `pre-commit` git hook. If compilation fails, git will abort commit.    
   Both NCA/XPT compilation are enabled by default.   
   To temporarily disable, set the corresponding environment variable to 0.  
   `NCA` for NCA compilation, `ICE` for NCA-ICE compilation, `BOARD` for NCA-BOARD compilation,    
   `XPT` for XPT compilation.    
   e.g. `export NCA=0`    
   
+ **Hyojoo.**   
   In `scripts/hyojoo`.   
   This contains another script to perform NCA/XPT compilation.  
   In particular, it performs linking for NCA and creation of package for XPT.   
   It is currently used in `pre-push` git hook. If compilation fails, git will abort push.    
   Both NCA/XPT compilation are enabled by default.   
   To temporarily disable, set the corresponding environment variable to 0.  
   `NCA` for NCA compilation, `ICE` for NCA-ICE compilation, `BOARD` for NCA-BOARD compilation,    
   `XPT` for XPT compilation.    
   e.g. `export NCA=0`    
   
+ **Ada**  
   In `scripts/ada`.   
   This contains script to update all git repositories tracked in `~/.gitrepos` file.  
   `~/.gitrepos` file is populated everytime `gcl` command is used to clone a repository.    
   To add an old repository to track, add a new line for the directory of the repository. 
   
+ **Saitama** the One-run-script  
   In `scripts/saitama`.   
   This contains script that may be used by Jenkins to execute the following tasks:   
   * Update git repositories using Ada
   * Clean trash-bin using Marcos Ulol
   * Update svn repositories using Oyih   

   Logs of Saitama's one-run-script execution will be saved in `~/.logs/jenkins` directory.

