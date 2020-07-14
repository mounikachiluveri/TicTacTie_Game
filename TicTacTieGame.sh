#!/bin/bash -x
echo -e "\n Welcome to Tic-Tac-Toe game.\n"
echo -e "Player vs Computer\n"
switchPlayer=0
count=0
TOTAL_CELL=9
 function resettingBoard() {
        board=(. . . . . . . . . .)
}

 function displayBoard() {

        echo -e "****** Tic-Tac-Toe ******* \n|  ${board[1]}  ||  ${board[2]}  ||  ${board[3]}  |\n---------------------\n| ${board[4]}   ||  ${board[5]}  ||  ${board[6]}  |\n---------------->

}



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
                            echo -e "\n Player1 plays First\n"
                        else
                            echo -e "\nComputer plays First\n"
                        fi
                  }
    toss
