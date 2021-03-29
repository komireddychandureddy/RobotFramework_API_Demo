echo off
set source=%~dp0
set today=%Date:~0,2%_%Date:~3,2%_%Date:~6,8%
set t=%time:~0,8%
set t=%t::=%
set t=%t: =0%
set timestamp=%today%_%t%
echo %timestamp%
@echo "#######################################"
@echo "# Executing Demo API Testcases #"
@echo "#######################################"
robot --listener allure_robotframework --logtitle Demo_API_Regression_Report --reporttitle Demo_API_Regression_Report --outputdir %source%\Results\API_Reports KeywordTestcases\API_Demo_Test_Suite.robot 