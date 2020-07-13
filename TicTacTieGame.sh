row=3
column=3
count=0
chance=1
numberOfShell=$(($row*$column))
function displayBoard(){
          board=( . . . . . . . . . )
          for (( columnValue=0,rowNumber=0;rowNumber<$row;columnValue=$(($columnValue+3)),rowNumber++ ))
          do
                   echo -e "\t${board[columnValue]} | ${board[columnValue+1]} | ${board[columnValue+2]}"
                      if (($rowNumber!=$(($row-1))))
                      then
                           echo -e "\t---------"
                      fi
         done
                      }
displayBoard

  function assignSymbol(){
                       assign=$((RANDOM%2))
                       if (($assign==1))
                       then
                             playerSymbol='X'
                             computerSymbol='O'
                       else
                             playerSymbol='O'
                             computerSymbol='X'
                       fi

                                  echo -e "\nPlayer 1 = $playerSymbol  Computer = $computerSymbol"

                          }
  assignSymbol

