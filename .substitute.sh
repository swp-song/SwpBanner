CURRENT_PATH=`pwd`
HEADER_PATH="/SwpBanner/Code/Core/"
INCLUD_PATH="/SwpBanner/Code/include/"

function CreateSubstitute() {
    
    local ROOT_PATH=$CURRENT_PATH
    local INPOT_PATH=$ROOT_PATH$HEADER_PATH
    local OUT_PATH=$ROOT_PATH$INCLUD_PATH

    if [ -d $OUT_PATH ]; then
        rm -rf "$OUT_PATH" 
    fi

    mkdir "$OUT_PATH"
    
    cd $INPOT_PATH
    echo $INPOT_PATH
    #  for all .h file 
    for file in *.h; do
        #  Make a stand-in
        ln -s "$file" $OUT_PATH$file
    done
    
    cd $ROOT_PATH

    echo "END"   
}

CreateSubstitute