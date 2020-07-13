#!/bin/bash -x
echo -e "\n Welcome to Tic-Tac-Toe game.\n"
echo -e "Player vs Computer\n"
row=3
column=3
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

                                  echo -e "\nPlayer 1 = $playerSymbol"
                                  echo -e "Computer = $computerSymbol"

                                   }
  assignSymbol
  function toss(){
                        checkToss=$((RANDOM%2))
                        if (($checkToss == 1 ))
                        then
                            echo -e "\n Mounika plays First\n"
                        else
                            echo -e "\nComputer plays First\n"
                        fi
                  }
    toss
