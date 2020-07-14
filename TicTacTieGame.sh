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

        echo -e "****** Tic-Tac-Toe ******* \n|  ${board[1]}  ||  ${board[2]}  ||  ${board[3]}  |\n---------------------\n| ${board[4]}   ||  ${board[5]}  ||  ${board[6]}  |\n---------------------\n|  ${board[7]}  ||  ${board[8]}  ||  ${board[9]}  |"

}


 function assignSymbol(){
        assign=$((RANDOM%2))
        if (($assign==1))
        then
             playerLetter='X'
             computerLetter='O'
        else
             playerLetter='O'
             computerLetter='X'
        fi

          echo -e "\nPlayer 1 = $playerLetter  Computer = $computerLetter"
}

 function toss(){
                        checkToss=$((RANDOM%2))
                        if (($checkToss == 1 ))
                        then
                            echo -e "\n player plays First\n"
                        else
                            echo -e "\nComputer plays First\n"
                        fi
}


 function playerPlaying() {
        echo "Player turn: "
        read -p "Enter position between 1 to 9: " position
        board[$position]=$playerLetter
        displayBoard
}
function switchPlayer() {

        if [[ $switchPlayer == 0 ]]
        then
                playerPlaying
        fi

}

resettingBoard
toss
assignSymbol
displayBoard
switchPlayer
displayBoard

