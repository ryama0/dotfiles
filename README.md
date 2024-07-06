# dotfiles
Configurations of UNIX Application

## setup
```bash
./install.sh
```

for uninstall
```bash
./uninstall.sh
```

### ssh
```bash
ln -s ${REPOISITORY_ROOT}/.ssh/${OS_NAME}_config ~/.ssh/config
```

### alacritty
```bash
ln -s ${REPOSITORY_ROOT}/alacritty/${OS_NAME}.toml ~/.alacritty.toml
```