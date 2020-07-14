#!/bin/bash -x
echo -e "\n Welcome to Tic-Tac-Toe game"
echo -e "Player vs Computer\n"
switchPlayer=0
count=0
TOTAL_CELL=9
function empty() {
        index=0
        for((i=1;i<=9;i++)){
            if [[ ${board[$i]} == . ]]
            then
                 emptyCells[$index]=$i
                let index++
            fi
        }
}




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

 function tossToPlay() {
        if [ $((RANDOM%2)) -eq 0 ]
        then
                echo "Player will play first."
        else
                echo "Computer will play first."
        fi
}

function switchPlayer() {
        echo "player letter : $playerLetter"
        echo "computer letter : $computerLetter"
        if [[ $switchPlayer == 0 ]]
        then
                playerPlaying
        else
                computerPlaying
        fi

}

function playerPlaying() {
        read -p "Enter position between 1 to 9: " position
        board[$position]=$playerLetter
        switchPlayer=1
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
        for((start=1;start<=$TOTAL_CELL;start=$(($start+3))))
        do
                if [[ ${board[$start]} == ${board[$start+1]} && ${board[$start+1]} == ${board[$start+2]} && ${board[$start+2]} == $1 ]]
                then
                        winner=1
                fi
        done
        for((i=1;i<=3;i++))
        do
                if [[ ${board[$start]} == ${board[$start+3]} && ${board[$start+3]} == ${board[$start+6]} && ${board[$start]} ==$1 ]]
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
                echo "Winner"
                exit
        elif [[ $count -ge $TOTAL_CELL ]]
        then
                echo tie
        fi
}
resettingBoard
tossToPlay
assignSymbol
displayBoard
switchPlayer
displayBoard
checkingGameStatus

