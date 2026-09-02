{ ... }:
{
  networking.nftables = {
    enable = true;
    tables.filter = {
      family = "inet";
      content = ''
        chain input {
          type filter hook input priority 0; policy drop;

          iif lo accept
          iifname "virbr0" accept

          ct state {established, related} accept

          icmp type echo-request accept
        	icmpv6 type echo-request accept
        	icmpv6 type { nd-router-advert, nd-neighbor-solicit, nd-neighbor-advert } accept

        	tcp dport 22 accept
        }
      '';
    };
  };

  networking.firewall = {
    enable = true;
    backend = "nftables";
    trustedInterfaces = [ "virbr0" ];
  };
}
