#!/bin/bash -x
echo -e "\n Welcome to Tic-Tac-Toe game.\n"
echo -e "Player vs Computer\n"
switchPlayer=0
count=0
TOTAL_CELL=9
ROW=3
 function resettingBoard() {
        board=(. . . . . . . . . .)
}

 function displayBoard() {

        echo -e "****** Tic-Tac-Toe ******* \n|  ${board[1]}  ||  ${board[2]}  ||  ${board[3]}  |\n---------------------\n| ${board[4]}   ||  ${board[5]}  ||  ${board[6]}  |\n---------------------- \n|  ${board[1]}  ||  ${board[2]}  ||  ${board[3]}  | "

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
        ((count++))
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
         displayBoard
         checkingGameStatus
         switchPlayer=1
         switchPlayer
        
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
        for((start=1;$start<=$TOTAL_CELL;start=$(($start+3))))
        do
                if [[ ${board[$start]} == ${board[$start+1]} && ${board[$start+1]} == ${board[$start+2]} && ${board[$start+2]} == $1 ]]
                then
                        winner=1
                fi
        done
        for((start=1;start<=$ROW;start++))
        do
                if [[ ${board[$start]} == ${board[$start+3]} && ${board[$start+3]} == ${board[$start+6]} && ${board[$start]} == $1 ]]
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
function computerPlayingToWin() {
        for((loop=1;loop<=$TOTAL_CELL;loop++))
        do
                if [[ ${board[$loop]} == . ]]
                then
                        board[$loop]=$computerLetter
                        winningCondition $computerLetter
                        if [[ $winner -eq 1 ]]
                        then
                                displayBoard
                                echo "Winner is computer"
                                exit
                        else
                                board[$loop]="."
                                #block=0
                        fi
                fi
        done
}


function checkingGameStatus() {
         winningCondition $playerLetter
        if [[ $winner -eq 1 ]]
        then
                echo " player Winner"
                exit
        elif [[ $count -ge $TOTAL_CELL ]]
        then
                echo tie
        fi
}

function computerPlaying() {
	echo "========================="
        echo "Computer turn: "
        computerPlayingToWin
        position=$((RANDOM % 9 + 1))
        board[$position]=$computerLetter
         displayBoard

        switchPlayer=0
        switchPlayer
}
resettingBoard
tossToPlay
assignSymbol
displayBoard
switchPlayer
displayBoard
checkingGameStatus

