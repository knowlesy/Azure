#Ref
#https://docs.microsoft.com/en-gb/azure/governance/policy/how-to/get-compliance-data#on-demand-evaluation-scan---azure-powershell
#https://www.stefanroth.net/2020/02/03/azure-policy-audit-and-deploy-cannotdelete-lock-on-resource-group-based-on-tags/
#https://www.reddit.com/r/AZURE/comments/nehn35/can_policy_apply_locks_to_resources_and/
#https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources?tabs=json#arm-template
##TAKE NOTE OF THE CONSIDERATIONS


$subscriptionId = '#####'
Connect-AzAccount -Subscription $subscriptionId


#starts a policy scan
Start-AzPolicyComplianceScan -ResourceGroupName "RG-#####"