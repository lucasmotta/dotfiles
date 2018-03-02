question()
{
  question="\x1b[39;1m$1\x1b[0m"
  symbol="\x1b[2m[\x1b[0m\x1b[33m?\x1b[0m\x1b[2m]\x1b[0m"
  yesNo="\x1b[2m(y/\x1b[0m\x1b[97mN\x1b[0m\x1b[2m)\x1b[0m"

  echo "$symbol $question ${yesNo}"
}
