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
function checkingEmptyCell() {
        if [[ $position -ge 1 && $position -le 9 ]]
                then
                        if [[ ${board[$position]} == . ]]
                        then
                        echo "............ $turnChange is placed at $position ............"
                        ((count++))
                        else
                                echo "Cell is already occupied!!!"
                                switchPlayer
                        fi
         else
                 echo "Invalid cell value!!!"
                 switchPlayer
         fi
}

function winningCondition() {
        for((i=1;i<=$TOTAL_CELL;i=$(($i+3))))
        do
                if [[ ${board[$i]} == ${board[$i+1]} && ${board[$i+1]} == ${board[$i+2]} && ${board[$i+2]} == $1 ]]
                then
                        winner=1
                fi
        done
        for((i=1;i<=3;i++))
        do
                if [[ ${board[$i]} == ${board[$i+3]} && ${board[$i+3]} == ${board[$i+6]} && ${board[$i]} == $1 ]]
                then
                        winner=1
                fi
        done
        if [[ ${board[1]}  == ${board[5]} && ${board[5]} == ${board[9]} && ${board[5]} == $1 ]]
        then
                winner=1
        elif [[ ${board[3]}  == ${board[5]} && ${board[5]} == ${board[7]} && ${board[5]} == $1 ]]
        then
                winner=1
        fi
}

function checkingGameStatus() {
        if [[ $winner -eq 1 ]]
        then
                echo "Winner is $turnChange's"
                exit
        elif [[ $count -ge $TOTAL_CELL ]]
        then
                echo tie
        fi
}

resettingBoard
toss
assignSymbol
displayBoard
switchPlayer
displayBoard
checkingEmptyCell
winningCondition
checkingGameStatus

