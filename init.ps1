#Windows�p�����ݒ�X�N���v�g
#Git Bash���K�v
#���O�ɊǗ��Ҍ����Ńp���[�V�F�����J���C"?Set-ExecutionPolicy RemoteSigned"�����s
#���ϐ�HOME���ݒ肪�K�v

if($HOME -eq $null){exit}
git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
.\set_setting.ps1
