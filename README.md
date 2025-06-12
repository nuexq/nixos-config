<h1 align="center">
   <img src="https://files.artturin.com/files/nixoscolorful.svg" width="150px" /> 
   <br>
      A nixOS Configuration
   <br>
</h1>
<img alt="preview" src="https://github.com/user-attachments/assets/6b075f62-151d-4039-8e35-9325d8dfccf7"/>

## Components

- **Window Manager:** [Hyprland][Hyprland]  
- **Bar:** [Waybar][Waybar]  
- **Application Launcher:** [rofi][rofi]  
- **Notification Daemon:** [swaync][swaync]  
- **Terminal Emulator:** [Ghostty][Ghostty]  
- **Shell:** [zsh][zsh] + [starship][starship]  
- **Text Editor:** [Neovim][Neovim]  
- **File Manager:** [nemo][nemo] + [yazi][yazi]  
- **Fonts:** [Maple Mono NF][Maple Mono] + [JetBrainsMono NF][JetBrainsMono]  
- **Color Scheme:** [Catppuccin][Catppuccin]  
- **Lockscreen:** [Hyprlock][Hyprlock]  
- **Image Viewer:** [imv][imv]  
- **Media Player:** [mpv][mpv]  
- **Screenshot Software:** [grimblast][grimblast]  
- **Screen Recording:** [wf-recorder][wf-recorder]  
- **Clipboard:** [wl-clip-persist][wl-clip-persist]  
- **Color Picker:** [hyprpicker][hyprpicker]  

## Usage
> [!CAUTION]
> This setup changes system-level configs, which might not work the same on your machine.
Make sure you read and adjust everything before using it, I'm not responsible if something breaks.

You can run the `install.sh` script that will:
 - Replace my [hardware-configuration.nix](/hosts/NoPC/hardware-configuration.nix) with your `/etc/nixos/hardware-configuration.nix`.
 - Create basic direcotries (`Music`, `Documents`, `Developer`, `Pictures/wallpapers`).
 - Copy my [wallpapers](/wallpapers) to `~/Pictures/wallpapers`.
 - Building the system.

Or you can do this manually by removing my [hardware-configuration.nix](/hosts/NoPC/hardware-configuration.nix) and replacing it with yours in `/etc/nixos/hardware-configuration.nix` and then running:

```
sudo nix-rebuild switch --flakes .#NoPC
```

# Credits
Here are some dotfiles I learned from or borrowed ideas:
 - [Frost-Phoenix/nixos-config](https://github.com/Frost-Phoenix/nixos-config/): the starting point, and the base of this dotfiles.

<!-- Links -->
[Hyprland]: https://github.com/hyprwm/Hyprland
[Ghostty]: https://ghostty.org/
[starship]: https://starship.rs
[Waybar]: https://github.com/Alexays/Waybar
[rofi]: https://github.com/lbonn/rofi
[nemo]: https://github.com/linuxmint/nemo/
[yazi]: https://github.com/sxyazi/yazi
[zsh]: https://ohmyz.sh/
[Hyprlock]: https://github.com/hyprwm/hyprlock
[audacious]: https://audacious-media-player.org/
[mpv]: https://github.com/mpv-player/mpv
[Neovim]: https://github.com/neovim/neovim
[grimblast]: https://github.com/hyprwm/contrib
[imv]: https://sr.ht/~exec64/imv/
[swaync]: https://github.com/ErikReider/SwayNotificationCenter
[Maple Mono]: https://github.com/subframe7536/maple-font
[JetBrainsMono]: https://github.com/JetBrains/JetBrainsMono
[wl-clip-persist]: https://github.com/Linus789/wl-clip-persist
[wf-recorder]: https://github.com/ammen99/wf-recorder
[hyprpicker]: https://github.com/hyprwm/hyprpicker
[Catppuccin]: https://github.com/catppuccin
