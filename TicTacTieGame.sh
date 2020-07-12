#!/bin/bash -x
echo -e "\n Welcome to Tic-Tac-Toe game.\n"
echo -e "Player vs Computer\n"
row=3
column=3
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
