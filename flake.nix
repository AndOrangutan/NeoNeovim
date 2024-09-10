{
  description = "My Personal Development Enviroment";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    # Import nixpkgs for the Linux system
    pkgs = import nixpkgs { system = "x86_64-linux"; };

    lsp_servers = with pkgs; [
      # pkgs.lua-language-server
    ];

    formatters = with pkgs; [
      # pkgs.prettier
    ];
    linters = with pkgs; [
      # pkgs.shellcheck  # Shell script linter
    ];
    plugins = with pkgs; [
      # pkgs.neovimPlugins.treesitter  # Example: Treesitter plugin for Neovim
      # pkgs.neovimPlugins.nvim-lspconfig  # Example: LSP configuration plugin
    ];

    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = lsp_servers ++ formatters ++ linters ++ plugins;
      };
      packages.x86_64-linux.default = pkgs.neovim;
    };
}
