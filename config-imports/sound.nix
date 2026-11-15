{ config, lib, pkgs, ... }:

# ====================
#        Sound
# ====================

{
  security.rtkit.enable = true; # To prevent PipeWire from having latency, this enables real-time priority
  services.pipewire = {
    enable = true;
    alsa.enable = true; # Enables Alsa for backward compatibility
    alsa.support32Bit = true; # Enables support for 32bits
    pulse.enable = true; # Enables PulseAudio for backward compatibility
  };
}
