{ pkgs }: {
	deps = [
    pkgs.unzip
    pkgs.php74
    pkgs.mariadb
    pkgs.wp-cli
	];
}