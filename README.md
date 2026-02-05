## thinker config

Thinker is a simple hypr+waybar config

**Installation** 

You have 2 variants: 
 - Use install script
 - Manual installation

In any case, you need to copy the repository first

```bash
$ git clone https://github.com/CobaltFrog/thinker-dotfiles.git
```
- Installation using a script:
```bash
$ cd thinker-dotfiles
# to be sure what you can run the script,
# make the file executable
$ chmod +x ./install.sh
$ ./install.sh
```

This script will move your previous configuration to `~/.config/.config.back` and also will create symlinks to directories located in the cloned repository. 

- Manual installation 
```bash
# move previous configuration to backup directory
# example:
$ cd ~/.config
$ mkdir ./.backup
$ mv ./hypr/ ./.backup/
```
```bash
# create symlinks in your .config directory to repository configuration
$ cd <cloned_repo_path>
$ ln -sf $(pwd)/alacritty ~/.config/
$ ln -sf $(pwd)/btop ~/.config/
$ ln -sf $(pwd)/dunst ~/.config/
$ ln -sf $(pwd)/hypr ~/.config/
$ ln -sf $(pwd)/superfile ~/.config
$ ln -sf $(pwd)/waybar ~/.config
$ ln -sf $(pwd)/wofi ~/.config
```
