#ref
#https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-tags?tabs=azure-powershell
#https://stackoverflow.com/questions/51392382/concatenate-objects-in-arm-template
#test on variable tags 

$subscriptionId = '###'
$resourceGroupName = '###'
$location = 'uksouth'
$templateFile = 'azuredeploy.json'
$templateParameterFile = 'azuredeploy.parameters.json'
$name = "ABC"
$environment = "PROD"
$function = "FS"

$adminPassword = Read-Host "Enter Admin Password" -AsSecureString

Connect-AzAccount -Subscription $subscriptionId

#validate files
$testErrors = Test-AzResourceGroupDeployment -TemplateFile $templateFile `
-TemplateParameterFile $templateParameterFile `
-ResourceGroupName $resourceGroupName `
-location $location `
-adminPassword $adminPassword `
-name $name  `
-environment $environment  `
-function $function  `
-Verbose
$testErrors

#create the vm/nic/join the domain below, you may want to run this in a test before going to execute 
New-AzResourceGroupDeployment -TemplateFile $templateFile `
-TemplateParameterFile $templateParameterFile `
-ResourceGroupName $resourceGroupName `
-location $location `
-adminPassword $adminPassword `
-name $name  `
-environment $environment  `
-function $function  `
-Verbose