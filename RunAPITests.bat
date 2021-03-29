echo off
set source=%~dp0
set today=%Date:~10,4%%Date:~4,2%%Date:~7,2%
set t=%time:~0,8%
set t=%t::=%
set t=%t: =0%
set timestamp=%today%_%t%
echo %timestamp%
@echo "#######################################"
@echo "# Executing Demo API Testcases #"
@echo "#######################################"
robot --logtitle Demo_API_Regression_Report --reporttitle Demo_API_Regression_Report --outputdir %source%\Results\API_Reports KeywordTestcases\API_Demo_Test_Suite.robot 