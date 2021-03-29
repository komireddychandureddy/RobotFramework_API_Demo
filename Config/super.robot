*** Settings ***
Library           RequestsLibrary
Library           FakerLibrary
Library           String
Library           Collections
Library           Screenshot
Library           DateTime
Library           ../Library/CustomLibrary.py
Resource          common_variables.robot
Resource          api_variables.robot
Resource          ../Keywords/api_common.robot
Resource          ../Keywords/users.robot
