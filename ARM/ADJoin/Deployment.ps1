#ref 
#https://github.com/Azure/azure-quickstart-templates/tree/master/quickstarts/microsoft.compute/vm-domain-join
#this will utilise 2 mthods of passing passwords across ps input and keyvault
$subscriptionId = '#####'
$resourceGroupName = '######'
$location = 'uksouth'
$templateFile = 'azuredeploy.json'
$templateParameterFile = 'azuredeploy.parameters.json'

$adminPassword = Read-Host "Enter Admin Password" -AsSecureString

Connect-AzAccount -Tenant $tenentId -Subscription $subscriptionId

#only use below if you havent got a RG setup already 
New-AzResourceGroup -Name $resourceGroupName -Location $location

#create the vm/nic/join the domain below, you may want to run this in a test before going to execute 
New-AzResourceGroupDeployment -TemplateFile $templateFile `
-TemplateParameterFile $templateParameterFile `
-ResourceGroupName $resourceGroupName `
-location $location `
-adminPassword $adminPassword `
-Verbose