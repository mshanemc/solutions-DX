sfdx shane:org:create -f config/project-scratch-def.json -d 1 -s -n --userprefix admin --userdomain electron.demo

sfdx force:source:push
sfdx force:user:permset:assign -n electron

sfdx automig:load -d data
sfdx shane:theme:activate -n Electron
sfdx force:org:open -p /lightning/o/Lead/list?filterName=All_Leads
sfdx shane:user:password:set -g User -l User -p sfdx1234

sfdx shane:heroku:repo:deploy -g gabesumner -r electron-website -n `basename "${PWD/mshanemc-/}"` -t autodeployed-demos
sfdx shane:heroku:connect -a `basename "${PWD/mshanemc-/}"` -f config/heroku-connect-mappings.json -e custom
