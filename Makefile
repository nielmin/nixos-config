.PHONY: update
update:
	sudo nixos-rebuild switch --upgrade

.PHONY: clean
clean:
	sudo nix-collect-garbage -d
