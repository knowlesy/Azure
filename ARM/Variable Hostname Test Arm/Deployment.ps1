#test for configuring servername based on variables transferred from ps script 

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