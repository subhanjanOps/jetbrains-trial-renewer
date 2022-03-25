#!/bin/bash
#!/bin/sh
# reset jetbrains ide evals

echo ""
echo "## Reset trial period of your JetBrains IDE ##"
echo ""
OS_NAME=$(uname -s)

echo "OS: $OS_NAME"
if [[ $OS_NAME -eq "Linux" ]]; then
    echo "Patch: Supported"
else
    echo "Patch: Not Supported"
    exit 0
fi

echo ""

JB_PRODUCTS=("IntelliJIdea" "CLion" "PhpStorm" "GoLand" "PyCharm" "WebStorm" "Rider" "DataGrip" "RubyMine" "AppCode")

for i in ${!JB_PRODUCTS[@]}; do
    echo "$((i+1)). ${JB_PRODUCTS[$i]}"
done

read -p "Enter JetBrains Product ID: " PRD_ID

if [ $PRD_ID -lt 1 ] || [ $PRD_ID -ge ${#JB_PRODUCTS[@]} ]; then
    echo "Invalid input. Please select from the list..."
    exit 0
fi
PRD=${JB_PRODUCTS[PRD_ID-1]}

echo ""
echo $PRD "is currently resetting the trial period..."
echo ""

rm -rf ~/.java/.userPrefs/prefs.xml
rm -rf ~/.java/.userPrefs/jetbrains/prefs.xml
rm -rf ~/.config/JetBrains/${PRD}*/eval/
rm -rf ~/.config/JetBrains/${PRD}*/options/other.xml

echo "Reset has been executed successfully..."
echo "Enjoy!"