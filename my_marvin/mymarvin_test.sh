#!/bin/bash

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

testDockerfile()
{
    if [ -f Dockerfile ]
    then
        echo -e "${white}TEST:  ${purple}$1  \e[32mPASSED\e[39m"
        EXIT=0
    else
        echo -e "${white}TEST:  ${purple}$1  \e[91mFAIL\e[39m"
        EXIT=1
    fi
}

testDockerCompose()
{
    if [ -f docker-compose.yml ]
    then
        echo -e "${white}TEST:  ${purple}$1  \e[32mPASSED\e[39m"
        EXIT=0
    else
        echo -e "${white}TEST:  ${purple}$1  \e[91mFAIL\e[39m"
        EXIT=1
    fi
}

testGroovyFile()
{
    if [ -f *.groovy ]
    then
        echo -e "${white}TEST:  ${purple}$1  \e[32mPASSED\e[39m"
        EXIT=0
    else
        echo -e "${white}TEST:  ${purple}$1  \e[91mFAIL\e[39m"
        EXIT=1
    fi
}

testMyMarvinYMLFile()
{
    if [ -f my_marvin.yml ]
    then
        echo -e "${white}TEST:  ${purple}$1  \e[32mPASSED\e[39m"
        EXIT=0
    else
        echo -e "${white}TEST:  ${purple}$1  \e[91mFAIL\e[39m"
        EXIT=1
    fi
}

testEnvFile()
{
    if [ -f .env ]
    then
        echo -e "${white}TEST:  ${purple}$1  \e[32mPASSED\e[39m"
        EXIT=0
    else
        echo -e "${white}TEST:  ${purple}$1  \e[91mFAIL\e[39m"
        EXIT=1
    fi
}

echo -e "${red}Debut des tests de fichiers dans le directory."
testDockerfile "Valid Dockerfile in directory."
testDockerCompose "Valid docker-compose in directory."
testGroovyFile "Valid .groovy file in directory."
testMyMarvinYMLFile "Valid my_marvin.yml file in directory."
testEnvFile "Valid .env file in directory."
echo -e "${red}Fin des tests de fichiers dans le directory.\n"
echo -e "${yellow}By Noki, enjoy <3"
echo -e "${neutral}"
rm -f saveres

exit $EXIT