{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
  name = "nvchad";
  targetPkgs = pkgs: 
  # NVChad prereqs
  (with pkgs; [ gcc python3 wget unzip ripgrep xsel ]) ++
  # C IDE
  (with pkgs; [ clang clang-tools cpplint pkg-config zlib ]) ++
  # Lua IDE
  (with pkgs; [ luarocks luajitPackages.luacheck stylua lua-language-server ])
  # Nix IDE (Remove cargo then garbage-collect to restore 700M+ from rust deps)
  # Actually don't use, it is not worth the hassle
  # ++ (with pkgs; [ cargo ])
  # EOD
  ;
  runScript = "./init";
}).env
