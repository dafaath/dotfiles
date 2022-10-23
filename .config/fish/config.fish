if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
set PATH ~/.local/bin $PATH
set PATH ~/Documents/Account $PATH
set PATH ~/go/bin $PATH
set PATH /opt/upscaler $PATH
set PATH /Apps/butler $PATH
set PATH /home/dafaath/Project/Analgor_Grading $PATH
set VISUAL lvim
set EDITOR lvim
bash -c 'eval "$(pyenv init --path)"'
starship init fish | source
