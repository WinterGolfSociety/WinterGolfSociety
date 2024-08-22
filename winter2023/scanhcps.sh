
#xdotool sleep 3
#blog "copy screen to clipboard" ${LINENO}
# populate clipboard with screen data
#xdotool key Ctrl+a
#xdotool sleep 1
#xdotool key Ctrl+c
#xdotool sleep 1
sleep 2
wmctrl -a "England Golf"
xdotool search --onlyvisible --class "England Golf" key Ctrl+l


aplayers=(
'Graham Airey',
'Dale Aitkenhead',
'Stephen Alldridge',
'Keith Belshaw',
'Malcolm Broom',
'Neil Brotherton',
'Craig Caesar',
'Clive Caisley',
'Chris Chelton',
'Ken Clark',
'Ian Collier',
'Rob Connelly',
'Jed Cornhill',
'Alex Coupland',
'Neil Coxon',
'Bryan Craggs',
'And Davison',
'John Dean',
'Peter Dodds',
'Martin Edwards',
'Jo Fletcher',
'Norman Ford',
'Will French',
'Norman Gilholm',
'David Gilroy',
'Graeme Gow',
'Vince Graham',
'Chris Green',
'Rob Green',
'Richard Hedley',
'Barry Henderson',
'Clive Herbert',
'David Hersey',
'Ken Heslop',
'Barry Hill',
'Colin Hills',
'Pete Holleran',
'Roger Ireland',
'David Jackson',
'John Jackson',
'Thom Lemin',
'Martin Leonard',
'Jam Little',
'Bryan Maddison',
'James Main',
'T Main',
'John Matthews',
'Thom McNally',
'Ste Murray',
'Darren Nelson',
'Trevor Ord',
'Tim Pinkney',
'Mich Riddell',
'Eric Saddler',
'David Scurfield',
'Brian Simpson',
'John E Smith',
'Tony Smith',
'Ray Straker',
'Thom Straker',
'Neil Tait',
'Rol Thompson',
'Bob Toward',
'Trevor Towns',
'Jo Waddle',
'Marcus Wilkinson',
'Gordon Willis',
'Ron Woodcock'
)











for player in "${aplayers[@]}"
do
    xdotool sleep 2
    xdotool key Ctrl+l
    xdotool sleep 2
    # 6 tabs to enter name
    xdotool key Tab
    xdotool sleep 2
    xdotool key Tab
    xdotool sleep 2
    xdotool key Tab
    xdotool sleep 2
    
     xdotool key Tab
    xdotool sleep 2
    xdotool key Tab
    xdotool sleep 2
    xdotool key Tab
    xdotool sleep 2
    
     xdotool key Tab
    xdotool sleep 2

    
    
    
    
    # type name
    xdotool type --delay=100 "$player"
    xdotool sleep 4
    # enter
    #xdotool key Return
    #xdotool sleep 1
    # 3 tabs
    xdotool key Tab
    xdotool sleep 1
    xdotool key Tab
    xdotool sleep 1
    xdotool key Tab
    xdotool sleep 1
    # enter
    #xdotool key Return
    #xdotool sleep 2
    # ctrl a
    xdotool key Ctrl+a
    xdotool sleep 2
    # ctrl c
    xdotool key Ctrl+c
    xdotool sleep 2
    
    newhcp="none"
        
    while IFS= read line; do
    
    #echo ".........................$line"
    
        if [[ "$line" == *"Index:"* ]] ; then
         if [[ "$line" != *"Low "* ]] ; then
            newhcp=$line
        fi    
        fi
    done < <(xclip -o -selection clipboard)
 
  
    
# do name conversions between england golf and us  
    
    playerx=$player 
    
  if [[ $player == "Andrew Davison" ]]; then
     playerx = "Andy Davison"
  fi
  if [[ $player == "William French" ]]; then
     playerx = "Bill French"
  fi
  if [[ $player == "David Jackson" ]]; then
     playerx = "Dave Jackson"
  fi
  if [[ $player == "David T Jackson" ]]; then
     playerx = "David.T Jackson"
  fi
  if [[ $player == "Thomas Lemin" ]]; then
     playerx = "Tom Lemin"
  fi
  if [[ $player == "James Little" ]]; then
     playerx = "Jim Little"
  fi
   if [[ $player == "George Martin" ]]; then
     playerx = "Tony Martin"
  fi     
  if [[ $player == "Thomas McNally" ]]; then
     playerx = "Tom McNally"
  fi
   if [[ $player == "Daniel Norman" ]]; then
     playerx = "Danny Norman"
  fi
   if [[ $player == "Michael Riddell" ]]; then
     playerx = "Mike Riddell"
  fi
  if [[ $player == "Thomas Straker" ]]; then
     playerx = "Tom Straker"
  fi
   if [[ $player == "James Young" ]]; then
     playerx = "Jim Young"
  fi

# write out results
    newhcp=$(echo "$newhcp" | sed 's/Index: /,/')
    
    echo "$playerx$newhcp"
    
done
