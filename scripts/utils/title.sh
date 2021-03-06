title()
{
  str=$1
  len=${#str}

  formattedTitle=$(echo "$str" | awk '{print toupper($0)}')
  formattedLines=$(echo `yes ▔|head -${len}`|tr -d ' ')
  echo "🔥 $formattedTitle"
  echo "   $formattedLines"
}
