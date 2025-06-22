{ username, ... }:

{
  services.nfs.server = {
    enable = true;
    exports = ''
      /home/${username}/shared 192.168.1.0/24(rw,sync,no_subtree_check)
    '';
  };
}
