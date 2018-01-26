DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "$DIR/common.lib"

echo "Start test"
printStart "printStart"
echo "Current dir is: " $DIR
printEnd "printResult"
echo "End test"
