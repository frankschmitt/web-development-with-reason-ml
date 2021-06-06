export BASEDIR=~/src/web-development-with-reason-ml/06-repeating-with-recursion
export SRCDIR=$BASEDIR/src
# vim session with source files
tmux "new-session" -s "dev" -d
tmux send-keys -t dev 'cd $SRCDIR' C-m
tmux send-keys -t dev 'vim *.res' C-m
# npm for automatic recompilation
tmux "split-window" -h -p 30
tmux send-keys -t dev 'cd $BASEDIR' C-m
tmux send-keys -t dev 'npm run start' C-m
# interactive console, for running scripts with node
tmux "split-window" -v
tmux send-keys -t dev 'cd $BASEDIR' C-m
tmux send-keys -t dev 'parcel build src/index.html --public-url ./ --no-minify' C-m

# attach to session
tmux attach -t "dev"

