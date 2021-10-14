

CURRENT_PATH=`pwd`
HEADER_PATH="$CURRENT_PATH/SwpBanner/Code/Core/"

ABOUT="Dream"
VERSION="v4.0.0"
PROJECT_NAME="SwpBanner"
PWD=`pwd`
OUTPUT_PATH=$PWD

function CreateDocumentation() {
    appledoc \
    --no-create-docset \
    --output $OUTPUT_PATH \
    --project-name $PROJECT_NAME" "$VERSION \
    --project-version $VERSION \
    --company-id $ABOUT \
    --project-company $ABOUT $HEADER_PATH
}

CreateDocumentation