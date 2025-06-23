{ ... }: {
  systemd.services.wiki-js = {
    requires = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
  };
  services.wiki-js = {
    enable = true;
    settings.db = {
      db = "wiki-js";
      host = "/run/postgresql";
      type = "postgres";
      user = "wiki-js";
    };
  };
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "wiki-js" ];
    ensureUsers = [{
      name = "wiki-js";
      ensureDBOwnership = true;
    }];
  };
}
