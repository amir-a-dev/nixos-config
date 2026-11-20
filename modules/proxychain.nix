{config, ...}: {
  programs.proxychains = {
    enable = true;

    # Speed optimizations
    quietMode = true;
    proxyDNS = true;
    remoteDNSSubnet = 224;
    tcpReadTimeOut = 2000; # Faster timeouts
    tcpConnectTimeOut = 1500;
    localnet = "192.168.0.0/16"; # Don't proxy local traffic

    # Strict chain (fastest)
    chain.type = "dynamic";

    proxies.tor = {
      type = "socks5";
      host = "127.0.0.1";
      port = 9050;
    };
  };
}
