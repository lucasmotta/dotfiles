title()
{
  str=$1
  len=${#str}

  formattedTitle=$(echo "$str" | awk '{print toupper($0)}')
  formattedLines=$(echo `yes ▔|head -${len}`|tr -d ' ')
  echo "\x1b[31m→ $formattedTitle\x1b[0m"
  echo "\x1b[31m  $formattedLines\x1b[0m"
}
