#!/usr/bin/env bash

cyan='\e[1;36m'
green='\e[1;32m'
red='\e[0;31m'
purple='\e[1;35m'
pink='\e[1;31m'
darkblue='\e[0;34m'
smoothblue='\e[1;34m'
grey='\e[0;37m'
yellow='\e[1;33m'
white='\e[1;37m'
neutral='\e[0;39m'

is_there_good_argvs()
{
    ./groundhog $1 $2 &> saveres
    if [ "$?" -eq $5 ]
    then
        echo -e "${white}TEST:  ${cyan}$4  \e[32mPASSED\e[39m"
        EXIT=0
    else
        echo -e "${white}TEST:  ${cyan}$4  \e[91mFAIL\e[39m"
        EXIT=1
    fi
}

is_there_good_argument()
{
    ./groundhog $1 &> saveres
    if [ "$?" -eq $3 ]
    then
        echo -e "${white}TEST:  ${cyan}$2  \e[32mPASSED\e[39m"
        EXIT=0
    else
        echo -e "${white}TEST:  ${cyan}$2  \e[91mFAIL\e[39m"
        EXIT=1
    fi
}

is_there_Makefile()
{
    if [ -f Makefile ]
    then
        echo -e "${white}TEST:  ${cyan}$1  \e[32mPASSED\e[39m"
        EXIT=0
    else
        echo -e "${white}TEST:  ${cyan}$1  \e[91mFAIL\e[39m"
        EXIT=1
    fi
}

compare_output()
{
    cat $2 | ./groundhog $1 > saveres
    diff -s saveres $3 > tmp
    if [ "$?" -eq 0 ]
    then
        echo -ne "${white}TEST:  ${cyan}$4  \e[32mPASSED\e[39m\n"
        EXIT=0
    else
        echo -ne "${white}TEST:  ${cyan}$4  \e[91mFAIL\e[39m\n"
        EXIT=1
    fi
    rm tmp
}

echo -e "${pink}Beginning of error handling tests."
is_there_Makefile "Valid Makfile in directory"
is_there_good_argvs "123" "456" "432" "Too much arguments, return 84" "84"
is_there_good_argument "aaa" "Invalid argument if argv[1] = aaa, return 84" "84"
is_there_good_argument "ZEZ" "Invalid argument if argv[1] = ZEZ, return 84" "84"
is_there_good_argument "" "Invalid argument if argv[1] = Nothing, return 84" "84"
echo -e "${pink}End of error handling tests."
echo -e ""
echo -e "${pink}Beginning of project tests."
compare_output "7" "tests/subjectInput.txt" "tests/subjectOutput.txt" "Subject test"
compare_output "2" "tests/period2input.txt" "tests/period2Answer.txt" "Test with period of 2 (look at tests/period2input.txt for more informations)"
compare_output "5" "tests/period5input.txt" "tests/period5Answer.txt" "Test with period of 5 (look at tests/period5input.txt for more informations)"
compare_output "10" "tests/period10input.txt" "tests/period10Answer.txt" "Test with period of 10 (look at tests/period10input.txt for more informations)"
compare_output "14" "tests/period14input.txt" "tests/period14Answer.txt" "Test with period of 14 (look at tests/period14input.txt for more informations)"
echo -e "${pink}End of project tests."
echo -e ""
echo -e "${purple}By Noki, enjoy <3"
echo -e "${neutral}"
rm -f saveres

exit $EXIT
