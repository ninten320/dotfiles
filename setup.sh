DOT_FILES=(.zshrc .vimrc)

for file in ${DOT_FILES[@]}
do
  ln -sf ~/dotfiles/${file} ~/${file}
done
