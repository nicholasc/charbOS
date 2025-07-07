# Configure identification
echo -e "\nEnter identification ..."
export CHARBOS_USER_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export CHARBOS_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")