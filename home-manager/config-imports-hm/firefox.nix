{ config, pkgs, pkgs-unstable, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs-unstable.firefox;
    
    policies = {
      DisableTelemetry = true;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      GenerativeAI = {
        Enabled = false;
        Chatbot = false;
        LinkPreviews = false;
        TabGroups = false;
        Locked = true;
      };
      PasswordManagerEnabled = false;
      EnableTrackingProtection = {
        Value = true;
        BaselineExceptions = true;
        ConvenienceExceptions = true;
        Category = "strict";
      Extensions = {
        Install = [
          "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
        ];
      };
      };
    };
  };


}
