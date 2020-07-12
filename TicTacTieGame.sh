#!/bin/bash -x
echo -e "\n Welcome to Tic-Tac-Toe game.\n"
echo -e "Player vs Computer\n"
row=3
column=3
count=0
chance=1
numberOfShell=$(($row*$column))
   function resetBoard(){
        board=( 1 2 3 4 5 6 7 8 9 )
                 for (( columnValue=0,rowNumber=0;rowNumber<$row;columnValue=$(($columnValue+3)),rowNumber++ ))
                 do
                        echo -e "\t${board[columnValue]} | ${board[columnValue+1]} | ${board[columnValue+2]}"
                          if (($rowNumber!=$(($row-1))))
                          then
                             echo -e "\t---------"
                          fi
                 done
                    }
resetBoard

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


          function updatedBoard() {

                                 for (( columnValue=0,rowNumber=0;rowNumber<$row;columnValue=$(($columnValue+3)),rowNumber++ ))
                                 do
                                          echo -e "\t${board[columnValue]} | ${board[columnValue+1]} | ${board[columnValue+2]}"
                                              if (($rowNumber!=$(($row-1))))
                                              then
                                                       echo -e "\t---------"
                                              fi
                                 done
                                  }


         function playerInput() {
                          echo -e "\nPlayers 1's Turn:"
                         while ((1))
                         do
                              read -p "Select shell number: " shellNumber
                              if (( ($shellNumber<1) || ($shellNumber>9)))
                              then
                                     echo "Invalid, input 1...9"
                              elif (($shellNumber!=${board[$shellNumber-1]}))
                              then
                                     echo -e "Invalid: Shell is already occupied, choose again"

                              else
                              break
                              fi

                         done
                               board[$shellNumber-1]=$playerSymbol
                               updatedBoard
                               }


    function computerInput() {

                        echo -e "\nComputer's turn,"
                        shellNumber=$((RANDOM%9+1))
                        echo -e "Computer Selected winning shelll number: $shellNumber"
                        board[$shellNumber-1]=$computerSymbol
                        updatedBoard

                         }



       function switchToPlayer()
                             {

                                 while (( count<=$numberOfShell ))
                                 do

                                   if (( chance == 1))
                                   then
                                     playerInput
                                     chance=2
                                   else
                                      computerInput
                                      chance=1
                                   fi
                                      ((count++))
 echo $count


                               done
                         }
       switchToPlayer

