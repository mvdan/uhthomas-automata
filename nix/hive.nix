{
  defaults = ./defaults.nix;

  "5dc508ed7c" = { name, nodes, ... }: {
    imports = [ ./pillowtalk/5dc508ed7c ];

    deployment = {
      targetHost = "${name}.starjunk.net.beta.tailscale.net";
      tags = [ "pillowtalk" ];
    };

    networking.hostName = name;
  };

  d9294fd26f = { name, nodes, ... }: {
    imports = [ ./pillowtalk/d9294fd26f ];

    deployment = {
      targetHost = "${name}.starjunk.net.beta.tailscale.net";
      tags = [ "pillowtalk" ];
    };

    networking.hostName = name;
  };
}
