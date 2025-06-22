{ username, ... }:

{
  services.samba = {
    enable = true;
    shares = {
      shared = {
        path = "/home/${username}/shared";
        browseable = true;
        writable = true;
        guestOk = false;
        validUsers = [ "nuexq" ];
      };
    };
  };
}

